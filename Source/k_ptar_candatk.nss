//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_cand043.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the exit node of the first portion of the scene with
	Canderous and his mooks in the Taris Undercity. It starts with the Rakghouls.
	It has been edited to ensure party members don't just stand around watching.
	
	See also k_ptar_cander03, k_ptar_cander04, k_ptar_canstr_en.
	
	Issue #235: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/235
	
	DP 2023-10-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oDavTrp1 = GetObjectByTag("Daviktroop041", 0);
	object oDavTrp2 = GetObjectByTag("Daviktroop042", 0);
	object oDavTrp3 = GetObjectByTag("Daviktroop043", 0);
	object oRak;
	int nCnt;
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_FRIENDLY_1);
	ChangeToStandardFaction(oDavTrp1, STANDARD_FACTION_FRIENDLY_1);
	ChangeToStandardFaction(oDavTrp2, STANDARD_FACTION_FRIENDLY_1);
	ChangeToStandardFaction(oDavTrp3, STANDARD_FACTION_FRIENDLY_1);
	
	DelayCommand(0.5, AssignCommand(OBJECT_SELF, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oDavTrp1, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oDavTrp2, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oDavTrp3, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oPM2, GN_DetermineCombatRound()));
	
	nCnt = 0;
	
	while (GetIsObjectValid(oRak = GetObjectByTag("tar04_rakghoulco", nCnt)))
		{
			ChangeToStandardFaction(oRak, STANDARD_FACTION_HOSTILE_1);
			DelayCommand(0.5, AssignCommand(oRak, GN_DetermineCombatRound()));
			
			nCnt++;
		}
}
