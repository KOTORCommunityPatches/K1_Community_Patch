//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_chuunda_01.dlg in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This is the exit node script that fires after siding with Chuundar. It destroys
	the stunt Zaalbar and pops up the party selection GUI to allow you to add him to
	the party. In order to hide stunt Zaalbar being knocked on the head, a fade-out
	has been added. This also necessitated editing the script that fires on closing
	the GUI to set a fade-in.
	
	See also k_pkas_givesword, k_pkas_leavetown.
	
	Issue #460: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/460
	
	DP 2021-01-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_kas"

void main() {
	
	object oStuntZaal = GetObjectByTag("Zaalbar", 0);
	
	SetGlobalFadeOut();
	
	SetChuundarRewardGlobal(TRUE);
	
	SetGlobalBoolean("tat_ZaalbarTaken", FALSE);
	SetNPCSelectability(NPC_ZAALBAR, TRUE);
	
	DestroyObject(oStuntZaal, 0.1, TRUE);
	
	if (GetJournalEntry("kas23_rorworr") > 0 && GetJournalEntry("kas23_rorworr") < 60)
		{
			AddJournalQuestEntry("kas23_rorworr", 80);
		}
	
	
	DelayCommand(0.5,ShowPartySelectionGUI("k_pkas_leavetown"));
}
