//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_sithmast.dlg in unk_m44aa (Unknown World Temple Main Floor).
	
	This script fires on the exit node of the Sith Master scene. It's a mildly
	tweaked version of the original k_act_atkonend2, renamed to avoid any
	confusion with the global script k_act_atkonend. The Master's saber is now
	ignited at the end of the scene, rather than having it on from the start,
	and Jolee and Juhani both get forced into combat to prevent them standing
	around watching.
	
	See also k_punk_master02, k_punk_master03, k_punk_masktk_en.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2022-10-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	SetNPCAIStyle(OBJECT_SELF, NPC_AISTYLE_DEFAULT_ATTACK);
	
	SetLightsaberPowered(OBJECT_SELF, TRUE, TRUE, TRUE);
	
	DelayCommand(0.2, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
	
	DelayCommand(0.3, GN_DetermineCombatRound());
	DelayCommand(0.3, AssignCommand(GetPartyMemberByIndex(1), GN_DetermineCombatRound()));
	DelayCommand(0.3, AssignCommand(GetPartyMemberByIndex(2), GN_DetermineCombatRound()));
}
