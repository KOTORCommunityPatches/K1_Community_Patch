//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting Conditional for k_hjol_dialog.dlg.
	
	This is the starting conditional that gates the branch in Jolee's personal
	conversation asking him about the verdict in Sunry's trial. The vanilla script
	would allow access to this branch without Jolee having encountered Davin, spoken
	to Elora, or spoken to Sunry in prison, which would mean neither Jolee nor the
	player would have any reason to bring it up (e.g. Manaan was completed before
	recruiting Jolee).
	
	See also k_swg_jolee12, k_swg_jolee18.
	
	Issue #641: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/641
	
	DP 2023-11-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int StartingConditional() {
	
	int nPlot1 = GetGlobalNumber("MAN_MURDER_PLOT"); // 1 = Elora has been spawned in Ahto West / 2 = seemingly never set.
	int nPlot2 = GetGlobalBoolean("K_SWG_DAVIN"); // Jolee has spoken to his messenger Davin.
	int nPlot3 = GetGlobalBoolean("MAN_ELORAFT_DONE"); // Jolee has spoken to Elora.
	int nPlot4 = GetGlobalBoolean("MAN_SUNRYJF_DONE"); // Jolee has spoken to Sunry in prison.
	int nTalk = UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_05); // Player has already spoken to Jolee about Sunry's verdict.
	
	if (nPlot1 > 2 && !nTalk)
		{
			if (nPlot2 || nPlot3 || nPlot4)
				{
					return TRUE;
				}
			
			return FALSE;
		}
	
	return FALSE;
}
