//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This is a replacement for the vanilla script k_pman_scene02 that has Shen leave
	with his father during the Sandral-Matale Feud scene. The original had them all
	run away, which seemed strange. It has been changed to have them walk away instead.
	The name has been changed to avoid potential filename clashes.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	AssignCommand(GetObjectByTag("dan14_ahlan", 0), ActionMoveToObject(GetWaypointByTag("dan14ad_wp_alhan_01")));
	AssignCommand(GetObjectByTag("dan14ad_drd01", 0), ActionMoveToObject(GetWaypointByTag("dan14ad_wp_droida_01")));
	AssignCommand(GetObjectByTag("dan14ad_drd02", 0), ActionMoveToObject(GetWaypointByTag("dan14ad_wp_droidb_01")));
	AssignCommand(GetObjectByTag("dan14_shen", 0), ActionMoveToObject(GetWaypointByTag("dan14ad_wp_alhan_01")));
	
	ActionWait(4.0);
	ActionResumeConversation();
}
