//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_11iziz_01.dlg in tat_m17aa (Anchorhead).
	
	This added script fires on every starting entry node when initiating conversation
	with the Jawa Iziz in Anchorhead. It jumps the party in order to better deal with
	facing during all the companion interjections. Also locks everyone's orientation
	for the duration of the conversation.
	
	See also cp_tat17_izizfce.
	
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
	location lPC = Location(Vector(260.37,128.45,3.75), 22.50);
	location lPM1 = Location(Vector(260.96,130.05,3.75), -67.50);
	location lPM2 = Location(Vector(261.91,127.74,3.75), 112.50);
	
	SetGlobalFadeOut();
	DelayCommand(0.5, SetGlobalFadeIn(0.5, 1.0));
	
	// Since this is replacing k_act_talktrue that originally fired on the opening node when
	// speaking to Iziz the first time, set the TalkedTo boolean to ensure it doesn't repeat
	// in future conversations.
	UT_SetTalkedToBooleanFlag(oIziz);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	DelayCommand(0.1, CP_FaceNPC(oPC, oIziz));
	DelayCommand(0.1, CP_FaceNPC(oPM1, oIziz));
	DelayCommand(0.1, CP_FaceNPC(oPM2, oIziz));
	DelayCommand(0.3, CP_FaceNPC(oIziz, oPC));
	
	DelayCommand(0.5, SetLockOrientationInDialog(oPC, TRUE));
	DelayCommand(0.5, SetLockOrientationInDialog(oPM1, TRUE));
	DelayCommand(0.5, SetLockOrientationInDialog(oPM2, TRUE));
	DelayCommand(0.5, SetLockOrientationInDialog(oIziz, TRUE));
}
