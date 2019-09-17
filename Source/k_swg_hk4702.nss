////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting conditional for Reply 113 in k_hhkd_dialog.dlg.
	
	This script is a conditional for asking HK about restoring his memory. By
	default, you can endlessly ask him about this post-Leviathan despite him
	telling you it is already restored, so a new local boolean check has been
	added to block off this node after asking the first time as Revan.
	
	See also cp_gen_a_hkrvrep.
	
	Issue #175: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/175
	
	DP 2019-06-26                                                             */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional()
{
	if (GetGlobalNumber("K_SWG_HK47_FIX") > 0 && !GetLocalBoolean(OBJECT_SELF, 54))
		{
			return TRUE;
		}
	return FALSE;
}
