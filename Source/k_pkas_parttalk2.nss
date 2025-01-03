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
	
	Updated 2022-12-28 to tweak the function order and face everyone appropriately.
	
	Issue #332: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/332
	
	DP 2020-06-04 / DP 2022-12-28												*/
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
	
	if (GetZaalbarTalk2Local(OBJECT_SELF) || GetPartyTalk2Local(OBJECT_SELF))
		{
			DestroyObject(OBJECT_SELF);
		}
		else if ((GetIsPC(oEntering) && !GetChuundarTalkGlobal() && !GetZaalbarTalk2Local(OBJECT_SELF) && !GetPartyTalk2Local(OBJECT_SELF) && !IsNPCPartyMember(NPC_ZAALBAR))
				&& (IsNPCPartyMember(NPC_MISSION) || IsNPCPartyMember(NPC_CARTH) || IsNPCPartyMember(NPC_BASTILA) || IsNPCPartyMember(NPC_JUHANI)))
					{
						SetGlobalFadeOut();
						
						NoClicksFor(2.5);
						
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
						
						DelayCommand(1.5, AssignCommand(oPC, ActionStartConversation(oParty, "22aa_zaalb02_01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
					}
}
