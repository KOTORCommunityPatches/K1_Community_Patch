//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnFailToOpen for end_door15.utd in end_m01aa (Endar Spire Command Module).
	
	This is the OnFailToOpen script for the door at the back of the bridge that
	requires the player to level up before unlocking. The original had a long
	delay before firing the conversation, so that has now been removed. It has
	also been streamlined to clean out some unnecessary include guff.
	
	See also k_pend_door15.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2021-12-04																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oTrask = GetObjectByTag("end_trask");
	int nLevel = GetHitDice(oPC);
	
	if (GetGlobalNumber("END_ROOM7_DEAD") >= 2 && !GetIsInCombat(oPC) && !GetIsInCombat(oTrask))
		{
			if (nLevel > 1)
				{
					SetLocked(OBJECT_SELF, FALSE);
					ActionOpenDoor(OBJECT_SELF);
					//SetTraskState(TRASK_LEVEL_DONE);
					SetGlobalNumber("END_TRASK_DLG", 31); // TRASK_LEVEL_DONE = 31
				}
				else
					{
						SetGlobalFadeOut();
						
						AssignCommand(oTrask, ClearAllActions());
						AssignCommand(oTrask, ActionStartConversation(oPC, "end_levelup", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
					}
		}
}
