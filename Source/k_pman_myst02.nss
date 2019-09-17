////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_mman.dlg in manm26ae (Manaan East Central).
	
	This script is fired on the second last entry of the conversation with the
	Mysterious Man. It causes him to walk out. In order to fix an issue with
	his selection icon being visible after the conversation finishes, the fade
	out that was originally in the DLG has been removed and added to this script
	to provide more control. He is now jumped across the module once the fade out
	has happened, and destroyed by the script on the subsequent entry. 
	
	See also k_pman_myst03.
	
	Issue #138: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/138
	
	DP 2019-06-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	location lMysJump = Location(Vector(19.0,-3.0,57.5), 0.0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(1.0, 3.0);
	
	ActionForceMoveToObject(GetObjectByTag("man26_wp_myst02", 0), 0, 1.0, 30.0);
	
	DelayCommand(3.9, AssignCommand(OBJECT_SELF, ClearAllActions()));
	DelayCommand(4.2, AssignCommand(OBJECT_SELF, ActionJumpToLocation(lMysJump)));
	
	DelayCommand(4.75, ActionResumeConversation());
}
