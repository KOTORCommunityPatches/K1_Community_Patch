////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine script for kas25_kinrath.utc in kas_m25aa (Kashyyyk Lower
	Shadowlands).
	
	This replaces the generic vanilla UserDefine script for the Viper Kinrath
	in the Lower Shadowlands that drop the ritual corpse quest item. Adds in
	a new custom event to destroy the corpse item when signalled by one of
	the other Viper Kinrath in their OnDeath event.
	
	See also cp_kas_dstkinbdy.
	
	Issue #124: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/124
	
	DP 2019-09-29                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main()
{
    int nUser = GetUserDefinedEventNumber();

	if (nUser == 100) // Custom Event - Destroy corpse item
		{
			DestroyObject(GetItemPossessedBy(OBJECT_SELF, "kas25_kinrathbod"));
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
    else if (nUser == 1011) // DIALOGUE END
		{
		
		}
    else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase();
		}
}
