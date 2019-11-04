//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_01cust_01.dlg in tat_m17ab (Tatooine Docking Bay).
	
	This is a modified version of k_ptat_custmove, which sends the customs officer
	back to his starting point after he accosts the player about the landing fee.
	The vanilla DLG didn't fire the script on the exit node of the branch where
	you tell him to stay out of your business, as it ends on the officer's entry,
	not a following empty reply node like the other exits. Presumably they did so
	to prevent him walking during the line, so this version delays the walk command
	until after the line is completed.
	
	See also k_ptat_custmove, k_ptat_customs, k_ptat_customwlk.
	
	Issue #308: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/308
	
	DP 2019-11-05																*/
//////////////////////////////////////////////////////////////////////////////////


void CP_CustOffMove() {
	
	object oWaypoint = GetWaypointByTag("tat17_custompost");
	
	ActionMoveToObject(oWaypoint);
	ActionDoCommand(SetFacing(DIRECTION_NORTH));
}

void main() {
	
	DelayCommand(7.0, CP_CustOffMove());
}
