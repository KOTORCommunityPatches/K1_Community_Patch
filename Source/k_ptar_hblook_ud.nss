//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for tar03_hiddenbek.utc in tar_m03aa (Taris Lower City).
	
	This is the OUD for the door guard for the Hidden Bek's base. If the player
	engages in combat close enough to her, she'll lend a hand. Her OnHearbeat
	then directs her back to her original door-side post once combat is over.
	The vanilla function left her facing the way she was walking however, so
	this has been updated to face her back into her original position.
	
	Issue #498: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/498
	
	DP 2021-11-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	object oWP = GetObjectByTag("tar03_wpbekpost", 0);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{
			if (!GN_GetIsFighting(OBJECT_SELF) && GetDistanceBetween(OBJECT_SELF, oWP) > 2.0)
				{
					CP_ReturnToBase(GetLocation(oWP), FALSE);
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
}
