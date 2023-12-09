//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_detcompdlg.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is tweak of the vanilla script that fires when the chosen jail breaker on
	the Leviathan opens the torture chamber and brig doors. The original would spawn
	a stunt version of Canderous that was wearing plain clothes, regardless of what
	the real Canderous was wearing if he was the chosen jail breaker. This has now
	been switched to use the party table version of him if he was the jail breaker.
	
	Updated 2023-08-17 to tweak the spawn position of Canderous in conjunction with
	some camera angle changes, remove the extraneous spawning of a stunt Canderous,
	and rejig the script to more closely replicate the original, since that has now
	been decompiled fully.
	
	Updated 2023-12-08 to swap the invisible placeable DLG owner from starting a
	conversation with itself to starting it with the PC. The former approach made
	all of the PC's lines in the feedback window show up as being spoken by the
	placeable. Also unequipped the stunt version of Canderous when he wasn't the
	chosen jail breaker, since otherwise he is fully armed and operational.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	Issue #569: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/569
	
	DP 2022-12-17 / DP 2023-08-17 / DP 2023-12-08								*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void Start_Scene() {
	object oInvis = GetObjectByTag("lev40_freetalker", 0);
	int nJailBreaker = GetGlobalNumber("Lev_Escape");
	location lCand = Location(Vector(22.88,59.06,9.00), -90.00);
	
	// Switch controlled character from the jail breaker to the PC.
	SwitchPlayerCharacter(NPC_PLAYER);
	
	DelayCommand(0.2, AssignCommand(GetFirstPC(), ActionJumpToObject(GetObjectByTag("lev40_wppcesc", 0), FALSE)));
	
	// Spawn Canderous if he was the jail breaker, since he got nuked by the SwitchPlayerCharacter call.
	// Use the party table version to preserve any equipped gear.
	if (nJailBreaker == 4)
		{
			UT_SpawnAvailableNPC(NPC_CANDEROUS, lCand);
		}
		else
			{
				// If Canderous wasn't the jail breaker then a dummy version using his global template was
				// already spawned previously. Make sure to disarm him since he was supposed to be in jail.
				object oStuntCand = GetObjectByTag("cand", 0);
				AssignCommand(oStuntCand, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oStuntCand), TRUE));
				AssignCommand(oStuntCand, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oStuntCand), TRUE));
			}
	
	DelayCommand(0.5, AssignCommand(oInvis, ActionStartConversation(GetFirstPC())));
}

void main() {
	
	object oCellDoor = GetObjectByTag("lev40_celldoor", 0);
	object oPtyDoor = GetObjectByTag("lev40_partycelldoor", 0);
	object oGrndZero = GetObjectByTag("lev40_groundzero", 0);
	object oCage;
	int nCnt;
	
	SetGlobalFadeOut();
	
	NoClicksFor(1.5);
	
	SetGlobalNumber("LEV_ELEVATOR", 1);
	SetGlobalBoolean("LEV_RESCUE", TRUE);
	
	// Kill any remaining mooks in the main corridor that may have been stealthed past.
	SignalEvent(oGrndZero, EventUserDefined(2000));
	
	// Open the doors to the party cell and torture chamber.
	AssignCommand(oCellDoor, ActionOpenDoor(oCellDoor));
	AssignCommand(oCellDoor, ActionOpenDoor(oPtyDoor));
	
	// Deactivate the force cages in the torture chamber.
	nCnt = 0;
	
	while (GetIsObjectValid(oCage = GetObjectByTag("lev40_tortcage", nCnt)))
		{
			AssignCommand(oCage, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
			
			nCnt++;
		}
	
	DelayCommand(0.1, Start_Scene());
}
