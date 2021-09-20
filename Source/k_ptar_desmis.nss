//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Party selection screen exit script in tar_m04aa (Taris Undercity).
	
	This is the party selection screen exit script from the end of the scene
	where Mission meets the party in the Undercity. Since that conversation
	is owned by the stunt Mission that is destroyed at the end of the scene,
	the final cleanup has now been moved out to a script (cp_tar04_miskill)
	owned by an invisible placeable.
	
	See also cp_tar04_miskill, k_ptar_addmissio, k_ptar_miscrt_en, k_ptar_misrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-09-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SignalEvent(GetObjectByTag("cp_tar04_miskill", 0), EventUserDefined(891));
}
