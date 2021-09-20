//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_mission.dlg in tar_m04aa (Taris Undercity).
	
	This is the script that pops up the party selection screen at the end of the
	scene where Mission meets the party in the Undercity. Added in a fadeout in
	order to mask the swap between stunt Mission and party Mission.
	
	See also cp_tar04_miskill, k_ptar_desmis, k_ptar_miscrt_en, k_ptar_misrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-09-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeOut();
	
	AddAvailableNPCByTemplate(NPC_MISSION, "p_mission");
	
	if (GetPartyMemberCount() > 1)
		{
			DelayCommand(1.0, ShowPartySelectionGUI("k_ptar_desmis", NPC_MISSION, NPC_CARTH));
		}
		else
			{
				DelayCommand(1.0, ShowPartySelectionGUI("k_ptar_desmis", NPC_MISSION, -1));
			}
}
