//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpened for man27aa_door20.utd in manm27aa (Manaan Sith Base).
	
	This is the OnOpened script for the door leading to the North Computer Room.
	It triggers a quick scene of steam vents inside the corridor. The vanilla
	script had an invisible placeable handle the conversation, but this caused
	the PC to face off to the side. Now the door itself is the conversation
	owner.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-15																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
 
 void main() {
	
	if (CP_HasNeverTriggered())
		{
			AssignCommand(OBJECT_SELF, ActionStartConversation(OBJECT_SELF, "man27_cut01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
 }
