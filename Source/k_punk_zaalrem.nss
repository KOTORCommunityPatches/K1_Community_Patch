//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires at the end of the branch where the player kills both Zaalbar
	and Mission, removing them both as active party members. Originally the player
	did not get their equipped gear back when pursuing this option, unlike when
	having Zaalbar kill Mission, so that has been changed. In order to avoid getting
	a pop-up notification, it is temporarily added to an invisible placeable, then
	it is given to the player during Bastila's subsequent conversation.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21,
	k_punk_fincs_en, k_punk_misrem, k_punk_mzatk.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oInvis = GetObjectByTag("invish", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(1.5);
	
	RemoveAvailableNPC(NPC_ZAALBAR);
	RemoveAvailableNPC(NPC_MISSION);
	
	// Duplicate Zaalbar's and Mission's equipped gear onto an invisible placeable to be given to the PC post-combat.
	ActionDoCommand(CP_DupeEquipment(oZaal, oInvis));
	ActionDoCommand(CP_DupeEquipment(oMiss, oInvis));
	
	DelayCommand(1.0, ActionResumeConversation());
}
