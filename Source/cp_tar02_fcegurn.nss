//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_gurney021.dlg in tar_m02ac (Taris Upper City South).
	
	This script fires on the exit node of the branch where Gurney accosts the
	player about the Rakghoul serum when leaving the clinic. It refaces the
	party towards Gurney after potential companion interjections.
	
	See also k_ptar_zelkatk2x, k_ptar_zelkatk3x.
	
	Issue #494: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/494
	
	DP 2023/07/28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oGurney = GetObjectByTag("gurney021", 0);
	
	NoClicksFor(2.0);
	
	DelayCommand(0.75, CP_FaceNPC(oPC, oGurney));
	DelayCommand(0.75, CP_FaceNPC(oPM1, oGurney));
	DelayCommand(0.75, CP_FaceNPC(oPM2, oGurney));
}
