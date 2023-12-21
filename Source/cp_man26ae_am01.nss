////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnFailToOpen for man26ac_door005.utd in manm26ae (Manaan East Central).
	
	This is the door OnFailToOpen script that triggers the scene of the player's
	post-Hrakert Rift arrest by Selkath authorities outside the Republic Embassy.
	Replaces the original OnOpen script, k_pman_post01, due to potential filename
	clashes. The original script just had an invisible placeable start the scene
	when the door was opened. Now the door is also locked as well as closed by the
	module OnEnter, and the script has been switched to an OnFailToOpen in order
	to allow for the party to be jumped into position first.
	
	See also cp_man26ae_am02, cp_man26ae_amend, k_pman_post05, k_pman_area_26e.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2023-12-21																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oInvis = GetObjectByTag("man26ae_cut01");
	location lPC = Location(Vector(60.54,62.07,56.32), 180.00);
	location lPM1 = Location(Vector(62.16,60.82,56.32), 180.00);
	location lPM2 = Location(Vector(62.16,63.32,56.32), 180.00);
	
	if (GetGlobalBoolean("MAN_STARMAP_FOUND") && CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			
			NoClicksFor(0.5);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_RemoveForceSpeed(oPC);
			CP_RemoveForceSpeed(oPM1);
			CP_RemoveForceSpeed(oPM2);
			
			AssignCommand(oPM1, CP_DisableAI(TRUE));
			AssignCommand(oPM2, CP_DisableAI(TRUE));
			
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(0.25, CP_DLGLock(oPC, TRUE));
			
			DelayCommand(0.3, AssignCommand(oInvis, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
