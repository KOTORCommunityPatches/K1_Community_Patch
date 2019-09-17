////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_ptar_davalarm in tar_m08aa (Taris Davik's Estate).

	This is the original script that fired when certain guest conversations
	end with the subject going hostile. An intermediary script was added
	to equip the first weapon in their inventory if unarmed before firing
	this script to prevent the attacking with fists AI problem. 
	
	See also k_ptar_davalarm.
	
	2019-09-17 Updated to streamline code with vanilla include functions.
	
	Issue #100: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/100

	DP 2019-05-09                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void RunToPC() {
	
	ClearAllActions();
	ActionMoveToObject(GetFirstPC(), TRUE);
}

void main() {
	
	object oGuard;
	object oDoor = GetObjectByTag("ptar_thronedoor", 0);
	
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	
	if (GetIsObjectValid(oGuard = GetNearestObjectByTag("davikguard02", OBJECT_SELF, 1)))
		{
			AssignCommand(oGuard, RunToPC());
		}
	
	if (GetIsObjectValid(oGuard = GetNearestObjectByTag("davikguard02", OBJECT_SELF, 2)))
		{
			AssignCommand(oGuard, RunToPC());
		}
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	
	GN_DetermineCombatRound(OBJECT_INVALID);
}
