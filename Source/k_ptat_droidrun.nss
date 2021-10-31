//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_vorndroid2.dlg in tat_m18ab (Tatooine Sand People Territory).
	
	This script fires at the start of the scene when following Vorn Daasraad's
	droid to his hunting location during the Genoharadan questline. The vanilla
	scene had a few problems with the party chasing the droid, particularly when
	someone was using Force Speed. Characters had a tendency to bump into each
	other. One of the party members could also end up stopping half-way due to
	their pathfinding being broken by the corpse of the Krayt Dragon.
	
	See also k_ptat_forcejmp.
	
	Issue #327: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/327
	
	DP 2021-10-31																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oDroid = GetObjectByTag("vornsdroid", 0);
	object oPC_WPStart = GetObjectByTag("tat_pc_run_start", 0);
	object oPM1_WPStart = GetObjectByTag("tat_assoc1_run_start", 0);
	object oPM2_WPStart = GetObjectByTag("tat_assoc2_run_start", 0);
	location lPC_WPRun = GetLocation(GetObjectByTag("tat_pc_run", 0));
	location lPM1_WPRun = GetLocation(GetObjectByTag("tat_assoc1_run", 0));
	//location lPM2_WPRun = GetLocation(GetObjectByTag("tat_assoc2_run", 0));
	location lDroid_WPRun = GetLocation(GetObjectByTag("tat_droid_run", 0));
	location lSpDroid = GetLocation(GetObjectByTag("tat_droid_run_start", 0));
	location lSpVorn = GetLocation(GetObjectByTag("tat_vorn_spawn", 0));
	location lSpKrayt = GetLocation(GetObjectByTag("tat_krayt_spawn", 0));
	location lSpFire = GetLocation(GetObjectByTag("tat_cut_fire_wp", 0));
	location lSpRubble = GetLocation(GetObjectByTag("tat_rubble_wp", 0));
	
	SetPartyLeader(NPC_PLAYER);
	
	UT_ActionPauseConversation(5.5);
	
	// Strip off Force Speed to ensure any Jedi don't run into/overtake the droid.
	AssignCommand(oPC, ClearAllEffects());
	AssignCommand(oPM1, ClearAllEffects());
	AssignCommand(oPM2, ClearAllEffects());
	
	UT_TeleportWholeParty(oPC_WPStart, oPM1_WPStart, oPM2_WPStart);
	
	CreateObject(OBJECT_TYPE_CREATURE, "vorn", lSpVorn);
	CreateObject(OBJECT_TYPE_CREATURE, "tat_dead_krayt", lSpKrayt);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_cut_fire", lSpFire);
	CreateObject(OBJECT_TYPE_PLACEABLE, "tat_rubble", lSpRubble);
	
	DelayCommand(6.0, DestroyObject(oDroid));
	
	DelayCommand(0.0, UT_CreateObject(OBJECT_TYPE_CREATURE, "vornsdroid2", lSpDroid));
	
	DelayCommand(0.5, CP_PartyMove(GetObjectByTag("vornsdroid2", 0), lDroid_WPRun, TRUE));
	
	// Space out the party so they don't run into each or the droid. Run PM2 to the PC's destination
	// to avoid their pathfinding breaking by getting too close to the Krayt Dragon corpse.
	DelayCommand(0.7, CP_PartyMove(oPC, lPC_WPRun, TRUE));
	DelayCommand(1.8, CP_PartyMove(oPM1, lPM1_WPRun, TRUE));
	DelayCommand(2.0, CP_PartyMove(oPM2, lPC_WPRun, TRUE));
}
