////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_adrenas.dlg in korr_m35aa (Korriban Sith Academy)
	
	This is one of two scripts that split the original functionality of
	k35_adr_givepad which took Uthar's datapad about poisoning Yuthura
	and sent Adrenas to the Academy exit. This script, fired on an earlier
	node, handles taking the datapad from the player. Since the node this
	script fires on is already gated behind a conditional that checks the
	player has the datapad (k35_adr_haspad), the additional check that was
	in k35_adr_givepad has been dispensed with.
	
	See also cp_k35_adr_exit.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oDatapad = GetItemPossessedBy(oPC, "k35_itm_sithdata");
	
	SetGlobalBoolean("KOR_YUTH_POISON", TRUE);
	ActionTakeItem(oDatapad, oPC);
}
