//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_kas22_elikill.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	One of several scripts that fire during the new cutscene showing Matton kill
	Eli after the player brings him the droid head from the Shadowlands. In the
	vanilla game, Eli is killed outside a cutscene and the player is required to
	manually reinitiate dialogue with Matton, so this has been changed to add this
	interstitial scene that bridges to Matton's conversation. This script fires his
	default DLG on the exit node.
	
	See also cp_kas22_matatk0, cp_kas22_matatk1, cp_kas22_matatk2, cp_kas22_matatk3,
	k_pkas_dasolatck.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	DelayCommand(0.1, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
}
