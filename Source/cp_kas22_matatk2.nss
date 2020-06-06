//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_kas22_elikill.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	One of several scripts that fire during the new cutscene showing Matton kill
	Eli after the player brings him the droid head from the Shadowlands. In the
	vanilla game, Eli is killed outside a cutscene and the player is required to
	manually reinitiate dialogue with Matton, so this has been changed to add this
	interstitial scene that bridges to Matton's conversation. This script handles
	the actual attack itself.
	
	See also cp_kas22_matatk0, cp_kas22_matatk1, cp_kas22_matatk3, cp_kas22_matatk4,
	k_pkas_dasolatck.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oEli = GetObjectByTag("kas22_eli_01", 0);
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_PREDATOR);
	ChangeToStandardFaction(oEli, STANDARD_FACTION_PREY);
	
	ActionPauseConversation();
	
	// Blaster Rapid Shot anim (b5a2) = 218
	ActionDoCommand(CutsceneAttack(oEli, 218, ATTACK_RESULT_AUTOMATIC_HIT, 10));
}
