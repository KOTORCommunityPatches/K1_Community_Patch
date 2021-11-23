//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires on the exit node of the branch where the player kills both
	Zaalbar and Mission. It turns both hostile. The vanilla script only commanded
	Canderous to perform a GN_DetermineCombatRound, but this has now been expanded
	to Bastila, HK, and T3. Bastila, especially, previously tended to just stand
	around doing nothing once combat began.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21,
	k_punk_fincs_en, k_punk_misrem, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oHK = GetObjectByTag("HK47", 0);
	object oT3 = GetObjectByTag("T3M4", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	
	ChangeToStandardFaction(oMiss, STANDARD_FACTION_HOSTILE_1);
	AssignCommand(oMiss, GN_DetermineCombatRound(OBJECT_INVALID));
	
	ChangeToStandardFaction(oZaal, STANDARD_FACTION_HOSTILE_1);
	AssignCommand(oZaal, GN_DetermineCombatRound(OBJECT_INVALID));
	
	AssignCommand(oBast, GN_DetermineCombatRound(OBJECT_INVALID));
	AssignCommand(oCand, GN_DetermineCombatRound(OBJECT_INVALID));
	AssignCommand(oHK, GN_DetermineCombatRound(OBJECT_INVALID));
	AssignCommand(oT3, GN_DetermineCombatRound(OBJECT_INVALID));
	
	SetGlobalNumber("UNK_PARTYSHOWDOWN", 2);
}
