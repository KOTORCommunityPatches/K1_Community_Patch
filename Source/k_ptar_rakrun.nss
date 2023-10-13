//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_outwom043.dlg in tar_m04aa (Taris Undercity).
	
	This script fires during the Undercity gate scene if the player chooses to
	leave Hendar to his fate. It commands the rakghoul to run to a waypoint after
	having killed Hendar. Since the waypoint has been moved to avoid the player
	getting too close to Mission's spawn triggers, the rakghoul has been given
	an additional facing command to make sure it doesn't have its back to the gate.
	
	Updated 2023-10-13 to cancel the combat music that was played in the previous
	shot during Hendar's fight.
	
	See also cp_tar04_miskill, k_ptar_addmissio, k_ptar_desmis, k_ptar_hdfate_ud,
	k_ptar_miscrt_en, k_ptar_misrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-10-30 / Salk 2023-10-13												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oHendarsfate = GetObjectByTag("hendarsfate", 0);
	
	ExecuteScript("k_act_cmusic_off", OBJECT_SELF, -1);
	
	DelayCommand(0.5, AssignCommand(oHendarsfate, ActionForceMoveToObject(GetObjectByTag("tar04_wprakghoul", 0), TRUE)));
	DelayCommand(0.7, AssignCommand(oHendarsfate, ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC())))));
}
