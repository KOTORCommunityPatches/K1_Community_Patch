//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for n_sithsoldier003.utc in end_m01aa (Endar Spire Command Module).
	
	This is the OUD for the two Sith soldiers just inside the entrance of the
	Bridge that the player has to fight in melee. The original script had two
	checks in the OnDeath event. One that would close and lock the door if both
	the player and Trask were on the Bridge, and another that would fire Trask's
	conversation about Bastila not being on the Bridge. The problem with the former
	was that it could fail to fire due to one of the party not being fully inside
	the room, easy enough to trigger due to the proximity of the two Sith. This
	has now been changed to a simple event signal for an added invisible placeable,
	and all the prior functions offloaded to its OUD.
	
	See also cp_end_bridgecs, cp_end_trasksp_d, k_pend_door20.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2023-01-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_end"

void main() {
	
	object oInvis = GetObjectByTag("cp_end_trasksp", 0);
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 1001) // HEARTBEAT
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
			int nCount = (GetGlobalNumber("END_ROOM7_DEAD") + 1);
			
			if (nCount >= ROOM7_DEAD)
				{
					SignalEvent(oInvis, EventUserDefined(100));
				}
			
			SetGlobalNumber("END_ROOM7_DEAD", nCount);
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
			UT_ReturnToBase("wp_homebase");
		}
}
