////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Dustil's OnDeath script. Ensures Carth will realize Dustil is dead.
	
	JC 2019-01-26
	
////////////////////////////////////////////////////////////////////////////////

	Updated to add journal entry checks/updates for the "Finding Dustil" quest
	to account for killing Dustil at various different stages.
	
	Issue #4: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/4
	
	DP 2019-07-13                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_switch"

void main() {
	
	// Set Dustil's status to dead
	SetGlobalNumber("KOR_DANEL", 5);
	
	// Set Carth's conversations to "nothing more to talk about"
	SetGlobalNumber("K_SWG_CARTH", 99);
	
	// Jordo has told Carth that Dustil is on Korriban
	if ((GetJournalEntry("kor35_findingdustil") == 10))
		{
			AddJournalQuestEntry("kor35_findingdustil", 50, FALSE);
		}
	
	// Dustil has been found and talked to in the Academy, and Carth
	// is searching for proof to convince him of the Sith's true nature
	if ((GetJournalEntry("kor35_findingdustil") == 20))
		{
			AddJournalQuestEntry("kor35_findingdustil", 60, FALSE);
		}
	
	// The datapad in Uthar's quarters talking about killing Dustil's
	// girlfriend has been found, but hasn't been given to Dustil yet
	if ((GetJournalEntry("kor35_findingdustil") == 25))
		{
			AddJournalQuestEntry("kor35_findingdustil", 70, FALSE);
		}
		
	//Carry out vanilla k_def_death01 function
	ExecuteScript("k_ai_master", OBJECT_SELF, KOTOR_DEFAULT_EVENT_ON_DEATH);
}
