//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    UserDefine for g_gizka016.utc in ebo_m12aa (Ebon Hawk).
	
    This is the OUD for the Gizka that spawn on the Hawk. The OnHeartbeat event
	has been expanded to add a check for encroaching upon the spawn points of
	the party members. Because the party are destroyed and respawned every time
	the Hawk module is entered, a nearby Gizka could cause the spawning party
	member to be displaced from their intended location. They should hopefully
	now keep clear of those spots.

	Issue #631: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/631
	
	DP 2022-08-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 666) // CUSTOM EVENT
		{
			ClearAllActions();
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
		}
	else if (nUser == 1001) // HEARTBEAT
		{
			if (GetStandardFaction(OBJECT_SELF) == STANDARD_FACTION_GIZKA_1 && !GetIsConversationActive())
				{
					object oWP = GetNearestObject(OBJECT_TYPE_WAYPOINT);
					string sTag = GetTag(oWP);
					
					if (sTag == "pebn_bastila" || sTag == "pebn_canderous" || sTag == "pebn_carth" || sTag == "pebn_hk47" || sTag == "pebn_jolee"
					|| sTag == "pebn_juhani" || sTag == "pebn_mission" || sTag == "pebn_t3m4" || sTag == "pebn_zaalbar")
						{
							if (GetDistanceBetween(OBJECT_SELF, oWP) < 1.5)
								{
									ActionMoveAwayFromObject(oWP, FALSE, 1.5);
								}
								else
									{
										ActionRandomWalk();
									}
						}
						else
							{
								ActionRandomWalk();
							}
				}
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
			ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_GIZKA_2);
			
			object oNearest = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY);
			
			if (GetIsObjectValid(oNearest))
				{
					ActionAttack(oNearest);
				}
			
			DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(666)));
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
	else if (nUser == 1011) //DIALOGUE END
		{
		
		}
	else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase();
		}
}
