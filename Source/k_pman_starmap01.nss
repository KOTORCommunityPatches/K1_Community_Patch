//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man28_starmap.dlg in manm28ad (Manaan Hrakert Rift).
	
	This is the script that fires at the start of the cutscene of discovering the
	star map in Manaan Hrakert Rift. It simply moves the player towards the map.
	The original passed this out to an external script, which seemed unnecessary.
	It has also been changed to walk them to a specific location.
	
	See also k_pman_starmap02.
	
	Issue #734: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/734

	Issue #756: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/756

	DP 2023-12-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oSelf = OBJECT_SELF;
	location lPC = Location(Vector(190.11,107.23,6.00), 0.00);
	
	ActionPauseConversation();
	
	CP_RemoveForceSpeed(oPC);
	
	CP_PartyMove(oPC, lPC, FALSE);
	
	DelayCommand(1.0, AssignCommand(oPC, ActionDoCommand(SignalEvent(oSelf, EventUserDefined(0)))));
}
