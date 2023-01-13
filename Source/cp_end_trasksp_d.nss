//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefine for cp_end_trasksp.utp in end_m01aa (Endar Spire Command Module).
	
	This is the OUD for a new invisible placeable added as a cutscene helper.
	It holds the commands to issue to the new Party Trask after he has joined
	the party and the NPC Trask has been destroyed. Because the Party Trask
	would spawn in behind the player, it was desirable to jump him back to
	the position that NPC Trask was standing in for the sake of consistency.
	Trying to do so with the original scripts failed, presumably due to their
	owner, NPC Trask, having been destroyed before the commands could fire.
	
	See also cp_end01_pcjump, k_pend_traskdl29, k_pend_reset.
	
	Updated 2023-01-13 to add an additional event for use in the added cutscene
	of the door closing on the Bridge.
	
	See also cp_end_bridgecs, k_pend_door20, k_pend_room7_01.
	
	Issue #86: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/86
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2019-05-20 / DP 2023-01-13												*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_end"
#include "cp_inc_k1"

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 50)
		{
			object oTrask = GetPartyMemberByIndex(1);
			object oPC = GetFirstPC();
			location lTraskSp = Location(Vector(16.34,20.5,-1.27), 180.0);
			
			DelayCommand(0.1, CP_PartyJump(oTrask, lTraskSp));
			DelayCommand(0.25, AssignCommand(oTrask, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
			DelayCommand(0.6, AssignCommand(oTrask, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			SetGlobalFadeIn(0.9, 0.5);
		}
	else if (nUser == 100)
		{
			object oPC = GetFirstPC();
			object oTrask = GetTrask();
			object oSith1 = GetNearestObjectByTag("SithSoldier", oPC, 1);
			object oSith2 = GetNearestObjectByTag("SithSoldier", oPC, 2);
			location lPC = Location(Vector(31.21,143.14,0.00), 113.70);
			location lTrask = Location(Vector(29.98,144.59,0.00), -27.08);
			
			NoClicksFor(2.5);
			
			SetGlobalFadeOut();
			
			SetTraskState(TRASK_LEVEL_DONE);
			
			CancelCombat(oTrask);
			CancelCombat(oPC);
			
			// The corpses of the two Sith mooks you fight as the melee tutorial are probably right in the doorway, so get rid of them.
			DelayCommand(0.75, DestroyObject(oSith1, 0.0, TRUE));
			DelayCommand(0.75, DestroyObject(oSith2, 0.0, TRUE));
			
			// Jump the player and Trask well inside the room so the door can be shut and locked.
			DelayCommand(1.0, CP_PartyJump(oPC, lPC));
			DelayCommand(1.0, CP_PartyJump(oTrask, lTrask));
			
			if (GetXP(oPC) < 1000)
				{
					SetXP(oPC, 1000);
				}
			
			DelayCommand(1.7, SetGlobalFadeIn(0.0, 0.5));
			
			DelayCommand(1.5, ActionStartConversation(oPC, "cp_end_traskbrdg", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
}
