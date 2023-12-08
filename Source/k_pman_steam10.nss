//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpened for man27aa_door20.utd in manm27aa (Manaan Sith Base).
	
	This is the OnOpened script for the door leading to the North Computer Room.
	It triggers a quick scene of steam vents inside the corridor. The vanilla
	script had an invisible placeable handle the conversation, but this caused
	the PC to face off to the side. Now the door itself is the conversation
	owner.
	
	Updated 2023-12-08 to jump the party, since the former change of DLG owner
	wasn't sufficient.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-15 / DP 2023-12-08												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(168.65,108.71,0.00), 0.00);
	location lPM1 = Location(Vector(165.48,109.71,0.00), 0.00);
	location lPM2 = Location(Vector(165.48,107.71,0.00), 0.00);
	location lEndPM1 = Location(Vector(166.73,109.71,0.00), 0.00);
	location lEndPM2 = Location(Vector(166.73,107.71,0.00), 0.00);
	
	if (CP_HasNeverTriggered())
		{
			SetGlobalFadeOut();
			SetGlobalFadeIn(0.7, 0.5);
			
			NoClicksFor(2.5);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			DelayCommand(0.5, AssignCommand(oPM1, ActionMoveToLocation(lEndPM1, FALSE)));
			DelayCommand(0.5, AssignCommand(oPM2, ActionMoveToLocation(lEndPM2, FALSE)));
			
			DelayCommand(0.5, AssignCommand(OBJECT_SELF, ActionStartConversation(oPC, "man27_cut01", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
