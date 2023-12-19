////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	EndConversation/EndConverAbort for man26_selambush.dlg in manm26ae (Manaan
	East Central).
	
	This script fires on the exit of the player's post-Hrakert Rift arrest by
	Selkath authorities outside the Republic Embassy. It destroys the cutscene
	NPCs and warps the player to Ahto West for the trial cutscene. The original
	had the player spawn on the "trial_pc" waypoint, but this was effectively
	on top of the Republic lawyer, causing the player to end up pushed to one
	side if the lawyer still existed. This would result in misalignment of any
	static cameras aimed at the player. Now they get jumped to a different one
	to make sure there's no interference.
	
	See also k_pman_pc03, k_pman_post10.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-12-19																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetAreaUnescapable(FALSE);
	
	SetGlobalBoolean("MAN_TRIAL2_START", TRUE);
	
	DestroyObject(GetObjectByTag("man26_cutdrd01", 0));
	DestroyObject(GetObjectByTag("man26_cutdrd02", 0));
	DestroyObject(GetObjectByTag("man26_cutdrd03", 0));
	DestroyObject(GetObjectByTag("man26_cutdrd04", 0));
	DestroyObject(GetObjectByTag("man26_cutsel01", 0));
	
	StartNewModule("manm26aa", "trial_stand02");
}
