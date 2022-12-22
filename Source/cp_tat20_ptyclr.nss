//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09first_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This script fires on an added node when the party enters the Sand People
	Enclave for the first time and chooses a hostile response (with or without
	HK). After the party has had their disguises stripped, it flushes them with
	an animation to try and prevent them T-posing, as the original script tended
	to do.
	
	Updated 2022-12-22 to add in a NoClicksFor, since it was possible to click
	through the responses and reveal the party disguise stripping instead of it
	happening off-screen. 
	
	See also cp_tat20_fac_d, cp_tat20_strip, k_ptat_tuskenmad.
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2021-12-18 / DP 2022-12-22												*/
//////////////////////////////////////////////////////////////////////////////////

void CP_ClearNPC(object oNPC) {
	AssignCommand(oNPC, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}

void main() {
	
	object oPC = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	
	NoClicksFor(1.5);
	
	ActionPauseConversation();
	
	CP_ClearNPC(oPC);
	CP_ClearNPC(oPM1);
	CP_ClearNPC(oPM2);
	
	DelayCommand(1.5, ActionResumeConversation());
}
