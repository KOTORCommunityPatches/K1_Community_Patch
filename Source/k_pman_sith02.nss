//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithlieu.dlg in manm27aa (Manaan Sith Base).
	
	This script fires on the exit node of the scene with the Sith lieutenant in
	the foyer, turning everyone hostile. Since the lieutenant and the diplomat
	had their OnSpawns changed to unequip their weapons, some tweaks had to be
	made to this script to re-equip them before combat commenced to avoid the
	"fighting with fists in the first combat round" issue.
	
	Updated 2023-10-15 to also give the party members a GN_DetermineCombatRound
	command, unlock the lieutenant's facing and face her towards the player,
	and reduce the delays.
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, cp_man27_lieufce, k_pman_27_init01,
	k_pman_secur01, k_pman_secur04, k_pman_secur09.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16 / DP 2023-10-15												*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"
#include "cp_inc_k1"

void BeginCombat(object oNPCA, object oNPCB, object oNPCC, object oNPCD, object oNPCE, object oNPCF, object oNPCG) {
	AssignCommand(oNPCA, GN_DetermineCombatRound());
	AssignCommand(oNPCB, GN_DetermineCombatRound());
	AssignCommand(oNPCC, GN_DetermineCombatRound());
	AssignCommand(oNPCD, GN_DetermineCombatRound());
	AssignCommand(oNPCE, GN_DetermineCombatRound());
	AssignCommand(oNPCF, GN_DetermineCombatRound());
	AssignCommand(oNPCG, GN_DetermineCombatRound());
	GN_DetermineCombatRound(GetFirstPC());
}

void main() {
	
	object oDip = GetObjectByTag("man27_sithdip", 0);
	object oDroidA = GetObjectByTag("pman_sithwara", 0);
	object oDroidB = GetObjectByTag("pman_sithwarb", 0);
	object oDroidC = GetObjectByTag("pman_sithwarc", 0);
	object oDroidD = GetObjectByTag("pman_sithward", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	
	ActionPauseConversation();
	
	SetLockOrientationInDialog(OBJECT_SELF, FALSE);
	
	ActionDoCommand(SetFacingPoint(GetPosition(GetFirstPC())));
	
	// Have the Lieutenant and the Diplomat re-equip their weapons.
	ActionEquipMostDamagingRanged();
	SignalEvent(oDip, EventUserDefined(28));
	
	ChangeToStandardFaction(oDroidA, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDroidB, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDroidC, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(oDroidD, STANDARD_FACTION_HOSTILE_1);
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.5, BeginCombat(oDip, oDroidA, oDroidB, oDroidC, oDroidD, oPM1, oPM2));
	
	DelayCommand(0.75, ActionResumeConversation());
}
