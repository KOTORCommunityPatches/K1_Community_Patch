//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for tat_m20aa (Tatooine Sand People Enclave).
	
	This is the OnEnter for the Sand People Enclave, now combined with the contents
	of the vanilla script thanks to clues from AmanoJyaku on getting DeNCS to
	decompile the original. It addresses issues with Griff failing to spawn when
	intended, holds the module fade-in when returning to the Chief with the moisture
	vaporators, and includes the Sand People reputation fix so it gets set correctly
	on module load.
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #293: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/293
	
	AFP ??? / JC 2019-09-29 / DP 2019-10-06 / DP 2020-06-15						*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void SpawnGriff() {
	
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_griff", GetLocation(GetWaypointByTag("tat20_wp_griff")));
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 0)));
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 1)));
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 2)));
	CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 3)));
}

void main() {
	
	object oPC = GetFirstPC();
	object oVaporator = GetItemPossessedBy(oPC, "tat17_vaporator");
	object oChief = GetObjectByTag("tat20_09chief_01", 0);
	int SW_PLOT_BOOLEAN_01 = 0;
	
	SetGlobalNumber("tat_AreaLocator", 4);
	
	if (GetIsObjectValid(oVaporator) == TRUE)
		{
			HoldWorldFadeInForDialog();
			NoClicksFor(0.7);
			DelayCommand(0.5, AssignCommand(oChief, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
	
	// Original vanilla Griff check which could fail.
	//if (GetGlobalNumber("Mis_MissionTalk") == 9 && GetGriffSpawnLocal() == FALSE)
	if (GetGlobalNumber("Mis_MissionTalk") == 9 && !GetIsObjectValid(GetObjectByTag("tat20_griff")))
		{
			// SetGriffSpawnLocal(TRUE);
			// Still set the boolean in case it is used elsewhere, but cut out extraneous include guff.
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			DelayCommand(1.0, SpawnGriff());
		}
	
	CP_SandRepFix();
}
