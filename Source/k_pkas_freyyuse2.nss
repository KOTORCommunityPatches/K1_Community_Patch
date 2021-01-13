//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for kas23_freyyr_01.utc in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This is Freyyr's UserDefine script. When siding with him, his OnHeartbeat
	event will kick in as soon as Chuundar and his goons are all dead, starting
	a conversation with the player. Since this originally started with everyone
	scattered all over the place, the camera could end up clipping inside any
	NPCs between the player and the current speaker. Additionally, the player
	and the party members could be at 1 hitpoint during the conversation, making
	for some awkward framing. A fadeout has been added to jump everyone back
	to their pre-fight starting positions (with Freyyr standing where Chuundar
	was) and everyone is healed. This is more or less identical to Chuundar's
	UserDefine, aside from the OnDeath function.
	
	See also k_pkas_chuunuser.
	
	Issue #121: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/121
	
	DP 2021-01-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_kas"

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 1001) //HEARTBEAT
		{
			if (GetFinalBattleLocal() == TRUE && GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, OBJECT_SELF)) == FALSE && GetIsConversationActive() == FALSE)
				{
					object oPC = GetFirstPC();
					object oPM1 = CP_GetPartyMember(1);
					object oPM2 = CP_GetPartyMember(2);
					object oZaal = GetObjectByTag("Zaalbar", 0);
					object oPCWP = GetWaypointByTag("kas23_meetking2");
					object oPM1WP = GetWaypointByTag("kas23_meetking3");
					object oPM2WP = GetWaypointByTag("kas23_meetking4");
					location lFrey = Location(Vector(13.98,6.97,3.79), 56.25);
					location lZaal = Location(Vector(15.68,5.74,3.75), 101.25);
					
					NoClicksFor(1.5);
					
					SetGlobalFadeOut();
					
					// Cancel everyone out of combat. Make sure the player is party leader.
					SetPartyLeader(NPC_PLAYER);
					SurrenderToEnemies();
					AssignCommand(oPC, CancelCombat(OBJECT_SELF));
					AssignCommand(oPM1, CancelCombat(OBJECT_SELF));
					AssignCommand(oPM2, CancelCombat(OBJECT_SELF));
					AssignCommand(oZaal, CancelCombat(OBJECT_SELF));
					
					// Heal everyone so they aren't half-dead during the post-fight conversation.
					// Since stunt Zaalbar uses the same tag, he'll get picked up by the party function.
					UT_HealAllPartyNPCs();
					UT_HealNPC(OBJECT_SELF);
					
					// Jump the party, Zaalbar, and Freyyr under the fadeout before starting the conversation.
					CP_PartyJumpObject(oPC, oPCWP);
					CP_PartyJumpObject(oPM1, oPM1WP);
					CP_PartyJumpObject(oPM2, oPM2WP);
					CP_PartyJump(OBJECT_SELF, lFrey);
					CP_PartyJump(oZaal, lZaal);
					
					DelayCommand(0.9, AssignCommand(oPC, SetFacingPoint(GetPositionFromLocation(lFrey))));
					DelayCommand(1.0, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 0.5)));
					DelayCommand(0.9, AssignCommand(oPM1, SetFacingPoint(GetPositionFromLocation(lFrey))));
					DelayCommand(0.9, AssignCommand(oPM2, SetFacingPoint(GetPositionFromLocation(lFrey))));
					
					SetGlobalFadeIn(1.5, 1.5);
					DelayCommand(1.0, ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
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
			SetFreyyrDeadGlobal(TRUE);
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
