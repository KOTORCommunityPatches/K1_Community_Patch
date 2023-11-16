////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for man26a_inittrig0.utt in manm26aa (Manaan Ahto West).
	
	This is the trigger OnEnter that initiates the first conversation with Elora
	when entering Ahto West after she has spawned. It has been changed to jump
	the party into position and selectively initiate the conversation with Jolee
	if he is present, otherwise the PC. This helps alleviate facing issues. Like
	many other Manaan scripts, for some reason this is a global script.
	
	See also cp_man26_elorajp.
	
	Issue #135: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/135
	
	DP 2023-11-16																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJolee = GetObjectByTag("Jolee");
	object oElora = GetObjectByTag("man26_elora");
	location lPC = Location(Vector(12.68,14.50,59.16), 50.00);
	location lJolee = Location(Vector(12.17,15.91,59.16), -10.00);
	location lPM2 = Location(Vector(11.30,14.80,59.16), 20.00);
	
	if (IsObjectPartyMember(GetEnteringObject()) && GetIsObjectValid(oElora) && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			
			NoClicksFor(0.6);
			
			SetPartyLeader(NPC_PLAYER);
			
			if (IsNPCPartyMember(NPC_JOLEE))
				{
					DelayCommand(0.1, CP_PartyJump(oPC, lPC));
					
					// Flush the player with an anim to ensure they don't end up frozen post-convo.
					DelayCommand(0.2, CP_FaceNPC(oPC, oElora));
					
					if (GetTag(oPM1) == "Jolee")
						{
							DelayCommand(0.1, CP_PartyJump(oPM1, lJolee));
							DelayCommand(0.1, CP_PartyJump(oPM2, lPM2));
						}
						else
							{
								DelayCommand(0.1, CP_PartyJump(oPM2, lJolee));
								DelayCommand(0.1, CP_PartyJump(oPM1, lPM2));
							}
					
					DelayCommand(0.5, AssignCommand(oElora, ActionStartConversation(oJolee, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
				else
					{
						DelayCommand(0.1, CP_PartyHerder(lPC, lJolee, lPM2));
						
						// Flush the player with an anim to ensure they don't end up frozen post-convo.
						DelayCommand(0.2, CP_FaceNPC(oPC, oElora));
						
						DelayCommand(0.5, AssignCommand(oElora, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
					}
		}
}
