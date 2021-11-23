//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_mission.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires during the branch where Zaalbar kills Mission.  It removes
	her as an active party member and spawns duplicates of her equipped gear into
	the player's inventory. Only mildly tweaked from the vanilla version to ensure
	it has time to fire correctly and switched to an added gear duplication include
	function.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21,
	k_punk_fincs_en, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oMiss = GetObjectByTag("Mission", 0);
	
	ActionPauseConversation();
	
	NoClicksFor(2.0);
	
	// Remove Mission as an available NPC and duplicate all her gear into the player's inventory.
	RemoveAvailableNPC(NPC_MISSION);
	
	// Duplicate Mission's gear into the player's inventory.
	ActionDoCommand(CP_DupeEquipment(oMiss, oPC));
	
	ActionResumeConversation();
}
