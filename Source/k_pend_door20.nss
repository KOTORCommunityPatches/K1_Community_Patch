//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnFailToOpen for end_door08.utd in end_m01aa (Endar Spire Command Module).
	
	This script is the OnFailToOpen for the main door to the Endar Spire Bridge.
	It has a few checks to gate entry as part of the forced tutorials, requiring
	both the player and Trask to equip melee weapons. Once the door does open,
	it then has some background Sith and Republic soldiers get blown up. These
	have been tweaked slightly to make sure they only pay attention to each other
	and not the party, and the timings of the explosions have been reduced so that
	they happen before the added cutscene of the door closing.
	
	See also cp_end_bridgecs, cp_end_trasksp_d, k_pend_room7_01.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2023-01-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_end"
 
 void main() {
 	
 	DestroyObject(GetCarth());
	
	if (GetGlobalBoolean("END_BRIDGE_SEALED"))
 		{
 			ActionStartConversation(GetFirstPC(), "end_bridgeseal", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE);
 		}
 		else if (GetGlobalNumber("END_ROOM8_DEAD") >= 2)
 			{
 					if (GetDistanceBetween(GetTrask(), GetFirstPC()) > 10.0)
 						{
 							SetGlobalFadeOut();
 							DelayCommand(0.5, SetGlobalFadeIn(0.0, 0.5));
 							
 							UT_TeleportWholeParty(GetObjectByTag("wp_end_room7_1", 0), GetObjectByTag("wp_end_room7_1", 0), OBJECT_INVALID);
 						}
 					
 					if (GetTraskState() < TRASK_COMBAT_WARNING && GN_GetWeaponType(GetFirstPC()) == 2)
 						{
 							SetTraskState(TRASK_COMBAT_WARNING);
 							
 							TalkTrask();
 						}
 						else if (GetTraskState() == TRASK_COMBAT_WARNING && GN_GetWeaponType(GetFirstPC()) == 2)
 							{
 								SetTraskState(TRASK_COMBAT_WARNING2);
 								
 								TalkTrask();
 							}
 							else
 								{
 									object oSith1 = CreateObject(OBJECT_TYPE_CREATURE, "end_bridgesith1", GetLocation(GetObjectByTag("wp_end_bridgesith1", 0)), 0);
 									object oSith2 = CreateObject(OBJECT_TYPE_CREATURE, "end_bridgesith2", GetLocation(GetObjectByTag("wp_end_bridgesith2", 0)), 0);
									object oRep1 = GetObjectByTag("end_bridgerep1", 0);
									object oRep2 = GetObjectByTag("end_bridgerep2", 0);
									
									// The background Sith could sometimes momentarily charge towards the party, so change the factions of both of
									// them and their paired Republic soldiers so that they only focus on each other.
									ChangeToStandardFaction(oRep1, STANDARD_FACTION_PREY);
									ChangeToStandardFaction(oRep2, STANDARD_FACTION_PREY);
									DelayCommand(0.1, ChangeToStandardFaction(oSith1, STANDARD_FACTION_PREDATOR));
									DelayCommand(0.1, ChangeToStandardFaction(oSith2, STANDARD_FACTION_PREDATOR));
									
									DelayCommand(0.2, AssignCommand(oSith1, ActionAttack(oRep1)));
									DelayCommand(0.2, AssignCommand(oSith2, ActionAttack(oRep2)));
									
									// Blow up the first pair of mooks.
 									DelayCommand(2.0, PlayExplosion("wp_end_bridgeexp1", FALSE, FALSE));
									DelayCommand(2.2, SignalEvent(oSith1, EventUserDefined(20)));
 									DelayCommand(2.6, SignalEvent(GetObjectByTag("end_bridgerep1", 0), EventUserDefined(20)));
 									
									// Blow up the second pair of mooks.
 									DelayCommand(5.0, PlayExplosion("wp_end_bridgeexp2", FALSE, FALSE));
									DelayCommand(5.2, SignalEvent(GetObjectByTag("end_bridgerep2", 0), EventUserDefined(20)));
 									DelayCommand(5.8, SignalEvent(oSith2, EventUserDefined(20)));
									
 									SetLocked(OBJECT_SELF, FALSE);
 									ActionOpenDoor(OBJECT_SELF);
 									
 									SetTraskState(TRASK_LEVEL_DONE);
 								}
 			}
 }
