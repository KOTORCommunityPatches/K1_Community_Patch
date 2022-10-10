//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting conditional for k_hjol_dialog.dlg and k_hjuh_dialog.dlg.
	
	This is a replacement starting conditional for Jolee and Juhani's responses
	when talked to inside the Unknown World temple. Their original starting
	conditionals (k_swg_jolee20 / k_hjuh_p28) used GetName(GetArea(OBJECT_SELF)),
	which returned a null string and thus failed to return true.
	
	Issue #355: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/355
	
	DP 2022-10-10																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	string sArea = GetModuleFileName();
	
	if (sArea == "unk_m44aa" || sArea == "unk_m44ab")
		{
			return TRUE;
		}
	
	return FALSE;
}
