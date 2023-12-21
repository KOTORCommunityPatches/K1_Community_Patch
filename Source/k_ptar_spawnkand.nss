////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_spawnkando.utt in tar_m10aa (Taris Black Vulkar Base Upper
	Level - Sewers elevator entrance).
	
	This script fires when the player returns to the Vulkar base after having
	killed Gadon. It spawns Kandon in and initiates dialogue. Edited to jump
	the party into position, since the vanilla scene tends to end up sloppily
	positioned with party members standing in front of the PC. Also changed
	Kandon's spawn location from around the corner to straight down the
	corridor to remove the janky walking alignment and to stop screwing with
	party facing (they face the spawn-in point, not the destination).
	
	Since there are two possible entrances, there are two triggers and two
	versions of this script. This one is fired by the trigger at the sewers
	elevator, the other is at the Upper City entrance (although, seriously,
	does anyone actually go the super long way around and enter by the sewers
	again?). 
	
	Updated 2023-12-21 to add in a hold world fade in conjunction with editing
	the trigger geometry to pop the scene as soon as the player enters. Also
	toggled the party member's AI to ensure they obey commands for good measure
	and streamlined/cleaned up some of the code.
	
	See also k_ptar_spwnkand2.
	
	Issue #62: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/62
	
	DP 2019-05-01 / DP 2023-12-21												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void SpawnKand() {
	object oKandon;
	object oHostile;
	object oSntDrd = GetObjectByTag("BartenderDroid");
	location lKanspwn = Location(Vector(196.25,119.546,2.26), 90.0);
	
	oKandon = CreateObject(OBJECT_TYPE_CREATURE, "tar10_kandona001", lKanspwn, FALSE);
	
	oHostile = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
	
	while (GetIsObjectValid(oHostile))
		{
			if (GetObjectType(oHostile) == OBJECT_TYPE_CREATURE && GetStandardFaction(oHostile) == STANDARD_FACTION_HOSTILE_1)
				{
					DestroyObject(oHostile, 0.0, TRUE);
				}
		
			oHostile = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
		}
		
    if (GetIsObjectValid(oSntDrd))
		{
			DestroyObject(oSntDrd, 0.0, TRUE);
		}
}

void main() {

	object oEntering = GetEnteringObject();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(196.25,137.25,2.26), 0.0);
	location lPM1 = Location(Vector(194.65,139.25,2.26), 0.0);
	location lPM2 = Location(Vector(197.7,139.25,2.26), 0.0);
	
	if (GetIsPC(oEntering) && GetGlobalBoolean("Tar_GadonDead") && !GetGlobalBoolean("Tar_SwoopRace") && CP_HasNeverTalkedTo())
		{
			HoldWorldFadeInForDialog();
			SetGlobalFadeOut();
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_ToggleAI(oPM1);
			CP_ToggleAI(oPM2);
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(1.0, SpawnKand());
			
			DelayCommand(1.0, CP_DLGInit("KandonArk101", "", FALSE, 0.5, 2.0));
		}
}
