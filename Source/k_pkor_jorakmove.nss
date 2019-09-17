////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor38b_jorakuln.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script moves Jorak into the corridor on his line. The only difference
	from the vanilla script is to change from a waypoint (which was positioned
	off to one side) to a manually specified location that has him properly
	positioned in the middle of the corridor, directly facing the party. He
	was also moved forwards slightly, to take up more of the frame.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorstunmu, k38b_init_jorak,
	k38b_init_jorak1, k38b_jor_gastrap, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oJorak = GetObjectByTag("kor38b_jorakuln", 0);
	object oPC = GetFirstPC();
	location lJorak = Location(Vector(110.5,75.0,0.75), 0.0);
	
	ActionPauseConversation();
	
	AssignCommand(oJorak, ActionMoveToLocation(lJorak, TRUE));
	
	ActionResumeConversation();
}
