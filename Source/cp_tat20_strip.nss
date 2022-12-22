//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09first_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	When the party enters the Sand People Enclave for the first time and chooses
	a hostile response (with or without HK), this script strips any equipped Sand
	People disguises and equips a set of clothing (spawning new ones if the player
	has none). This was done so that the re-equipping could be done separately from
	turning the Sand People hostile, since the original script caused the party to
	start attacking them while the DLG was still active.
	
	Updated 2022-12-22 to extend the NoClicksFor, since it was possible to click
	through the responses and reveal the party disguise stripping instead of it
	happening off-screen. Additionally, it seems that the original version of the
	disguise stripping function could result in a crash when manually switching
	the party's armour slots, so that has been amended to (hopefully) prevent that.
	
	See also cp_tat20_fac_d, cp_tat20_ptyclr, k_ptat_tuskenmad.
	
	Issue #296: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/296
	
	DP 2021-12-18 / DP 2022-12-22												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "cp_inc_tat"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oInvItem;
	
	NoClicksFor(4.2);
	
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
	
	DelayCommand(4.16, ActionResumeConversation());
}
