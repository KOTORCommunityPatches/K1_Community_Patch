//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for kas_m22aa (Kashyyyk Landing Pad).
	
	This is the OnEnter for the Kashyyyk landing pad. It has been altered to hold
	the fade-in after loading the module the first time the party enters after
	having sided with Chuundar. This prevents the brief hiccup that otherwise
	occurs before the cutscene triggers.
	
	See also k_pkas_captcut02.
	
	Issue #119: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/119
	
	DP 2021-11-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void Spawn_Komad() {
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_xkomad_01", GetLocation(GetWaypointByTag("kas22_komadspawn")), 0);
}

void Spawn_Cage_Guard() {
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_xgczerk_01", GetLocation(GetWaypointByTag("kas22_cageguard")), 0);
}

void Spawn_LS_Ending_NPCs() {
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_rebczer_01", GetLocation(GetWaypointByTag("kas22_wp_reb_01")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_rebczer_02", GetLocation(GetWaypointByTag("kas22_wp_reb_02")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_rebczer_03", GetLocation(GetWaypointByTag("kas22_wp_reb_03")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookfht_01", GetLocation(GetWaypointByTag("kas22_wp_reb_04")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookfht_02", GetLocation(GetWaypointByTag("kas22_wp_reb_05")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookfht_03", GetLocation(GetWaypointByTag("kas22_wp_reb_06")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookfht_10", GetLocation(GetWaypointByTag("kas22_wp_reb_10")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookfht_11", GetLocation(GetWaypointByTag("kas22_wp_reb_11")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookfht_12", GetLocation(GetWaypointByTag("kas22_wp_reb_12")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_rebczer_10", GetLocation(GetWaypointByTag("kas22_wp_reb_13")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_rebczer_11", GetLocation(GetWaypointByTag("kas22_wp_reb_14")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_rebczer_12", GetLocation(GetWaypointByTag("kas22_wp_reb_15")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookgrd_01", GetLocation(GetWaypointByTag("kas22_wookguard1")), 0);
	CreateObject(OBJECT_TYPE_CREATURE, "kas22_wookgrd_01", GetLocation(GetWaypointByTag("kas22_wookguard2")), 0);
}

void main() {
	
	object oPC = GetFirstPC();
	object oJanos = GetObjectByTag("kas22_janos_01", 0);
	object oWP_Janos = GetWaypointByTag("WP_kas22_janos_01_01");
	object oEntering = GetEnteringObject();
	object oDroidHead = GetItemPossessedBy(oPC, "kas24_droidhead");
	
	// When siding with Chuundar, hold the module's fade-in until the cutscene starts.
	if (!GetLoadFromSaveGame() && !UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_10) && oEntering == oPC && GetFreyyrDeadGlobal())
		{
			HoldWorldFadeInForDialog();
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_10, TRUE);
		}
	
	if (GetIsObjectValid(oJanos) && GetJanosPaidLocal(oJanos) && !GetJanosOfficeLocal(oJanos))
		{
			GN_MoveToLastWayPoint(oJanos);
		}
		else if (GetIsObjectValid(oJanos) && !GetJanosPaidLocal(oJanos) && !GetJanosOfficeLocal(oJanos) && GetIsPC(oEntering))
			{
				AssignCommand(oJanos, ActionJumpToObject(oWP_Janos));
				AssignCommand(oJanos, ActionDoCommand(SetFacing(GetFacing(oWP_Janos))));
			}
	
	if (GetChuundarDeadGlobal() && !GetWookieRebelsLocal(OBJECT_SELF))
		{
			object oNPC = GetFirstObjectInArea(OBJECT_SELF, OBJECT_TYPE_CREATURE);
			object oCorpse = GetObjectByTag("kas22_wookcorpse", 0);
			
			while (GetIsObjectValid(oNPC) == TRUE)
				{
					if (GetTag(oNPC) == "kas22_janos_01" || GetTag(oNPC) == "kas22_czerkag_01" || GetTag(oNPC) == "kas22_czerkag_02"
					|| GetTag(oNPC) == "kas22_czerkag_03" || GetTag(oNPC) == "kas22_czerkag_04" || GetTag(oNPC) == "kas22_czerkas_01"
					|| GetTag(oNPC) == "kas22_czerka2_01" || GetTag(oNPC) == "kas22_czerkam_01" || GetTag(oNPC) == "kas22_xczerka_01"
					|| GetTag(oNPC) == "kas22_xglobal_01" || GetTag(oNPC) == "kas22_xglobal_02" || GetTag(oNPC) == "kas22_xglobal_03"
					|| GetTag(oNPC) == "kas22_eli_01" || GetTag(oNPC) == "kas22_dasol_01" || GetTag(oNPC) == "kas22_xxpazaa_01")
						{
							DestroyObject(oNPC, 0.0, TRUE);
						}
					
					oNPC = GetNextObjectInArea(OBJECT_SELF, OBJECT_TYPE_CREATURE);
				}
			
			DelayCommand(0.2, Spawn_LS_Ending_NPCs());
			DestroyObject(oCorpse);
			SetWookieRebelsLocal(TRUE, OBJECT_SELF);
		}
	
	if (GetChuundarDeadGlobal() && GetIsObjectValid(oDroidHead))
		{
			DestroyObject(oDroidHead);
		}
	
	if (GetFreyyrDeadGlobal() && !GetWookieCapturedLocal(OBJECT_SELF))
		{
			DelayCommand(0.2, Spawn_Cage_Guard());
			SetWookieCapturedLocal(TRUE, OBJECT_SELF);
		}
	
	if (!GetGlobalBoolean("tat_KomadDead") && GetGlobalBoolean("tat_KraytDead") && !GetGlobalBoolean("kas_FreyyrDead") && !GetGlobalBoolean("kas_ChuundarDead") && !GetKomadSpawnLocal(OBJECT_SELF))
		{
			DelayCommand(0.2, Spawn_Komad());
			SetKomadSpawnLocal(TRUE, OBJECT_SELF);
		}
	
	if (GetChuundarDeadGlobal() && GetJournalEntry("kas22_EliMatton") > 0 && GetJournalEntry("kas22_EliMatton") < 50)
		{
			AddJournalQuestEntry("kas22_EliMatton", 80);
		}
}
