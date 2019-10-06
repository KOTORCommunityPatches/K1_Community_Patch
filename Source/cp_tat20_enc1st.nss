//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09first_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This is an added script that fires on the first node of the DLG with the guard
	the first time the party enters the Enclave. It walks the party forwards while
	the Tusken is speaking.
	
	See also cp_tat20_enc1st, k_ptat_cheifguar, k_ptat_chiefjump, k_ptat_meetchief
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(-21.5,66.757,14.546), 0.0);
	location lPM1 = Location(Vector(-24.0,65.257,14.6), 0.0);
	location lPM2 = Location(Vector(-24.0,68.257,14.6), 0.0);
	vector vGuard = GetPosition(GetObjectByTag("tat20_09first_01", 0));
	
	NoClicksFor(3.0);
	
	SetGlobalFadeIn(0.5, 2.0);
	
	ActionPauseConversation();
	
	CP_PartyMove(oPC, lPC);
	DelayCommand(1.5, CP_PartyMove(oPM1, lPM1));
	DelayCommand(1.5, CP_PartyMove(oPM2, lPM2));
	
	DelayCommand(2.0, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(vGuard))));
	DelayCommand(2.0, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(vGuard))));
	
	DelayCommand(6.0, ActionResumeConversation());
}
