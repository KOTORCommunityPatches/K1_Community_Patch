//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_sithmast.dlg in unk_m44aa (Unknown World Temple Main Floor).
	
	This script fires on the first node of the Sith Master scene. The fade-in has
	been slightly altered to better mask the party jump when the scene is triggered.
	
	See also k_punk_master02, k_punk_masktk_en.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2019-11-12																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	SetGlobalFadeIn(0.5, 1.0);
	
	SetLightsaberPowered(GetPCSpeaker(), TRUE, TRUE, TRUE);
	SetLightsaberPowered(OBJECT_SELF, TRUE, TRUE, FALSE);
	
	SetNPCAIStyle(OBJECT_SELF, PARTY_AISTYLE_PASSIVE);
	
	DelayCommand(1.5, ActionResumeConversation());
}
