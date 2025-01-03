//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithlieu.dlg in manm27aa (Manaan Sith Base).
	
	This is an added script that fires during the scene with the Sith lieutenant in
	the foyer. It faces her towards the computer console before the line where she
	does the typing animation when calling in the diplomat from outside. Because the
	party is now properly positioned next to their entry point, she could be facing
	away from the console at the start of the conversation.
	
	Updated 2023-10-15 to add in an animation to ensure the facing command takes
	hold and also add a use computer anim so that she starts typing before she
	starts talking to the diplomat on the next entry.
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, k_pman_27_init01, k_pman_secur01,
	k_pman_secur04, k_pman_secur09, k_pman_sith02.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16 / DP 2023-10-15												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	ActionDoCommand(SetFacing(DIRECTION_WEST));
	
	ActionPlayAnimation(ANIMATION_LOOPING_USE_COMPUTER, 1.0, 1.5);
	
	ActionResumeConversation();
}
