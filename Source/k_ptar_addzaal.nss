//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by missdoor_dlg.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script fires at the end of the DLG, triggering the party selection screen.
	It has been amended to add in a fade-out, since the pop-up happens after the
	DLG has exited. This provides cover for destroying the fake Zaalbar via the
	GUI exit script.
	
	See also cp_tar05_misswlk, k_ptar_destzaal, k_ptar_misunlock, k_ptar_trigdoor,
	k_ptar_zaalrun.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeOut();
	
	AddAvailableNPCByTemplate(NPC_ZAALBAR, "p_zaalbar");
	DelayCommand(0.25, ShowPartySelectionGUI("k_ptar_destzaal", NPC_MISSION, -1));
	
	SetAreaUnescapable(FALSE);
}
