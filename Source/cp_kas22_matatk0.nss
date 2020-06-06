//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_eli_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	Fires just before the new cutscene showing Matton kill Eli after the player
	brings him the droid head from the Shadowlands. In the vanilla game, Eli is
	killed outside a cutscene and the player is required to manually reinitiate
	dialogue with Matton, so this has been changed to add an interstitial scene
	that bridges to Matton's conversation. This script replaces the generic DS
	alignment adjustment script on the player's reply node that encourages Matton
	to kill Eli. It also disables the AI for both, since they use the ambient
	animations script and that was interfering with the following scene.
	
	See also cp_kas22_matatk1, cp_kas22_matatk2, cp_kas22_matatk3, cp_kas22_matatk4,
	k_pkas_dasolatck.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	
	// AI is disabled for both Matton and Eli
	SetLocalBoolean(oMatton, 62, TRUE);
	SetLocalBoolean(OBJECT_SELF, 62, TRUE);
	
	AssignCommand(oMatton, ClearAllActions());
	
	UT_AdjustCharacterAlignment(GetPCSpeaker(), SW_CONSTANT_DARK_HIT_MEDIUM);
}
