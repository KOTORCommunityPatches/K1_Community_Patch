//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter script for tat_m20aa (Tatooine Sand People Enclave).
	
	This is the OnEnter for the Sand People Enclave, now combined with the contents
	of the vanilla script thanks to clues from AmanoJyaku on getting DeNCS to
	decompile the original. It addresses issues with Griff failing to spawn when
	intended, holds the module fade-in when returning to the Chief with the moisture
	vaporators, and includes the Sand People reputation fix so it gets set correctly
	on module load.
	
	Updated 2021/11/29 to remove the delay from the Griff spawning function (used in
	the vanilla function) after experiencing a repeated spawning of Griff and his
	guards. Griff function moved out to include.
	
	Issue #6: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/6
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #293: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/293
	
	Issue #512: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/512
	
	AFP ??? / JC 2019-09-29 / DP 2019-10-06 / DP 2020-06-15 / DP 2021/11/29		*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"

void main() {
	
	object oPC = GetFirstPC();
	object oVaporator = GetItemPossessedBy(oPC, "tat17_vaporator");
	object oChief = GetObjectByTag("tat20_09chief_01", 0);
	
	DelayCommand(0.1, CP_SandRepFix());
	DelayCommand(0.3, CP_SpawnGriff());
	
	SetGlobalNumber("tat_AreaLocator", 4);
	
	if (GetIsObjectValid(oVaporator) == TRUE)
		{
			HoldWorldFadeInForDialog();
			NoClicksFor(0.7);
			DelayCommand(0.5, AssignCommand(oChief, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
