//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan14_jon.dlg in danm14aa  (Dantooine Jedi Enclave Courtyard)
	
	This script has been added to every exit node in the DLG for Jon, the
	farmer whose daughter was killed by Mando raiders. It forces the wandering
	Jedi to restart walking waypoints, since the ClearAllActions on jumping
	him out of the way at the start of the conversation paused his patrol.
	
	See also cp_dan14_jonjmp.
	
	Issue #548: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/548
	
	DP 2022-12-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oJedi = GetObjectByTag("dan14_jedim", 0);
	
	ExecuteScript("k_act_walkways", oJedi);
}
