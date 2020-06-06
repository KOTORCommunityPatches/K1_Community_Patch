//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_eli_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	This script fires after showing Matton the droid head the player finds in the
	Shadowlands and encouraging him to kill Eli. In the vanilla game, Matton does
	this outside a cutscene and the player is required to manually reinitiate
	dialogue with him, so this has been changed to add an interstitial cutscene of
	the killing that bridges to Matton's default conversation.
	
	See also cp_kas22_matatk0, cp_kas22_matatk1, cp_kas22_matatk2, cp_kas22_matatk3,
	cp_kas22_matatk4.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	DelayCommand(0.1, AssignCommand(GetObjectByTag("kas22_dasol_01", 0), ActionStartConversation(GetFirstPC(), "cp_kas22_elikill", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
}
