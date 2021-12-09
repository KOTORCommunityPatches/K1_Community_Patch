//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting condition in k_hjol_dialog.dlg.
	
	This is an adjustment for one of the starting conditionals for Jolee's
	personal conversations. The vanilla starting conditionals all gate access
	behind the player having gained a level since the prior conversation, but
	this can leave the player locked out if they recruited Jolee late or didn't
	talk to him regularly enough. Now the check accounts for players that have
	already hit the level cap.
	
	See also k_swg_jolee02, k_swg_jolee04, k_swg_jolee05, k_swg_jolee06,
	k_swg_jolee07, k_swg_jolee08, k_swg_jolee09.
	
	Issue #535: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/535
	
	DP 2021-12-09																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int nState = GetGlobalNumber("K_SWG_JOLEE");
	int nLastLevel = GetGlobalNumber("K_SWG_JOLEE_LEVEL");
	int nLevel = GetHitDice(GetFirstPC());
   
	if (nState == 2)
		{
			if (nLevel > nLastLevel || nLevel == 20)
				{
					return TRUE;
				}
			
			return FALSE;
		}
	
	return FALSE;
}
