//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_freyyr_01.dlg in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This is the exit node script that fires after completing the Chieftain in Need
	quest and siding with Freyyr. It destroys the stunt Zaalbar and pops up the
	party selection GUI to allow you to add him to the party. The issue is that
	the stunt Zaalbar is still visible after the GUI closes. If Zaalbar is added
	to the party then there will briefly be two of them. Part of this is presumably
	due to the structure of the original script which fired the GUI before calling
	the destroy function. To alleviate the issue, a fade-out is done, the order of
	operations is switched, and stunt Zaalbar is jumped into a side bay to keep him
	out of sight while he is being knocked on the head.
	
	See also cp_kas23_zaaladd, k_pkas_chuunrew.
	
	Issue #460: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/460
	
	DP 2021-01-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oStuntZaal = GetObjectByTag("Zaalbar", 0);
	location lWoodshed = Location(Vector(33.40,8.82,3.75), 51.33);
	
	SetGlobalFadeOut();
	
	SetGlobalBoolean("tat_ZaalbarTaken", FALSE);
	SetNPCSelectability(NPC_ZAALBAR, TRUE);
	
	CP_PartyJump(oStuntZaal, lWoodshed);
	DestroyObject(oStuntZaal, 0.1, TRUE);
	
	CreateItemOnObject("G_w_Vbroswrd05", GetFirstPC(), 1);
	
	DelayCommand(0.5, ShowPartySelectionGUI("cp_kas23_zaaladd"));
}
