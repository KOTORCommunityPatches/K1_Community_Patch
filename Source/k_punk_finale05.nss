//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires during the establishing shot of the party standing outside
	the Ebon Hawk. The timings of everyone have been tweaked a little so that
	Carth notices the player returning first.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale06,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	vector vFace = Vector(109.34,138.83,24.30);
	
	ActionPauseConversation();
	
	NoClicksFor(4.0);
	
	SetGlobalFadeIn(0.0, 1.0);
	
	DelayCommand(2.0, SetFacingPoint(vFace));
	DelayCommand(3.0, AssignCommand(GetObjectByTag("cand", 0), SetFacingPoint(vFace)));
	DelayCommand(3.0, AssignCommand(GetObjectByTag("mission", 0), SetFacingPoint(vFace)));
	DelayCommand(3.0, AssignCommand(GetObjectByTag("zaalbar", 0), SetFacingPoint(vFace)));
	DelayCommand(3.0, AssignCommand(GetObjectByTag("hk47", 0), SetFacingPoint(vFace)));
	DelayCommand(3.0, AssignCommand(GetObjectByTag("t3m4", 0), SetFacingPoint(vFace)));
	
	DelayCommand(4.0, ActionResumeConversation());
}
