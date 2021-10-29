//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_sithintero.dlg in tar_m02ad (Taris Upper City North Apartments).
	
	This is a simple facing script during the stolen Sith uniforms interrogation
	scene to force the player to turn back towards the trooper standing outside the
	door after Carth's interjection on the previous line.
	
	Issue #306: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/306
	
	DP 2021-10-29																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	AssignCommand(GetFirstPC(), SetFacingPoint(GetPosition(GetObjectByTag("tar02_sithtrooper2", 0))));
	AssignCommand(GetFirstPC(), ActionPlayAnimation(ANIMATION_LOOPING_LISTEN));
}
