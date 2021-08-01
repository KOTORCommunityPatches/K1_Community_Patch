//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUsed for ebo41_galaxymap.utp in ebo_m41aa (Ebon Hawk - Lehon Crash).
	
	This is the OnUsed script for the invisible placeable in front of the Galaxy
	Map in the Ebon Hawk when crashed on the Unknown World. The vanilla version
	simply fires the attached DLG (ebn12_galaxymap.dlg). This has three branches.
	The first two have starting conditionals that check the globals EBO_HYPER_FIXED
	and UNK_DISRUPT_OFF, and pop up a bark bubble with the appropriate warning if
	they return false. If the DLG falls through these two then it gets to the final
	branch (E0/R0) which fires two scripts, the latter of which executes the standard
	galaxy map script, k_pebn_galaxy, after a 0.1 second delay. However, this final
	node will display a thin sliver of empty bark bubble when firing. In order to
	avoid this, it makes more sense to simply bypass firing the DLG altogether if
	the hyperdrive has been repaired the disruptor field has been disabled. Combines
	the vanilla scripts k_pebn_starf and test2.
	
	Issue #471: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/471

	DP 2021-08-01																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nHyperDrive = GetGlobalBoolean("EBO_HYPER_FIXED");
	int nDisruption = GetGlobalBoolean("UNK_DISRUPT_OFF");
	
	if (nHyperDrive == TRUE && nDisruption == TRUE)
		{
			SetGlobalNumber("K_KOTOR_MASTER", 50);
			DelayCommand(0.1, ExecuteScript("k_pebn_galaxy", OBJECT_SELF, -1));
		}
		else
			{
				ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, FALSE);
			}
}
