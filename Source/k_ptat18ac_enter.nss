////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is the OnEnter for the Eastern Dune Sea, now combined with the contents
	of the vanilla script thanks to clues from AmanoJyaku on getting DeNCS to
	decompile the original. Fixes an issue with the Sand People hostility state
	not being set correctly after the player uses the rapid transit system.
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	JC 2019-09-29 / DP 2020-06-15                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"
#include "k_inc_tat"

void CreateHolocron() {
	
	object oWP = GetWaypointByTag("K_SWG_BODY_LOC");
	location lWP = GetLocation(oWP);
	
	CreateObject(OBJECT_TYPE_PLACEABLE, "k_swg_helena01", lWP);
}

void main() {
	
	object oPC = GetFirstPC();
	object oHolocron = GetObjectByTag("K_SWG_HELENA01", 0);
	
	SandpeopleDisguiseUsable();
	
	if (GetGlobalNumber("K_SWG_HELENA") == 3 && GetIsObjectValid(oHolocron) == FALSE)
		{
			DelayCommand(1.0, CreateHolocron());
		}
	
	CP_SandRepFix();
}
