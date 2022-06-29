//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnSpawn for g_sithcomm005.utc in STUNT_55a (Stunt Lehon Temple Summit - DS Ending).
	
	This is the OnSpawn script for one of the two Sith Officers that walk towards
	the podium at the start of the scene. The original used ActionMoveToObject,
	which resulted in some jerkiness between getting to the destination and playing
	the salute animation afterwards (commanded by the DLG). It has been switched
	to ActionMoveToLocation instead, which seems to give a smoother animation
	transition.
	
	See also k_wc01.
	
	Issue #538: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/538
	
	DP 2022-06-29																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	location lWP02 = Location(Vector(126.50,74.97,13.75), 0.00);
	
	DelayCommand(1.0, AssignCommand(GetObjectByTag("WC02", 0), ActionMoveToLocation(lWP02, FALSE)));
}
