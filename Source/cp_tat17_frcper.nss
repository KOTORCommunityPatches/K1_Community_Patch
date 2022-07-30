//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_10czerk_01.dlg in tat_m17ag (Tatooine Czerka Office).
	
	This is an added script that forces the PC to play the hand waving Force
	Persuade animation. It replaces the in-DLG animation assignment in an
	attempt to make the static camera work correctly. When using the in-DLG
	anim, the camera remains focused on the PC instead.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2022-07-30																*/
//////////////////////////////////////////////////////////////////////////////////


void main() {
	
	object oPC = GetFirstPC();
	
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_PERSUADE));
}
