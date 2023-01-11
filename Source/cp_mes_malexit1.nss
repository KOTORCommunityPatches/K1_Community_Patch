//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_hmalare_dialog.dlg.
	
	This script is fired by the DLG for Bastila's messenger, the Twi'lek Malare.
	The conversation changes focus towards the end, where Bastila starts talking
	to the PC and Malare plays no further part. However, since Malare is the DLG
	owner, she hangs around until it terminates, at which point she gets her
	marching orders. This script now has her move off once Bastila is done talking
	to her so that she's not hovering around in the background eavesdropping. Uses
	a cut-down version of the include function UT_ExitArea.
	
	See also cp_mes_malexit2.
	
	Issue #508: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/508
	
	DP 2023-01-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oExit = GetWaypointByTag("SW_EXIT");
	object oExit2 = GetWaypointByTag("K_EXIT");
	int nPlanet = GetGlobalNumber("K_CURRENT_PLANET");
	int SW_PLOT_BOOLEAN_07 = 6;
	float fDelay = 2.9;
	
	// Prevent the script running more than once due to reused DLG nodes.
	if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_07))
		{
			NoClicksFor(3.0);
			
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_07, TRUE);
			
			if (GetIsObjectValid(oExit) && GetIsObjectValid(oExit2))
				{
					if (GetDistanceBetween(OBJECT_SELF, oExit) > GetDistanceBetween(OBJECT_SELF, oExit2))
						{
							oExit = oExit2;
						}
				}
				else if (GetIsObjectValid(oExit2) && !GetIsObjectValid(oExit))
					{
						oExit = oExit2;
					}

			// Shorten the delay when on Tatooine, since the script is fired on a line to the player in that case.
			if (nPlanet == 35)
				{
					fDelay = 1.0;
				}
			
			DelayCommand(fDelay, ActionForceMoveToObject(oExit, FALSE));
		}
}
