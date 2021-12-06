//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by missdoor_dlg.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script fires at the end of the DLG, triggering the party selection screen.
	It has been amended to add in a fade-out, since the pop-up happens after the
	DLG has exited. This provides cover for destroying the fake Zaalbar via the
	GUI exit script.
	
	Updated 2021-12-06 to jump the patrolling droid out of the way, if it was
	repaired by the player. This script now sends it back on patrol.
	
	See also cp_tar05_misswlk, k_ptar_destzaal, k_ptar_misunlock, k_ptar_trigdoor,
	k_ptar_zaalrun.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08 / DP 2021-12-06												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDroid = GetObjectByTag("rustdroid2", 0);
	int SW_PLOT_REPAIR_ACTIVATE_PATROL_ROUTE = 19;
	
	SetGlobalFadeOut();
	
	// If the player repaired the droid and sent it on patrol then we previously disabled it
	// for the duration of the jail break scene, so reactivate it now.
	if (GetLocalBoolean(oDroid, SW_PLOT_REPAIR_ACTIVATE_PATROL_ROUTE))
		{
			ExecuteScript("k_act_walkways2", oDroid);
		}
	
	AddAvailableNPCByTemplate(NPC_ZAALBAR, "p_zaalbar");
	DelayCommand(0.25, ShowPartySelectionGUI("k_ptar_destzaal", NPC_MISSION, -1));
	
	SetAreaUnescapable(FALSE);
}
