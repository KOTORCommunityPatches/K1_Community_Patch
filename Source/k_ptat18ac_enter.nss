//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for tat_m18ac (Tatooine Eastern Dune Sea).
	
	This is the OnEnter for the Eastern Dune Sea, now combined with the contents
	of the vanilla script thanks to clues from AmanoJyaku on getting DeNCS to
	decompile the original. Fixes an issue with the Sand People hostility state
	not being set correctly after the player uses the rapid transit system.
	
	Updated 2023-12-11 to move the holocron creation function out to the include.
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	JC 2019-09-29 / DP 2020-06-15 / DP 2023-12-11								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {
	
	object oPC = GetFirstPC();
	object oHolocron = GetObjectByTag("K_SWG_HELENA01", 0);
	
	DelayCommand(0.1, CP_SandRepFix());
	DelayCommand(0.2, CP_SandpeopleDisguiseUsable());
	
	if (GetGlobalNumber("K_SWG_HELENA") == 3 && GetIsObjectValid(oHolocron) == FALSE)
		{
			DelayCommand(1.0, CP_CreateHolocron());
		}
}
