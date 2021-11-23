//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires in the Zaalbar killing Mission branch. The original script
	changed their factions and had Zaalbar actually attack her, but caused all
	sorts of problems. Other party members could experience the shield activation
	bug (see issues #226, #431) and Mission would occasionally perform a combat
	bark ("Just die already!", etc.), even when forcibly stunned or paralysed.
	Zaalbar would also consistently twitch during the animation, briefly facing
	away first, regardless of Speaker/Listener tags, DLG owner, or facing commands.
	Eventually all of this was sidestepped by giving him a stunt animation of the
	attack, so all combat elements have been completely removed. Now the script
	simply pauses the shot and does the fade-out.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	SetGlobalFadeOut(2.0, 1.0);
	
	DelayCommand(3.0, ActionResumeConversation());
}
