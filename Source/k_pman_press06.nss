//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnOpen for man28ac_force01.utd in manm28ac (Manaan Hrakert Kolto Control).
	
	Fires when the player manages to drop the forcefield and end the decompression
	sequence after being trapped by the two surviving scientists. Jumps the player
	to ensures that they will be in front of the scientists during the subsequent
	conversation if they happened to disable the forcefield via the computer terminal.
	Otherwise they will stay standing in the corner for the duration, which can lead
	to some camera wonkiness once the conversation ends.
	
	Issue #522: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/522
	
	DP 2023-10-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
 
 void main() {
 	
	object oDoor;
	int nCnt;
	location lPC = Location(Vector(217.10,102.71,5.00), -90.00);
	location lPM1 = Location(Vector(218.10,104.36,5.00), -90.00);
	location lPM2 = Location(Vector(216.10,104.36,5.00), -90.00);
 	
	SetGlobalFadeOut();
	
	NoClicksFor(1.0);
	
	oDoor = GetObjectByTag("man28ac_door01", nCnt);
	
	while (GetIsObjectValid(oDoor))
		{
			SetLocked(oDoor, FALSE);
			
			nCnt++;
			
			oDoor = GetObjectByTag("man28ac_door01", nCnt);
		}
 	
	SetGlobalBoolean("MAN_PRESS_ON", FALSE);
 	
	if (GetGlobalNumber("MAN_LIVEB_STATE") != 2)
		{
			SetGlobalNumber("MAN_LIVEB_STATE", 3);
		}
 	
	SoundObjectStop(GetObjectByTag("forcefield", 0));
 	SoundObjectStop(GetObjectByTag("fincom", 0));
 	SoundObjectStop(GetObjectByTag("man28_decom03", 0));
 	SoundObjectPlay(GetObjectByTag("man28_decom02", 0));
 	
	// Make provision for potential 3rd party reimplementation of party members in underwater suits.
	CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	
	DelayCommand(1.0, SetGlobalFadeIn(0.0, 1.0));
	
	DelayCommand(1.0, AssignCommand(GetObjectByTag("man28_sur3", 0), ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
 }
