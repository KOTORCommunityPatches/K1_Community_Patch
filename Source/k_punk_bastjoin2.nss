//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This is one of the sequence of scripts that fires when the player sides with
	Bastila after the first fight. Everyone's lightsaber blade activation override
	is now disabled so that they aren't stuck on after the Jolee/Juhani fight ends.
	
	See also cp_unk44_jjfcbas, cp_unk44_pcfcbas, exitheart, k_punk_bast_ud2,
	k_punk_bastatt03, k_punk_bastatt05, k_punk_bastesc.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oBastila = GetObjectByTag("bastila", 0);
	object oJolee = GetObjectByTag("jolee", 0);
	object oJuhani = GetObjectByTag("juhani", 0);
	
	ActionPauseConversation();
	
	// Turn off scripted saber blade activation overrides.
	SetLightsaberPowered(GetFirstPC(), FALSE);
	SetLightsaberPowered(oBastila, FALSE);
	SetLightsaberPowered(oJolee, FALSE);
	SetLightsaberPowered(oJuhani, FALSE);
	
	AddPartyMember(NPC_BASTILA, oBastila);
	
	ActionWait(0.2);
	
	ActionResumeConversation();
}
