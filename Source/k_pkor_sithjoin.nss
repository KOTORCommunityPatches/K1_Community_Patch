////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_utharwynn.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script is fired when the player enters the Academy for the first
	time and the introductory cutscene with Uthar plays. The vanilla scene
	tended to be a bit of a mess, so the party members have been jumped out
	of the way. Additionally, while there is provision to stop the wandering
	NPCs from moving while Uthar is talking to prevent them blundering into
	the middle of the conversation, they can still end up in the way, so now
	they are jumped back to the edges of the room any time Uthar talks.
	
	See also k_pkor_uth_talk.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void JumpWalkers() {
	
	object oGuard2 = GetObjectByTag("kor35_sithguard2", 0);
	object oGuard3 = GetObjectByTag("kor35_sithguard3", 0);
	object oGuard4 = GetObjectByTag("kor35_sithguard4", 0);
	object oStudentF = GetObjectByTag("k35_stdnt_wndrf", 0);
	object oStudentM = GetObjectByTag("k35_stdnt_wndrm", 0);
	object oUthar = GetObjectByTag("kor35_utharwynn", 0);
	location lGuard2 = Location(Vector(121.5,91.0,3.15), -90.0);
	location lGuard3 = Location(Vector(140.517,71.954,3.15), 180.0);
	location lGuard4 = Location(Vector(104.116,72.498,3.15), 0.0);
	location lStudentF = Location(Vector(153.146,72.632,5.061), 180.0);
	location lStudentM = Location(Vector(138.65,73.743,3.15), 225.0);
	vector vUthar = GetPosition(oUthar);
	
	CP_PartyJump(oGuard2, lGuard2);
	CP_PartyJump(oGuard3, lGuard3);
	CP_PartyJump(oGuard4, lGuard4);
	CP_PartyJump(oStudentF, lStudentF);
	CP_PartyJump(oStudentM, lStudentM);
	
	DelayCommand(0.5, AssignCommand(oGuard2, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oGuard3, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oGuard4, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oStudentF, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oStudentM, SetFacingPoint(vUthar)));
}

void main() {

	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oUthar = GetObjectByTag("kor35_utharwynn", 0);
	object oYuthura = GetObjectByTag("kor35_yuthura", 0);
	object oLashowe = GetObjectByTag("kor35_lashowe", 0);
	object oMekel = GetObjectByTag("kor35_mekel", 0);
	object oShaardan = GetObjectByTag("kor35_shaardan", 0);
	object oHijata = GetObjectByTag("kor35_hijata", 0);
	object oWP_Yuth = GetObjectByTag("k35_way_yuthjoin", 0);
	object oWP_Lash = GetObjectByTag("k35_way_lashjoin", 0);
	object oWP_Meke = GetObjectByTag("k35_way_mekejoin", 0);
	object oWP_Shaa = GetObjectByTag("k35_way_shaajoin", 0);
	object oWP_Hija = GetObjectByTag("k35_way_hijajoin", 0);
	location lPM1 = Location(Vector(118.0,60.0,3.15), 90.0);
	location lPM2 = Location(Vector(125.0,60.0,3.15), 90.0);
	vector vUthar = GetPosition(oUthar);
	
	SetGlobalBoolean("KOR_UTHAR_TALK", TRUE);
	
	JumpWalkers();
	
	ActionPauseConversation();
	
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	DelayCommand(0.5, AssignCommand(oPM1, SetFacingPoint(vUthar)));
	DelayCommand(0.5, AssignCommand(oPM2, SetFacingPoint(vUthar)));
	
	AssignCommand(oYuthura, ActionMoveToObject(oWP_Yuth));
	AssignCommand(oLashowe, ActionMoveToObject(oWP_Lash));
	AssignCommand(oMekel, ActionMoveToObject(oWP_Meke));
	AssignCommand(oShaardan, ActionMoveToObject(oWP_Shaa));
	AssignCommand(oHijata, ActionMoveToObject(oWP_Hija));
	
	DelayCommand(3.0, ActionResumeConversation());
}
