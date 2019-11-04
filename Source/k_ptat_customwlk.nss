//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_01cust_01.dlg in tat_m17ab (Tatooine Docking Bay).
	
	This script fires on the opening node of the DLG that triggers the first time
	you leave the Ebon Hawk when arriving on Tatooine, playing the scene where the
	Czerka customs officer accosts you about the landing fee. It sets the TalkedTo
	flag and moves the customs officer towards the party. The vanilla script walks
	him to a waypoint, but since the party has now been jumped a couple of meters
	further forwards, it has been changed to walk him to within 2m of the player
	instead.
	
	See also cp_tat_custmove2, k_ptat_custmove, k_ptat_customs.
	
	Issue #308: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/308
	
	DP 2019-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	
	if (UT_GetTalkedToBooleanFlag(OBJECT_SELF) == FALSE)
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
		}
	
	ActionMoveToObject(oPC, FALSE, 2.0);
}
