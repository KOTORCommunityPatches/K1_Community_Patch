//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for tar03_matdoor.utd in tar_m03ad (Taris Lower City Apartments East).
	
	This is the OnOpen script for the locked door to Matrik's room. The original
	version jumped the party before starting the conversation, but since that
	is now handled by a new added script, it simply does a fade-out and triggers
	the conversation.
	
	See also cp_tar03ad_ptyjp.
	
	Issue #300: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/300
	
	DP 2021/12/08																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oMatrik = GetObjectByTag("Matrik031", 0);
	
	SetGlobalFadeOut();
	
	NoClicksFor(0.25);
	
	SetPartyLeader(NPC_PLAYER);
	
	DelayCommand(0.25, AssignCommand(oMatrik, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
}
