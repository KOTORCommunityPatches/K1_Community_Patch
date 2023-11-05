//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_gana021.dlg in tar_m02ae (Taris Upper City Cantina).
	
	This is script fires on the exit node when peacefully resolving the encounter
	with Gana Lavin in the Taris Upper City Cantina. The vanilla script commanded
	the waiter to resume walking waypoints, but that has now been tweaked slightly
	to first manually walk him to waypoints near the room's exit before resuming
	his random waypoint walk, in order to keep him out of the way of the party for
	as long as possible. The script has also been added to the other branches where
	Gana runs off, since the waiter has now been jumped out of the way at the start
	of the conversation.
	
	See also cp_tar02_ganajmp.
	
	Issue #232: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/232
	
	DP 2023-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oWaiter = GetObjectByTag("GanaLavin022", 0);
	object oWP1 = GetObjectByTag("wp_ganalavin022_02", 0);
	object oWP2 = GetObjectByTag("wp_ganalavin022_03", 0);
	
	SetLocalBoolean(oWaiter, SW_FLAG_WAYPOINT_DEACTIVATE, FALSE);
	AssignCommand(oWaiter, ClearAllActions());
	AssignCommand(oWaiter, ActionMoveToObject(oWP1));
	AssignCommand(oWaiter, ActionMoveToObject(oWP2));
	AssignCommand(oWaiter, ActionDoCommand(GN_WalkWayPoints()));
}
