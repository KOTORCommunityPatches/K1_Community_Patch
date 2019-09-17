////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This script is an alternative to the vanilla k_pdan_clean01 which is fired
	at the end of each branch of the final Sandral-Matale Feud DLG. By default,
	the original script deletes both the back door key and Casus' diary from
	the player's inventory. The vanilla script has been replaced with a version
	that only deletes the key, so for the DS "kill everyone" branch of this DLG
	we need a version with some additions. This is part of the revisions made to
	the Casus quest in order to prevent it from becoming orphaned if you don't
	tell Nurik about the corpse/diary when you enter his estate. For this branch
	of the DLG, if the player has the Casus quest active then it will now be
	closed with a new DS-specific journal entry.
	
	Issue #27: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/27
	
	DP 2019-02-04                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetPCSpeaker();
	object oDiary = GetItemPossessedBy(oPC, "dan14_diary");
	int iCasQuest = 40; // ADDED DS ROUTE QUEST ENTRY ID
	
	if (GetIsObjectValid(oDiary))
		{
			DestroyObject(GetItemPossessedBy(oPC, "dan14_diary"), 0.0, 0, 0.0);
			AddJournalQuestEntry("dan_casus", iCasQuest, FALSE);
			SetGlobalBoolean("DAN_DIARY_DONE", 1);
		}
	DestroyObject(GetItemPossessedBy(oPC, "dan16_key"), 0.0, 0, 0.0);
}
