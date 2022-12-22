//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09first_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This is the script that strips the party of their Sand People disguises before
	they go to see the Chieftain. While the vanilla version of this script cannot
	be decompiled, it appears to simply be a call to the DestroySandpeopleDisguise
	function in k_inc_tat. It seems the original intention of that function was to
	equip the party with clothes after the disguises were destroyed, but that was
	commented out and the function in-game leaves the party in their underwear. So
	the functions were changed up a little in order to skip over the droids and
	re-enabled. The original script also jumped the party, but that is unnecessary
	since they are jumped again on the first node of the Chieftain's DLG.
	
	Updated 2021-12-18 to streamline the code, with the disguise stipping functions
	having now been moved out to cp_inc_tat for use in other scripts.
	
	Updated 2022-12-22 to recompile with a streamlined include function, since the
	previous version was causing crashes in some instances.
	
	See also cp_tat20_enc1st, k_ptat_cheifguar, k_ptat_chiefjump, k_ptat_meetchief.
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2019-10-06 / DP 2021-12-18 / DP 2022-12-22								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "cp_inc_tat"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oInvItem;

	NoClicksFor(2.5);
	
	ActionPauseConversation();
	
	SetGlobalBoolean("tat_TuskenSuit", FALSE);
	
	CP_StripDisguise(oPC);
	CP_StripDisguise(oPM1);
	CP_StripDisguise(oPM2);
	
	oInvItem = GetFirstItemInInventory(oPC);
	
	while (GetIsObjectValid(oInvItem))
		{
			if (GetTag(oInvItem) == "tat17_sandperdis")
				{
					DestroyObject(oInvItem);
				}

			oInvItem = GetNextItemInInventory(oPC);
		}
	
	DelayCommand(1.0, ActionResumeConversation());
}
