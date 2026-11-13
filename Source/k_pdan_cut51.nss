//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for dan15_door05.utd in danm15 (Dantooine Ruins).
		
	Updated 2026-11-10 to migrate the functionality to an external script. Switched
	this script to signal an invisible placeable that now handles firing the cutscene.
	Hopefully this prevents users from (somehow) breaking the scene when opening door.
	
	See also cp_dan15_mapdoor.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	Issue #590: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/590
	
	DP 2019-08-01 / DP 2021-12-06 / DP 2022-06-22 / DP 2026-11-10				*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oInvis = GetObjectByTag("cp_dan15_mapdoor", 0);
	
	SignalEvent(oInvis, EventUserDefined(10));
}
