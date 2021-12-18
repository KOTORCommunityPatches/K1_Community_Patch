//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_postraid.dlg in tar_m02aa (Taris Upper City South Apartments).
	
	This added script fires on the exit nodes of the DLG for the Duros after the
	Sith raid scene when exiting the hideout on Taris for the first time. When
	skipping through the Duros' lines, he could end up frozen post-conversation.
	Now he's given a forced animation to prevent that.
	
	Issue #540: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/540
	
	DP 2021-12-18																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
}
