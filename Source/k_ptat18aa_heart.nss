//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnHeartbeat script for tat_m18aa (Tatooine Dune Sea).
	
	Fixes an issue with the Sand People hostility state not being set correctly
	after the player uses the rapid transit system.
	
	Updated 2023-08-16 to include the vanilla heartbeat functionality, thanks to
	clues from AmanoJyaku on getting DeNCS to decompile the original.
	
	Issue #217: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/217
	
	Issue #21: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/21
	
	JC 2019-09-29 / DP 2023-08-16												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_tat"
#include "k_inc_generic"

void main() {

	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	int nCheck0 = FALSE;
	int nCheck1 = FALSE;
	int nCheck2 = FALSE;
	string sDisguise = "tat17_sandperdis";
	
	CP_SandRepFix();
	
	if (GetTag(oPM0) == "HK47" || GetTag(oPM0) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM0)) == sDisguise)
		{
			nCheck0 = TRUE;
		}
	
	if (!GetIsObjectValid(oPM1) || GetTag(oPM1) == "HK47" || GetTag(oPM1) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM1)) == sDisguise)
		{
			nCheck1 = TRUE;
		}
	
	if (!GetIsObjectValid(oPM2) || GetTag(oPM2) == "HK47" || GetTag(oPM2) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise)
		{
			nCheck2 = TRUE;
		}
	
	// The K1CP CP_SandRepFix() function replicates most of the original script, except for the block that makes sure any Sandpeople attack the party.
	// Modified slightly here to limit it to hostile creatures whereas the vanilla function ran on all creatures.
	if (nCheck0 == FALSE || nCheck1 == FALSE || nCheck2 == FALSE || GetGlobalBoolean("tat_TuskenMad") == TRUE)
		{
			object oCreature = GetFirstObjectInArea();
			int nFaction;
			
			while (GetIsObjectValid(oCreature))
				{
					nFaction = GetStandardFaction(oCreature);
					
					if (nFaction == STANDARD_FACTION_HOSTILE_1 || nFaction == STANDARD_FACTION_HOSTILE_2)
						{
							AssignCommand(oCreature, GN_DetermineCombatRound());
						}
					
					oCreature = GetNextObjectInArea();
				}
		}
}
