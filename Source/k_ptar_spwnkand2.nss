////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_spawnkando.utt in tar_m10aa (Taris Black Vulkar Base Upper
	Level - Lower City entrance).

	This script fires when the player returns to the Vulkar base after having
	killed Gadon. It spawns Kandon in and initiates dialogue. Edited to jump
	the party into position, since the vanilla scene tends to end up sloppily
	positioned with party members standing in front of the PC.
	
	Since there are two possible entrances, there are two triggers and two
	versions of this script. This one is fired by the trigger at the Lower City
	entrance, the other is at the sewers elevator (although, seriously, does
	anyone actually go the super long way around and enter by the sewers again?).
	See also k_ptar_spawnkand.

	DP 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

// Prototypes
void SpawnKand();

void SpawnKand() {

	object oKandon;
	object oHostiles;
	object oSntDrd = GetObjectByTag("BartenderDroid");
	location lKanspwn = Location(Vector(153.25,79.175,2.255), 180.0);
	
	oKandon = CreateObject(OBJECT_TYPE_CREATURE, "tar10_kandona001", lKanspwn, FALSE);
	
	oHostiles = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
	
	while (GetIsObjectValid(oHostiles))
		{
			if (((GetObjectType(oHostiles) == 1) && (GetStandardFaction(oHostiles) == 1)))
				{
					DestroyObject(oHostiles, 0.0, TRUE, 0.0);
				}
		
			oHostiles = GetNextObjectInArea(OBJECT_INVALID, 1);
		}
		
    if (GetIsObjectValid(oSntDrd))
		{
			DestroyObject(oSntDrd, 0.0, TRUE, 0.0);
		}
}

void main() {

	object oEntering = GetEnteringObject();
	object oKan = GetObjectByTag("KandonArk101", 0);
	location lWP_PC = Location(Vector(153.25,63.0,2.255), 0.0);
	location lWP_PM1 = Location(Vector(155.0,61.0,2.255), 0.0);
	location lWP_PM2 = Location(Vector(151.45,61.0,2.255), 0.0);

	if ((((GetIsPC(oEntering) && (!UT_GetTalkedToBooleanFlag(OBJECT_SELF))) && GetGlobalBoolean("Tar_GadonDead")) && (!GetGlobalBoolean("Tar_SwoopRace"))))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, 1);
			UT_SetPlotBooleanFlag(oKan, 0, 1);
			SetGlobalFadeOut(0.0, 1.0, 0.0, 0.0, 0.0);
			NoClicksFor(1.2);
			DelayCommand(1.0, SpawnKand());
			DelayCommand(1.0, CP_DLGSetup("KandonArk101"));
			DelayCommand(1.0, CP_DLGHerder(lWP_PC, lWP_PM1, lWP_PM2, FALSE, FALSE));
			DelayCommand(1.0, CP_DLGInit("KandonArk101", "", FALSE, 0.5, 2.0));
		}
}