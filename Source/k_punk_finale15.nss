//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script originally had the player walk towards Mission on her line about
	doing his own dirty work. That made for some jerky camera movement, so has
	been addressed by moving the player into position at the commencement of
	the scene. Instead, Zaalbar is given an animation to make sure he won't
	freeze while not an active participant.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	AssignCommand(GetObjectByTag("zaalbar", 0), ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
}
