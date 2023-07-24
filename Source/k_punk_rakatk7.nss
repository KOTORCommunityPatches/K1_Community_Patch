//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_blackrak.dlg in unk_m41ac (Lehon North Beach).
	
	This script fires on an exit node of the first encounter scene with the One's
	Rakata if the player already sided with the Elders, turning them hostile. Now
	the party members also get an order to attack to make sure they don't just
	stand around watching.
	
	Updated 2023-07-24 to re-enable the AI of the rancors since it is now switched
	off at the start of the initial encounter.
	
	See also k_punk_ambush02, k_punk_rakspk02.
	
	Issue #531: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/531
	
	DP 2021-12-12 / DP 2023-07-24												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_unk"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oRanc1 = GetObjectByTag("unk41_rancor01", 0);
	object oRanc2 = GetObjectByTag("unk41_rancor02", 0);
	
	// Not needed since it is already set true in the UNK_SetBlackRakataHostile function.
	//SetGlobalBoolean("UNK_BLACKHOSTILE", TRUE);
	
	// Enable the AI of the rancors after it was disabled at the start of the scene.
	AssignCommand(oRanc1, CP_DisableAI(FALSE));
	AssignCommand(oRanc2, CP_DisableAI(FALSE));
	
	UNK_SetBlackRakataHostile();
	
	DelayCommand(0.5, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oPM2, GN_DetermineCombatRound()));
}
