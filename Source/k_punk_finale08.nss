//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires after the player briefly chases Carth. The original script
	had the player run towards Carth and then gave him a ClearAllActions on this
	script. That has now been changed to a fixed destination in conjunction with
	a static camera, so now Bastila simply gets commanded to move to within a few
	meters of the same point.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	NoClicksFor(2.0);
	
	AssignCommand(GetObjectByTag("bastila", 0), ActionMoveToObject(GetObjectByTag("carthflee", 0), FALSE, 2.5));
}
