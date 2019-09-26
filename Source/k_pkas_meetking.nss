////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_wookg1_01.dlg in kas_m22ab (Kashyyyk The Great Walkway).

	This script fires on the exit node of the Rwookrrorro gate guard's DLG,
	sending the party to the chieftain's hall. If Zaalbar is in the party,
	he is removed and the party selection screen is popped up to pick a
	replacement. This allows for an equipment duplication exploit, since
	any equipment Zaalbar had prior to entering The Great Walkway that is
	unequipped just before this scene will be present on him again when he
	is returned to the party post-Star Map. This is due to the last update
	of the party table being when transitioning between modules. Forcing
	an update in this script before he is removed should prevent the exploit.
	
	Issue #278: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/278

	DP 2019-09-23                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oZaalbar = GetObjectByTag("Zaalbar", 0);
	
	if ((GetIsObjectValid(oZaalbar) == TRUE))
		{
			SaveNPCState(NPC_ZAALBAR);
			SetGlobalBoolean("kas_ZaalbarParty", TRUE);
			RemovePartyMember(NPC_ZAALBAR);
			SetNPCSelectability(NPC_ZAALBAR, FALSE);
			DestroyObject(oZaalbar, 1.0, TRUE);
			DelayCommand(0.5, ShowPartySelectionGUI("k_pkas_sendking"));
		}
		else
			{
				SetNPCSelectability(NPC_ZAALBAR, FALSE);
				StartNewModule("kas_m23ad", "kas23_MeetKing");
			}
}
