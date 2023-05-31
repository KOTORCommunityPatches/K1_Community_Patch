//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	This fires after the player has won the swoop race and spoken to the mechanic.
	It cleans up the scene and continues to the next conversation with Brejik.
	
	This script has been edited to ensure that the player initiates the subsequent
	conversaton. When another object initiates a conversation, that object's name
	is used in place of the player's name in message logs.
	
	JC 2023-05-30																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	SetGlobalBoolean("Tar_SwoopRace", TRUE);
	CreateObject(OBJECT_TYPE_CREATURE, "tar03_brejik031", GetLocation(GetObjectByTag("tar03_wpbrejik")));
	AssignCommand(GetObjectByTag("Bastilla03"), ClearAllEffects());
	CreateObject(OBJECT_TYPE_CREATURE, "tar_bast_guard_p", GetLocation(GetObjectByTag("tar_bast_guard_p_wp")));
	AssignCommand(GetObjectByTag("tar03_bastguard"), ActionJumpToObject(GetObjectByTag("tar03_guard1")));
	CreateObject(OBJECT_TYPE_CREATURE, "tar03_vulkguard", GetLocation(GetObjectByTag("tar03_guard2")));
	SetGlobalFadeOut(0.0, 1.0);
	DelayCommand(0.2, AssignCommand(GetFirstPC(), ActionStartConversation(GetObjectByTag("converse"))));
}