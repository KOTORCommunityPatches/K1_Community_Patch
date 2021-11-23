//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_bastexit.dlg/unk41_carth.dlg/unk41_mission.dlg in unk_m41aa
	(Lehon Central Beach).
	
	This script runs the party towards the Ebon Hawk at the end of the Lehon
	beach showdown. Originally this was only used for the DS version of the
	scene, but it has also now been added to the LS version (which previously
	just cut from Carth speaking straight to a module transition). It also adds
	the journal entry for Canderous that was removed from the DS branch of the
	first DLG, since that was causing a pop-up notification between that and
	the start of the DLG handling dealing with Mission.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale17, k_punk_finale18, k_punk_finale19, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oHK = GetObjectByTag("HK47", 0);
	object oT3 = GetObjectByTag("T3M4", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oJol = GetObjectByTag("jolee", 0);
	object oJuh = GetObjectByTag("juhani", 0);
	location lEnd_PC = Location(Vector(89.33,141.91,21.76), 185.81);
	location lEnd_Bast = Location(Vector(90.20,139.85,21.76), 185.81);
	location lEnd_Cand = Location(Vector(88.62,139.92,21.76), 185.81);
	location lEnd_HK = Location(Vector(87.25,142.46,21.76), 185.81);
	location lEnd_T3 = Location(Vector(87.19,140.77,21.76), 185.81);
	location lEnd_Zaal = Location(Vector(89.39,143.54,21.76), 185.81);
	location lEnd_Juh = Location(Vector(91.70,141.10,21.78), 185.81);
	location lEnd_Jol = Location(Vector(92.73,142.59,21.94), 185.81);
	location lEnd_Miss = Location(Vector(91.03,143.38,21.78), 185.81);
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	SetGlobalFadeOut(1.0, 2.0);
	
	// Add the journal entry for Canderous that was removed from the DS branch of unk41_carth.dlg.
	AddJournalQuestEntry("k_swg_canderous", 120, FALSE);
	
	// Strip off Force Speed.
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oBast, ClearAllEffects());
	AssignCommand(oJol, ClearAllEffects());
	AssignCommand(oJuh, ClearAllEffects());
	
	// Run everyone to the Hawk for both endings.
	ActionDoCommand(CP_PartyMove(oT3, lEnd_T3, TRUE));
	ActionDoCommand(CP_PartyMove(oHK, lEnd_HK, TRUE));
	ActionDoCommand(CP_PartyMove(oCand, lEnd_Cand, TRUE));
	ActionDoCommand(CP_PartyMove(oMiss, lEnd_Miss, TRUE));
	ActionDoCommand(CP_PartyMove(oBast, lEnd_Bast, TRUE));
	ActionDoCommand(CP_PartyMove(oPC, lEnd_PC, TRUE));
	ActionDoCommand(CP_PartyMove(oZaal, lEnd_Zaal, TRUE));
	ActionDoCommand(CP_PartyMove(oJol, lEnd_Jol, TRUE));
	ActionDoCommand(CP_PartyMove(oJuh, lEnd_Juh, TRUE));
	ActionDoCommand(CP_PartyMove(oCarth, lEnd_Bast, TRUE));
	
	DelayCommand(3.5, ActionResumeConversation());
}
