//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_brejik031.dlg in tar_m03af (Taris Swoop Platform).
	
	A script that forces Brejik to alter his facing just before he appears in the
	Taris swoop race finale cutscene. Since he spawns in at the beginning of the
	scene, he ends up facing where the player starts, not where they will end up
	by the time the scene progresses to actually revealing Brejik.
	
	See also cp_tar03_brejeqp, k_ptar_brejikatk, k_ptar_brejik_sp, k_ptar_dieswoopy,
	k_ptar_swpie_ud
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	DP 2020-06-18																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBrejik = GetObjectByTag("Brejik031", 0);
	
	AssignCommand(oBrejik, ActionDoCommand(SetFacing(-38.5)));
	AssignCommand(oBrejik, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 2.0));
}
