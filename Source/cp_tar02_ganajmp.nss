//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_gana021.dlg in tar_m02ae (Taris Upper City Cantina).
	
	This is an added script that fires on the starting node when meeting Gana
	Lavin in the Taris Upper City Cantina for the first time. It jumps the party
	into position, faces Gana towards the PC, and disables the waypoint walking
	waiter and jumps him out of the way. This prevents the waiter trying to
	randomly path through the middle of the conversation and freaking out.
	
	See also k_ptar_walkway2.
	
	Issue #232: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/232
	
	DP 2023-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oGana = GetObjectByTag("GanaLavin021", 0);
	object oWaiter = GetObjectByTag("GanaLavin022", 0);
	object oWP = GetObjectByTag("wp_ganalavin022_02", 0);
	int SW_FLAG_WAYPOINT_DEACTIVATE = 42;
	location lPC = Location(Vector(89.53,106.57,0.00), 239.89);
	location lPM1 = Location(Vector(90.82,107.40,0.00), 239.89);
	location lPM2 = Location(Vector(89.61,108.10,0.00), 239.89);
	
	SetLocalBoolean(oWaiter, SW_FLAG_WAYPOINT_DEACTIVATE, TRUE);
	CP_PartyJumpObject(oWaiter, oWP);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.2, CP_FaceNPC(oGana, oPC));
}
