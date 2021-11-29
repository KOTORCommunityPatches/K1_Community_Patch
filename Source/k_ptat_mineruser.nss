//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for tat18_13craw1_01.utc / tat18_13craw2_01.utc  in tat_m18a
	(Tatooine Dune Sea).
	
	This is the OUD for the Czerka miners next to the sandcrawler. Since they
	will engage with the Sand People if they get close enough during the three
	waves of attacks, they have been given a command to move them back to their
	starting points once combat is over.
	
	Issue #498: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/498
	
	DP 2021-11-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 1001) // HEARTBEAT
		{
			if (GetGlobalNumber("tat_AmbushDead") >= 12)
				{
					if (GetStandardFaction(OBJECT_SELF) == STANDARD_FACTION_FRIENDLY_1)
						{
							ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
						}
					
					if (!GN_GetIsFighting(OBJECT_SELF) && GetTag(OBJECT_SELF) == "tat18_13craw2_01")
						{
							object oMinerGruntA = GetObjectByTag("tat18_13craw1_01", 0);
							object oMinerGruntB = GetObjectByTag("tat18_13craw1_01", 1);
							location lHomeCap = Location(Vector(193.21,171.71,25.92), 130.00);
							location lHomeGruntA = Location(Vector(197.26,174.91,25.80), 155.85);
							location lHomeGruntB = Location(Vector(188.97,168.14,25.72), 104.76);
							
							if (GetDistanceBetweenLocations(GetLocation(OBJECT_SELF), lHomeCap) > 2.0)
								{
									CP_ReturnToBase(lHomeCap, TRUE);
								}
							if (GetDistanceBetweenLocations(GetLocation(oMinerGruntA), lHomeGruntA) > 2.0)
								{
									AssignCommand(oMinerGruntA, CP_ReturnToBase(lHomeGruntA, TRUE));
								}
							if (GetDistanceBetweenLocations(GetLocation(oMinerGruntB), lHomeGruntB) > 2.0)
								{
									AssignCommand(oMinerGruntB, CP_ReturnToBase(lHomeGruntB, TRUE));
								}
						}
				}
		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
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
	else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase();
		}
}
