//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_yuthuraban.dlg on Entry 62 in korr_m35aa (Korriban Sith Academy).
	
	Repeatedly asking Yuthura about the Sith Code in the Sith Academy could lead
	to an infinite XP exploit, since the quest reward is part of the DLG node which
	has no provision for restricting access beyond gating off the entire node itself.
	That has been changed to move the quest reward to this script, and gating it
	behind a local boolean check so that it is only award once.
	
	Issue #413: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/413

	DP 2021-10-21																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int SW_PLOT_BOOLEAN_08 = 7;
	
	if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_08))
		{
			AddJournalQuestEntry("Category000", 10);
			GivePlotXP("kor35_codesith", 50);
			
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_08, TRUE);
		}
	
	// This node originally fired the script k_pkor_tdcode, which sets a global to
	// indicate that the player has been through the first time branch of the Sith
	// Code conversation. Subsequent discussion skips to a later node. However,
	// the vanilla script always sets the global to 1, which might cause problems
	// with Uthar's DLG if you ask Yuthura about the code again after already having
	// passed the Code test that Uthar gives you.
	if (GetGlobalNumber("KOR_SITH_CODE") == 0)
		{
			SetGlobalNumber("KOR_SITH_CODE", 1);
		}
}
