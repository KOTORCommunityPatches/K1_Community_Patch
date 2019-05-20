////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefine for cp_end_trasksp.utp in end_m01aa (Endar Spire Command Module).
	
	This is the OUD for a new invisible placeable added as a cutscene helper.
	It holds the commands to issue to the new Party Trask after he has joined
	the party and the NPC Trask has been destroyed. Because the Party Trask
	would spawn in behind the player, it was desirable to jump him back to
	the position that NPC Trask was standing in for the sake of consistency.
	Trying to do so with the original scripts failed, presumably due to their
	owner, NPC Trask, having been destroyed before the commands could fire.
	See also k_pend_traskdl29 and k_pend_reset.
	
	DP 2019-05-20                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	int nOUD = GetUserDefinedEventNumber();
		
	switch (nOUD)
	{
		case 50:
			object oTrask = GetPartyMemberByIndex(1);
			object oPC = GetFirstPC();
			location lTraskSp = Location(Vector(16.34,20.5,-1.27), 180.0);
			
			DelayCommand(0.1, CP_PartyJump(oTrask, lTraskSp));
			DelayCommand(0.25, AssignCommand(oTrask, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
			DelayCommand(0.6, AssignCommand(oTrask, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			SetGlobalFadeIn(0.9, 0.5);
			break;
	}
}