//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan14ab_cut01.dlg in danm14ab (Dantooine Matale Grounds).
	
	This script is fired at the end of the "Take my wife and children instead!"
	cutscene where the Mandalorian raiders kill a farmer, turning the group hostile.
	Because an issue was encountered where the Mando equipped a sword while shooting
	the farmer in the middle of the cutscene, it was decided that the best solution
	was to remove the sword before the cutscene starts, then add it back before
	combat with the player commences. 
	
	See also k_pdan_cut06, k_pdan_mand56.
	
	Updated 2019-11-03 to ensure the enemies properly execute their combat AI and
	switch the linked script.
	
	Issue #111: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/111
	
	DP 2019-05-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oMando = GetObjectByTag("dan14ab_mand01", 0);
	object oDuro1 = GetObjectByTag("dan14ab_duros01", 0);
	object oDuro2 = GetObjectByTag("dan14ab_duros02", 0);
	object oDuro3 = GetObjectByTag("dan14ab_duros03", 0);
	
	CreateItemOnObject("g_w_vbroswrd01", oMando, 1);
	
	ChangeToStandardFaction(oMando, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDuro1, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDuro2, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDuro3, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.5, AssignCommand(oMando, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oDuro1, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oDuro2, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oDuro3, GN_DetermineCombatRound()));
}
