//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This script fires when the second conversation commences. It has been edited
	to remove the excessively long delay so that Bastila doesn't just stand there
	mutely looking at the player for too long. The jumps have also been streamlined
	with CP include functions.
	
	See also cp_unk44_jjfcbas, cp_unk44_pcfcbas, exitheart, k_punk_bast_ud2,
	k_punk_bastatt03, k_punk_bastesc, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oJolee = GetObjectByTag("jolee", 0);
	object oJuhani = GetObjectByTag("juhani", 0);
	
	if (GetIsObjectValid(oJolee))
		{
			AddPartyMember(NPC_JOLEE, oJolee);
		}
	
	if (GetIsObjectValid(oJuhani))
		{
			AddPartyMember(NPC_JUHANI, oJuhani);
		}
	
	ActionPauseConversation();
	
	CP_PartyJump(OBJECT_SELF, GetLocation(GetObjectByTag("bastend", 0)));
	CP_PartyJump(GetFirstPC(), GetLocation(GetObjectByTag("playerend", 0)));
	CP_PartyJump(oJolee, GetLocation(GetObjectByTag("joleeend", 0)));
	CP_PartyJump(oJuhani, GetLocation(GetObjectByTag("juhaniend", 0)));
	
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(100), OBJECT_SELF, 0.0);
	
	ActionWait(1.0);
	ActionResumeConversation();
}
