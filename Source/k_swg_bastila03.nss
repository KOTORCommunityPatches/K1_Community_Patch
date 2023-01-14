//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	StartingConditional for k_hbas_dialog.dlg.
	
	This is the starting conditional script that gates Bastila's third romance
	dialogue (You have something you want to ask me?). Unlike most of the rest
	of her romance scripts, this one (and k_swg_bastila05) lack the check for the
	player having levelled up since the previous dialogue. This results in some
	uneven pacing in the progression of the romance, effectively allowing the
	player to speedrun the appearance of Malare before leaving Dantooine, despite
	Bastila being unavailable prior to accessing the Star Map. Said check has been
	added in line with the other romance scripts.
	
	See also k_swg_bastila05.
	
	Issue #678: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/678
	
	DP 2023-01-14																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int iResult = GetGlobalNumber("K_SWG_BASTILA");
	int nLevel = GetHitDice(GetFirstPC());
	int nLastLevel = GetGlobalNumber("K_SWG_BASTILA_LEVEL");
	int nPlot = GetGlobalNumber("K_STAR_MAP");
	
	if (iResult == 2 && nPlot > 9 && nLevel > nLastLevel)
		{
			return TRUE;
		}

	return FALSE;
}
