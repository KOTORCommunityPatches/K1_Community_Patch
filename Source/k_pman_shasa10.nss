//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for man27aa_init01.utt in manm27aa (Manaan Sith Base).
	
	This is the trigger OnEnter that initiates the scene with Shasa and her fellow
	Selkath Sith apprentices. It has been altered to jump the party into positions
	that leave enough room for the Selkath to pathfind past when they exit in the
	LS resolution of the conversation.
	
	Updated 2023-12-08 to tweak the PC's initial facing slightly.
	
	Updated 2023-12-19 to disable the party member AI to ensure they obey commands
	and flush Shasa's action stack so that her ambient animations don't delay the
	scene from initiating.
	
	See also cp_man27aa_shajp, k_pman_shasa04.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-24 / DP 2023-12-08 / DP 2023-12-19								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oFace = GetObjectByTag("man27_seljed1");
	object Shasa = GetObjectByTag("man27_shasa");
	location lPC = Location(Vector(234.13,32.49,0.00), 30.00);
	location lPM1 = Location(Vector(233.95,34.49,0.00), -40.00);
	location lPM2 = Location(Vector(232.31,33.35,0.00), -10.00);
	
	if (IsObjectPartyMember(GetEnteringObject()) && GetGlobalNumber("MAN_MISSING_PLOT") < 2 && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			DelayCommand(1.0, SetGlobalFadeIn(0.1, 1.0));
			
			NoClicksFor(2.0);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_ToggleAI(oPM1);
			CP_ToggleAI(oPM2);
			
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(1.1, CP_FaceNPC(oPC, oFace));
			
			DelayCommand(0.8, AssignCommand(Shasa, ClearAllActions()));
			DelayCommand(0.9, AssignCommand(Shasa, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
