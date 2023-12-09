//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_jolee.dlg in lev_m40aa (Leviathan Prison Block).
	
	This is an added script that fires on the first node of Jolee's scene when
	he is the chosen jail breaker on the Leviathan. It closes the forcefield to
	his cell off-screen, since it seems odd for it to be open at the start.
	
	See also k_plev_joleeesc, k_plev_joldoor.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDoor = GetNearestObjectByTag("lev40_cell08", GetFirstPC(), 1);
	
	NoClicksFor(3.0);
	
	AssignCommand(oDoor, ActionCloseDoor(oDoor));
}
