//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik082.dlg in tar_m08aa (Taris Davik's Estate).
	
	This script fires on the exit node of the scene where the party enters the
	hangar in Davik's Estate to steal the Ebon Hawk. The vanilla script simply
	set Calo and Davik to hostile and then gave them the GN_DeterminCombatRound
	command. The two party members have now also been given that command to make
	sure they don't stand around watching.
	
	See also k_ptar_davwalk.
	
	Issue #708: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/708
	
	DP 2023-11-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oCalo = GetObjectByTag("Calo082", 0);
	object oDavik = GetObjectByTag("Davik082", 0);
	
	ChangeToStandardFaction(oDavik, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oCalo, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.2, AssignCommand(oDavik, GN_DetermineCombatRound()));
	DelayCommand(0.2, AssignCommand(oCalo, GN_DetermineCombatRound()));
	DelayCommand(0.2, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.2, AssignCommand(oPM2, GN_DetermineCombatRound()));
}
