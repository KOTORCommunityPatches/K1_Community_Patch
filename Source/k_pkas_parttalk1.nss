//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas_partyrtrig.utt in kas_m22aa (Kashyyyk Landing Pad).
	
	This is the OnEnter for the trigger at the start of the landing pad that fires
	a scene with party members if Zaalbar is not present hinting you should bring him.
	The vanilla scene was assigned to an invisible placeable, so the party members
	would always look down at the ground. Additionally, only the PC and speaking
	party member were jumped, so now any second party member is jumped into position
	as well.
	
	See also k_pkas_partdone1.
	
	Issue #513: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/513
	
	DP 2022-12-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"
#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oEntering = GetEnteringObject();
	object oInvis = GetObjectByTag("kas22_partspeak1", 0);
	object oParty;
	location lPC = Location(Vector(94.70,55.42,62.88), 180.00);
	location lParty = Location(Vector(92.66,55.47,62.88), 0.00);
	location lPM = Location(Vector(93.73,56.85,62.88), -90.00);
	
	if (GetZaalbarTalk1Local(OBJECT_SELF) || GetPartyTalk1Local(OBJECT_SELF))
		{
			DestroyObject(OBJECT_SELF);
		}
		else if ((GetIsPC(oEntering) && !GetChuundarTalkGlobal() && !GetZaalbarTalk1Local(OBJECT_SELF) && !GetPartyTalk1Local(OBJECT_SELF) && !IsNPCPartyMember(NPC_ZAALBAR)) && (IsNPCPartyMember(NPC_MISSION)
				|| IsNPCPartyMember(NPC_CARTH) || IsNPCPartyMember(NPC_BASTILA) || IsNPCPartyMember(NPC_JUHANI) || IsNPCPartyMember(NPC_CANDEROUS) || IsNPCPartyMember(NPC_HK_47)))
					{
						SetGlobalFadeOut();
						
						NoClicksFor(2.0);
						
						if (IsNPCPartyMember(NPC_MISSION))
							{
								oParty = GetObjectByTag("Mission", 0);
							}
							else if (IsNPCPartyMember(NPC_CARTH))
								{
									oParty = GetObjectByTag("Carth", 0);
								}
								else if (IsNPCPartyMember(NPC_BASTILA))
									{
										oParty = GetObjectByTag("Bastila", 0);
									}
									else if (IsNPCPartyMember(NPC_JUHANI))
										{
											oParty = GetObjectByTag("Juhani", 0);
										}
										else if (IsNPCPartyMember(NPC_CANDEROUS))
											{
												oParty = GetObjectByTag("Cand", 0);
											}
											else if (IsNPCPartyMember(NPC_HK_47))
												{
													oParty = GetObjectByTag("HK47", 0);
												}
						
						SetPartyLeader(NPC_PLAYER);
						
						CP_PartyJump(oPC, lPC);
						DelayCommand(0.5, CP_FaceNPC(oPC, oParty));
						
						CP_PartyJump(oParty, lParty);
						DelayCommand(0.5, CP_FaceNPC(oParty, oPC));
						
						if (oPM1 != oParty)
							{
								CP_PartyJump(oPM1, lPM);
								DelayCommand(0.5, CP_FaceNPC(oPM1, oParty));
							}	
							else if (GetIsObjectValid(oPM2) && oPM2 != oParty)
								{
									CP_PartyJump(oPM2, lPM);
									DelayCommand(0.5, CP_FaceNPC(oPM2, oParty));
								}
						
						DelayCommand(1.5, AssignCommand(oPC, ActionStartConversation(oParty, "22aa_zaalb01_01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
					}
}
