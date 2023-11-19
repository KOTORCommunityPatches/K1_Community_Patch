////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarb.dlg in manm26aa (Manaan Ahto West).
	
	This is the OnConversationEnd/OnConversationAbort script for the post-Sith
	Base trial of the player. Once the trial is over it jumps the Sith and Republic
	lawyers back in front of the judges, does a safety restoration of any stored
	party members, destroys the two guard droids, and then destroys the DLG owner.
	The original script jumped the two lawyers into the wrong positions (they were
	switched), so if the player hadn't previously triggered their cutscene then all
	their lines would be spoken off-screen.
	
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-19																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
 	
	object oRep = GetObjectByTag("man26_repac", 0);
	object oSith = GetObjectByTag("man26_sithac", 0);
 	location lRep = GetLocation(GetObjectByTag("wp_man26_replaw", 0));
	location lSith = GetLocation(GetObjectByTag("wp_man26_sithlaw", 0));
	
	UT_RestoreParty();
 	
	CP_PartyJump(oRep, lRep);
	CP_PartyJump(oSith, lSith);
	
	DelayCommand(0.1, AssignCommand(CP_GetPartyMember(1), CP_DisableAI(FALSE)));
	DelayCommand(0.1, AssignCommand(CP_GetPartyMember(2), CP_DisableAI(FALSE)));
 	
	DestroyObject(GetObjectByTag("man_traildrd01", 0), 0.0, TRUE);
 	DestroyObject(GetObjectByTag("man_traildrd02", 0), 0.0, TRUE);
 	DelayCommand(0.1, DestroyObject(OBJECT_SELF));
}
