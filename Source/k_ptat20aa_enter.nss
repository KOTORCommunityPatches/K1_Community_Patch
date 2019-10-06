//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Module OnEnter for tat_m20aa (Tatooine Sand People Enclave).

	Giff spawn fix by A Future Pilot. Fixes an issue with Griff not spawning.
	I bloody hate Griff.
	
	See also cp_m20aa_en.

//////////////////////////////////////////////////////////////////////////////////

	Sand People hostility fix. Fixes an issue with the Sand People hostility state
	not being set correctly after the player uses the rapid transit system or loads
	from a save while disguised.

	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-29
	
//////////////////////////////////////////////////////////////////////////////////
	
	Added in a check for the player returning with the vaporators, holding the
	fade-in on module transition until the conversation begins if so.
	
	Issue #293: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/293
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void CP_ChiefVapReturn() {
	
	object oPC = GetFirstPC();
	object oVaporator = GetItemPossessedBy(oPC, "tat17_vaporator");
	
	if (GetIsObjectValid(oVaporator))
		{
			HoldWorldFadeInForDialog();
		}
}

void CP_GriffFix() {
	
	if (GetGlobalNumber("Mis_MissionTalk") == 9 && !GetIsObjectValid(GetObjectByTag("tat20_griff")))
		{	
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_griff", GetLocation(GetWaypointByTag("tat20_wp_griff")));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 0)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 1)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 2)));
			CreateObject(OBJECT_TYPE_CREATURE, "tat20_09warr_01", GetLocation(GetObjectByTag("tat20_griffguard", 3)));
		}
}

void main() {
	
	// Hold the fade-in until the convo starts if the player has the moisture vaporators
	CP_ChiefVapReturn();
	
	// Execute original script
	ExecuteScript("cp_m20aa_en", OBJECT_SELF, -1);
	
	// Sand People reputation fix
	CP_SandRepFix();

	// If we've talked to the Czerka officer about Griff and Griff hasn't already spawned
	DelayCommand(2.0, CP_GriffFix());
}
