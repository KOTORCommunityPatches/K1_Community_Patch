////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for man26_cutsel01.utc in manm26ae (Manaan East Central).
	
	This is the UserDefine for the Selkath Officer that comes to arrest the player
	outside the Republic Embassy post-Hrakert Rift. It controls the initial walk
	of the Selkath towards the player. The destinations and timings have been
	tweaked to prevent him running into the door and getting to his end point at
	around the same time the player reaches their destination.
	
	See also cp_man26ae_am01, cp_man26ae_am02, cp_man26ae_amend.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2023-12-21																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oInvis = GetObjectByTag("man26ae_cut01");
	object oWP = GetWaypointByTag("cut_man26_cutsel02");
	int nUser = GetUserDefinedEventNumber();
	location lEnd = Location(Vector(46.76,62.08,57.50), 0.00);
	
	if (nUser == 10) // man26_selambush.dlg entry 1, signalled from k_pman_post04 (via k_pman_post03).
		{
			ActionWait(1.0);
			ActionMoveToObject(oWP);
			ActionDoCommand(SignalEvent(oInvis, EventUserDefined(0)));
		}
	else if (nUser == 20) // man26_selambush.dlg entry 2, signalled from k_pman_post09.
		{
			ActionMoveToLocation(lEnd);
			ActionDoCommand(SignalEvent(oInvis, EventUserDefined(0)));
		}
}
