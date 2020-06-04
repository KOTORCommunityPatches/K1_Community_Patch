//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_partytrig2.utt in kas_m22ab (Kashyyyk The Great Walkway).
	
	This is the OnEnter for the trigger at the start of the Great Walkway that fires
	a scene with party members if Zaalbar is not present hinting you should bring him.
	The vanilla scene was assigned to an invisible placeable, so the party members
	would always look down at the ground. Additionally, the waypoints the that were
	used to jump the party had the wrong tags, meaning the scene started with the
	party scattered. This has been rectified by having the player start the convo
	with the party member, as well as jumping any second party member into position
	as well.
	
	Issue #332: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/332
	
	DP 2020-06-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"
#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oParty;
	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(57.35,283.4,21.153), -125.0);
	location lParty = Location(Vector(55.457,281.373,21.316), 45.0);
	location lPM = Location(Vector(58.3,280.7,21.3), 108.0);
	
	if (GetZaalbarTalk2Local(OBJECT_SELF) == TRUE || GetPartyTalk2Local(OBJECT_SELF) == TRUE)
		{
			DestroyObject(OBJECT_SELF);
		}
		else
			{
				if ((GetIsPC(oEntering) == TRUE && GetChuundarTalkGlobal() == FALSE && GetZaalbarTalk2Local(OBJECT_SELF) == FALSE && GetPartyTalk2Local(OBJECT_SELF) == FALSE && IsNPCPartyMember(NPC_ZAALBAR) == FALSE) && (IsNPCPartyMember(NPC_MISSION) == TRUE || IsNPCPartyMember(NPC_CARTH) == TRUE || IsNPCPartyMember(NPC_BASTILA) == TRUE || IsNPCPartyMember(NPC_JUHANI) == TRUE))
					{
						SetGlobalFadeOut();
						
						if (IsNPCPartyMember(NPC_MISSION) == TRUE)
							{
								oParty = GetObjectByTag("Mission", 0);
							}
							else if (IsNPCPartyMember(NPC_CARTH) == TRUE)
										{
											oParty = GetObjectByTag("Carth", 0);
										}
										else if (IsNPCPartyMember(NPC_BASTILA) == TRUE)
													{
														oParty = GetObjectByTag("Bastila", 0);
													}
													else if (IsNPCPartyMember(NPC_JUHANI) == TRUE)
																{
																	oParty = GetObjectByTag("Juhani", 0);
																}
						
						if (oPM1 != oParty)
							{
								CP_PartyJump(oPM1, lPM);
								DelayCommand(1.0, AssignCommand(oPM1, ClearAllActions()));
							}	
							else if (GetIsObjectValid(oPM2) && oPM2 != oParty)
								{
									CP_PartyJump(oPM2, lPM);
									DelayCommand(1.0, AssignCommand(oPM2, ClearAllActions()));
								}
						
						SetPartyLeader(NPC_PLAYER);
						CP_PartyJump(oPC, lPC);
						// Running a ClearAllActions after the jump seems to cure the player of freezing post-conversation.
						DelayCommand(1.0, AssignCommand(oPC, ClearAllActions()));
						CP_PartyJump(oParty, lParty);
						DelayCommand(1.0, AssignCommand(oParty, ClearAllActions()));
						NoClicksFor(2.5);
						AssignCommand(oPC, DelayCommand(1.5, ActionStartConversation(oParty, "22aa_zaalb02_01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
					}
			}
}
