//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for tat18_tuskanfac.utp in tat_m20aa (Tatooine Sand People Enclave).
	
	This is an added OUD for the invisible placeable that controls the faction
	standing with the Sand People. Turning the entire enclave hostile has now
	been farmed out to this, since the original script was typically fired on
	a DLG exit node.
	
	See also cp_tat20_ptyclr, cp_tat20_strip, k_ptat_tuskenmad.
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2021-12-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 100) // CUSTOM EVENT - TURN ALL SAND PEOPLE HOSTILE
		{
			object oPM1 = CP_GetPartyMember(1);
			object oPM2 = CP_GetPartyMember(2);
			object oNPC = GetFirstObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
			
			while (GetIsObjectValid(oNPC))
				{
					if (GetStandardFaction(oNPC) == STANDARD_FACTION_PTAT_TUSKAN)
						{
							ChangeToStandardFaction(oNPC, STANDARD_FACTION_HOSTILE_1);
							DelayCommand(0.1, AssignCommand(oNPC, GN_DetermineCombatRound()));
						}
					
					oNPC = GetNextObjectInArea(OBJECT_INVALID, OBJECT_TYPE_CREATURE);
				}
			
			DelayCommand(0.2, AssignCommand(oPM1, GN_DetermineCombatRound()));
			DelayCommand(0.2, AssignCommand(oPM2, GN_DetermineCombatRound()));
		}
	else if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
