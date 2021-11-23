//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_bastexit.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires on the opening node of Bastila's DLG in the killing both
	Zaalbar and Mission route, once both are dead. The original moved Bastila
	towards the player, but now the whole party is jumped back into their
	pre-combat positions for a cleaner shot. It also adds Zaalbar and Mission's
	duped gear to the player's inventory just before the module transition.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05,
	k_punk_finale06, k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////


#include "cp_inc_k1"

void CP_AddGear() {
	object oInvis = GetObjectByTag("invish", 0);
	object oItem = GetFirstItemInInventory(oInvis);

	while (GetIsObjectValid(oItem))
		{
			CreateItemOnObject(GetTag(oItem), GetFirstPC(), 1);
			
			oItem = GetNextItemInInventory(oInvis);
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oHK = GetObjectByTag("HK47", 0);
	object oT3 = GetObjectByTag("T3M4", 0);
	location lPCStart = Location(Vector(110.73,144.14,24.24), 191.25);
	location lBastStart = Location(Vector(111.30,141.31,24.36), 101.25);
	location lCandStart = Location(Vector(108.76,141.69,24.03), 56.25);
	location lHKStart = Location(Vector(105.06,144.13,23.57), 22.50);
	location lT3Start = Location(Vector(106.45,142.25,23.85), 38.12);
	
	ActionPauseConversation();
	
	NoClicksFor(1.5);
	
	// Jump the party to account for them being scattered when killing both Zaalbar and Mission.
	ActionDoCommand(CP_PartyJump(oPC, lPCStart));
	ActionDoCommand(CP_PartyJump(oBast, lBastStart));
	ActionDoCommand(CP_PartyJump(oCand, lCandStart));
	ActionDoCommand(CP_PartyJump(oHK, lHKStart));
	ActionDoCommand(CP_PartyJump(oT3, lT3Start));
	
	// Duplicate Zaalbar/Mission's gear into the player's inventory.
	ActionDoCommand(CP_AddGear());
	
	DelayCommand(1.0, ActionResumeConversation());
}
