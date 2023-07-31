//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_11iziz_01.dlg in tat_m17aa (Anchorhead).
	
	This added EndConversation/EndConverAbort script fires at the conclusion of
	every conversation with the Jawa Iziz in Anchorhead. It unlocks everyone's
	orientation after it was previously locked at the beginning of the conversation.
	
	See also cp_tat17_izizjmp.
	
	Issue #618: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/618
	
	DP 2023-07-31																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oIziz = GetObjectByTag("tat17_11iziz_01", 0);
	
	SetLockOrientationInDialog(oPC, FALSE);
	SetLockOrientationInDialog(oPM1, FALSE);
	SetLockOrientationInDialog(oPM2, FALSE);
	SetLockOrientationInDialog(oIziz, FALSE);
}
