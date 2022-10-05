//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_darkjed001.dlg in unk_m44aa (Unknown World Temple Main Floor).
	
	This script fires on the exit node of the scene with the two Dark Jedi in the
	room before the Sith Master. Jolee and Juhani now get forced into combat to
	prevent them standing around watching.
	
	Issue #325: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/325
	
	DP 2022-10-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"
#include "cp_inc_k1"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oDarkJedi1 = GetObjectByTag("darkjedi441");
	object oDarkJedi2 = GetObjectByTag("darkjedi442");
	
	ChangeToStandardFaction(oDarkJedi1, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDarkJedi2, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.2, AssignCommand(oDarkJedi1, GN_DetermineCombatRound()));
	DelayCommand(0.2, AssignCommand(oDarkJedi2, GN_DetermineCombatRound()));
	DelayCommand(0.2, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.2, AssignCommand(oPM2, GN_DetermineCombatRound()));
}
