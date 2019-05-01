////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by first node of tar10_kandon01.dlg in tar_m10aa (Taris Black Vulkar
	Base Upper Level).

	This script is fired by Kandon's dialogue if the player has killed Gadon
	and returned to the Vulkar base. It directs him to the appropriate location
	depending on which entrance the party has used (Lower City or sewers elevator)
	and, if the former, switches the static camera used for the opening shot.
	Due to changes made to Kandon's spawn-in scripts (see k_ptar_spawnkand and
	k_ptar_spwnkand2), jumping the party into pre-set positions, some tweaks were
	made to Kandon's position on the Lower City side to maintain a suitable
	distance from the PC, and the whole scene was pushed a few meters further
	into the hallway so it didn't trigger instantly on module load.

	DP 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	object oKandon = GetObjectByTag("KandonArk101", 0);
	object oLwrCtyWP = GetObjectByTag("tar10_wpkandon2", 0);
	location lTarget;
	location lLwrCty = Location(Vector(153.25,69.0,2.26), 0.0);
	location lSewers = Location(Vector(196.427,131.023,2.26), 0.0);
	
	if (GetDistanceToObject(oLwrCtyWP) < 20.0)
		{
			lTarget = lLwrCty;
		}
	else
		{
			lTarget = lSewers;
		}
	
	UT_SetPlotBooleanFlag(OBJECT_SELF, 9, TRUE);
	
	if (UT_GetPlotBooleanFlag(OBJECT_SELF, 0))
		{
			SetDialogPlaceableCamera(4);
		}
	
	ActionPauseConversation();
	AssignCommand(oKandon, ActionMoveToLocation(lTarget, FALSE));
	AssignCommand(oKandon, SetFacingPoint(GetPosition(oPC)));
	ActionResumeConversation();
}