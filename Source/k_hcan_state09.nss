//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting condition in k_hcan_dialog.dlg.
	
	This is an adjustment for the starting conditional that gates the final
	branch of Canderous' personal quest. In the vanilla game, this is only
	available on the Unknown World/Lehon, which makes it very easy to miss.
	This has been changed to any time after escaping the Leviathan, alongside
	the usual +1 level since the last conversation with him, or if already at
	level 20.
	
	Derived from:
	https://github.com/DarthParametric/K1_Canderous_Final_Conversation_Timing_Adjustment
	
	Issue #535: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/535
	
	DP 2021-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
    
	int nState = GetGlobalNumber("G_CAND_STATE");
	int nLastLevel = GetGlobalNumber("T_LEVC");
	int nPlot = GetGlobalNumber("K_KOTOR_MASTER");
	int nLevel = GetHitDice(GetFirstPC());
	
	if (nState == 8 && nPlot >= 20)
		{
			if (nLevel > nLastLevel || nLevel == 20)
				{
					return TRUE;
				}
			
			return FALSE;
		}
	
	return FALSE;
}
