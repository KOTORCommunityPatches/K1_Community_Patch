//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_dehno_01.dlg in kas_m22ab (Kashyyyk The Great Walkway).

	This script fires on the exit node of the scene with Captain Dehno and his two
	offsiders that just killed a Wookiee when things turn hostile. Party members
	could stand by passively, so they are now prompted to attack.
	
	Issue #156: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/156

	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oGuard1 = GetObjectByTag("kas22_czguard_01", 0);
	object oGuard2 = GetObjectByTag("kas22_czguard_02", 0);
	
	ChangeToStandardFaction(oGuard1, STANDARD_FACTION_CZERKA);
	ChangeToStandardFaction(oGuard2, STANDARD_FACTION_CZERKA);
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_CZERKA);
	
	DelayCommand(0.2, ExecuteScript("k_ai_master", oGuard1, 3001));
	DelayCommand(0.2, ExecuteScript("k_ai_master", oGuard2, 3001));
	DelayCommand(0.2, ExecuteScript("k_ai_master", OBJECT_SELF, 3001));
	DelayCommand(0.2, ExecuteScript("k_ai_master", oPM1, 3001));
	DelayCommand(0.2, ExecuteScript("k_ai_master", oPM2, 3001));
}
