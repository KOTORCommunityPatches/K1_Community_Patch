//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Starting Conditional for k_hjol_dialog.dlg.
	
	This is the starting conditional that gates the branch in Jolee's personal
	conversation asking him about Sunry. The vanilla script would allow access
	to this branch without Jolee having spoken to Elora, encountering Davin,
	or spoken to Sunry in prison, which would mean neither Jolee nor the player
	would have any reason to bring it up (e.g. Manaan completed before recruiting
	Jolee). Additionally, it could be possible that the branch would be repeatable
	under certain circumstances, despite setting a local boolean intended to gate
	it off, seemingly due to the MAN_MURDER_PLOT global no longer being set to 2
	at some point (likely originally when talking to Elora the first time).
	
	See also k_swg_jolee12, k_swg_jolee14.
	
	Issue #641: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/641
	
	DP 2023-11-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int StartingConditional() {
	
	int nPlot1 = GetGlobalNumber("MAN_MURDER_PLOT"); // 1 = Elora has been spawned in Ahto West.
	int nPlot2 = GetGlobalBoolean("K_SWG_DAVIN"); // Jolee has spoken to his messenger Davin.
	int nPlot3 = GetGlobalBoolean("MAN_ELORAFT_DONE"); // Jolee has spoken to Elora.
	int nPlot4 = GetGlobalBoolean("MAN_SUNRYJF_DONE"); // Jolee has spoken to Sunry in prison.
	int nTalk = UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_06); // Player has already spoken to Jolee about Sunry.
	
	if (nPlot1 >= 1 && !nTalk)
		{
			if (nPlot2 || nPlot3 || nPlot4)
				{
					return TRUE;
				}
			
			return FALSE;
		}
	
	return FALSE;
}
