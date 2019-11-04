//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_01cust_01.dlg in tat_m17ab (Tatooine Docking Bay).
	
	This fires on most exit nodes of the conversation with the Czerka customs
	officer to send him back to his starting point. The vanilla script didn't
	add the facing command to his action stack, so he would usually end up
	facing away from the Hawk rather than towards it like he was supposed to.
	
	N.B. The vanilla script is global, not module-specific, for some reason.
	
	See also cp_tat_custmove2, k_ptat_customs, k_ptat_customwlk.
	
	Issue #308: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/308
	
	DP 2019-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oWaypoint = GetWaypointByTag("tat17_custompost");
	
	ActionMoveToObject(oWaypoint);
	ActionDoCommand(SetFacing(DIRECTION_NORTH));
}
