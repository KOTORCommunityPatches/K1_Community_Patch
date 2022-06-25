//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter for unk_m41ac (Lehon North Beach).
	
	The is the OnEnter for the exterior of The One's compound. Edited to add a
	check for the state of the "Invisible Mandalorians" quest and remove it if
	it is active and unresolved, since there is no fail state after the Black
	Rakatans turn hostile.
	
	Issue #647: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/647
	
	DP 2022-06-25																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_unk"

void main() {
	
	if (GetIsPC(GetEnteringObject()) == TRUE)
		{
			if (GetGlobalNumber("G_FinalChoice") > 0)
				{
					SetAreaUnescapable(TRUE);
				}
			
			if (GetGlobalBoolean("UNK_BLACKHOSTILE"))
				{
					int nMandState = GetJournalEntry("unk_invis");
					
					// Check the state of the "Invisible Mandalorians" quest and remove it if incomplete to prevent an orphaned journal entry.
					if (nMandState > 0 && nMandState != 30)
						{
							RemoveJournalQuestEntry("unk_invis");
						}
				}
			
			if (GetGlobalBoolean("UNK_SPAWN"))
				{
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_rancor02", GetLocation(GetObjectByTag("wp_01_11", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_rancor02", GetLocation(GetObjectByTag("wp_01_10", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_blkwand001", GetLocation(GetObjectByTag("wp_01_07", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_blkwandere", GetLocation(GetObjectByTag("wp_01_09", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_blkwand001", GetLocation(GetObjectByTag("wp_01_04", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_blkwandere", GetLocation(GetObjectByTag("wp_01_01", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_blkwand001", GetLocation(GetObjectByTag("wp_01_12", 0)));
					CreateObject(OBJECT_TYPE_CREATURE, "unk41_rakplot", GetLocation(GetObjectByTag("rakplot", 0)));
					
					SetGlobalBoolean("UNK_SPAWN", FALSE);
				}
			
			if (GetGlobalBoolean("UNK_TEMP6") || GetGlobalBoolean("UNK_BLACKHOSTILE"))
				{
					UNK_SetBlackRakataHostile();
				}
			
			if (!GetGlobalBoolean("UNK_TEMP6") && GetGlobalBoolean("UNK_BLACKHOSTILE") || GetGlobalBoolean("UNK_RED_TALK") && !GetGlobalBoolean("UNK_REDHOSTILE"))
				{
					DestroyObject(GetObjectByTag("unk41_rancor01", 0), 0.0, TRUE);
					DestroyObject(GetObjectByTag("unk41_blkwand001", 0), 0.0, TRUE);
					DestroyObject(GetObjectByTag("unk41_blkwandere", 0), 0.0, TRUE);
					DestroyObject(GetObjectByTag("plottalk", 0), 0.0, TRUE);
					DestroyObject(GetObjectByTag("entering", 0), 0.0, TRUE);
					DelayCommand(0.3, DestroyObject(GetObjectByTag("unk41_rancor01", 0), 0.0, TRUE));
					DelayCommand(0.3, DestroyObject(GetObjectByTag("unk41_blkwand001", 0), 0.0, TRUE));
					DelayCommand(0.3, DestroyObject(GetObjectByTag("unk41_blkwandere", 0), 0.0, TRUE));
					DelayCommand(0.6, DestroyObject(GetObjectByTag("unk41_blkwand001", 0), 0.0, TRUE));
				}
		}
}
