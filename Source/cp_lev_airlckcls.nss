//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_lev_airlckcls.utt in lev_m40ad (Leviathan Bridge).
	
	This is the OnEnter for a new trigger added to close and lock the forward inner
	airlock door that leads to the outer hull walkway, since the party trying to go
	back through that route after defeating Admiral Karath can cause the player to
	be permanently stuck in the space suit appearance. 
	
	See also cp_lev_airlckcls.ncs.
	
	Issue #338: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/338
	
	DP 2020-06-03																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("Bastila", 0);
	object oCarth = GetObjectByTag("Carth", 0);
	object oDoor = GetNearestObjectByTag("lev40_airlockin", OBJECT_SELF);
	
	if (oEntering == oPC && CP_HasNeverTriggered())
		{
			// Add a safety provision to make sure party members don't get locked out
			// of the level (even though they should already be jumped past the door)
			
			if (!GetIsInCombat(oBastila) && GetDistanceBetween(oPC, oBastila) > 6.0)
				{
					AssignCommand(oBastila, ClearAllActions());
					AssignCommand(oBastila, ActionMoveToObject(oPC, TRUE, 2.0));
					AssignCommand(oBastila, ActionDoCommand(UT_StartCombat(oBastila)));
				}
			
			if (!GetIsInCombat(oCarth) && GetDistanceBetween(oPC, oCarth) > 6.0)
				{
					AssignCommand(oCarth, ClearAllActions());
					AssignCommand(oCarth, ActionMoveToObject(oPC, TRUE, 2.0));
					AssignCommand(oCarth, ActionDoCommand(UT_StartCombat(oCarth)));
				}
			
			DelayCommand(5.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
			DelayCommand(6.0, SetLocked(oDoor, TRUE));
		}
}
