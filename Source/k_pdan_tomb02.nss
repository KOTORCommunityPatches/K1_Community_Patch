//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for dan14_tombtrig.utt in danm14aa (Dantooine Jedi Enclave Courtyard).
	
	This is the trigger OnEnter that fires the cutscene of the party approaching
	the entrance of the Star Map ruins in the Dantooine Enclave courtyard. The
	vanilla script always fired on the first entrance, even if Bastila wasn't
	present, so that has now been changed to only fire when she is in the party.
	
	Issue #608: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/608
	
	DP 2022-06-22																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
	object oInvis = GetObjectByTag("dan14_cut02", 0);
	
	if (GetIsPC(oEntering) && IsNPCPartyMember(NPC_BASTILA) && CP_HasNeverTriggered())
		{
			AssignCommand(oInvis, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
}
