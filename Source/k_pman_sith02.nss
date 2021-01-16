//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithlieu.dlg in manm27aa (Manaan Sith Base).
	
	This script fires on the exit node of the scene with the Sith lieutenant in
	the foyer, turning everyone hostile. Since the lieutenant and the diplomat
	had their OnSpawns changed to unequip their weapons, some tweaks had to be
	made to this script to re-equip them before combat commenced to avoid the
	"fighting with fists in the first combat round" issue.
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, cp_man27_lieufce, k_pman_27_init01,
	k_pman_secur01, k_pman_secur04, k_pman_secur09.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void BeginCombat(object oNPCA, object oNPCB, object oNPCC, object oNPCD, object oNPCE) {
	AssignCommand(oNPCA, GN_DetermineCombatRound());
	AssignCommand(oNPCB, GN_DetermineCombatRound());
	AssignCommand(oNPCC, GN_DetermineCombatRound());
	AssignCommand(oNPCD, GN_DetermineCombatRound());
	AssignCommand(oNPCE, GN_DetermineCombatRound());
	GN_DetermineCombatRound();
}

void main() {
	
	object oDip = GetObjectByTag("man27_sithdip", 0);
	object oDroidA = GetObjectByTag("pman_sithwara", 0);
	object oDroidB = GetObjectByTag("pman_sithwarb", 0);
	object oDroidC = GetObjectByTag("pman_sithwarc", 0);
	object oDroidD = GetObjectByTag("pman_sithward", 0);
	
	ActionPauseConversation();
	
	// Have the Lieutenant and the Diplomat re-equip their weapons.
	ActionEquipMostDamagingRanged();
	ActionDoCommand(SignalEvent(oDip, EventUserDefined(28)));
	
	ChangeToStandardFaction(oDroidA, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDroidB, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDroidC, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDroidD, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.75, BeginCombat(oDip, oDroidA, oDroidB, oDroidC, oDroidD));
	
	DelayCommand(1.0, ActionResumeConversation());
}
