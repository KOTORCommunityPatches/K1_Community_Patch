//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_blackrak.dlg in unk_m41ac (Lehon North Beach).
	
	This script fires on an exit node of the first encounter scene with the One's
	Rakata if the player already sided with the Elders, turning them hostile. Now
	the party members also get an order to attack to make sure they don't just
	stand around watching.
	
	Issue #531: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/531
	
	DP 2021-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_unk"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	
	// Not needed since it is already set true in the UNK_SetBlackRakataHostile function.
	//SetGlobalBoolean("UNK_BLACKHOSTILE", TRUE);
	
	UNK_SetBlackRakataHostile();
	
	DelayCommand(0.5, AssignCommand(oPM1, GN_DetermineCombatRound()));
	DelayCommand(0.5, AssignCommand(oPM2, GN_DetermineCombatRound()));
}
