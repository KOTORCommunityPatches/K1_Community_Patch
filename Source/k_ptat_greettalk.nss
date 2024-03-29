//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Trigger OnEnter for tat17_consert001.utt in tat_m17ag (Tatooine Czerka Office).
	
	This script fires the conversation with Greeta in the Czarka Office when the
	player returns after having given Griff the Tach gland. Since Mission has some
	interjections, she encounters the same problem as in the Griff conversations,
	namely, skating across the floor while trying to move closer to the player and
	performing a talk animation at the same time. To prevent this, the party is now
	jumped into position before the conversation begins.
	
	Updated 2022-07-30 to revise the starting angles of the party members and make
	some other minor tweaks.
	
	Issue #265: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/265
	
	DP 2020-09-16 / DP 2022-07-30												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMiss = GetObjectByTag("mission", 0);
	object oGreeta = GetObjectByTag("tat17_10greet_01", 0);
	location lPC = Location(Vector(-2.42,3.77,1.44), 220.00);
	location lPM2 = Location(Vector(-1.72,5.59,1.39), 240.00);
	location lMiss = Location(Vector(-0.49,4.02,1.39), 200.00);
	
	if (GetIsPC(oEntering) == TRUE)
		{
			if (GetGlobalBoolean("Tat_Greet_Griff"))
				{
					SetPartyLeader(NPC_PLAYER);
					
					SetGlobalFadeOut();
					SetGlobalFadeIn(0.5, 0.5);
					
					NoClicksFor(1.0);
					
					CP_PartyJump(oPC, lPC);
					
					if (IsNPCPartyMember(NPC_MISSION))
						{
							CP_PartyJump(oMiss, lMiss);
							
							if (oPM1 != oMiss)
								{
									CP_PartyJump(oPM1, lPM2);
								}
								else if (oPM2 != oMiss)
									{
										CP_PartyJump(oPM2, lPM2);
									}
						}
						else
							{
								CP_PartyJump(oPM1, lMiss);
								CP_PartyJump(oPM2, lPM2);
							}
					
					AssignCommand(oGreeta, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
					
					DelayCommand(0.2, DestroyObject(OBJECT_SELF));
				}
		}
}
