////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor35_adrenas.dlg in korr_m35aa (Korriban Sith Academy)
	
	This is one of two scripts that split the original functionality of
	k35_adr_givepad which took Uthar's datapad about poisoning Yuthura
	and sent Adrenas to the Academy exit. This script is fired on the
	exit node, same as the vanilla script, and handles moving him to
	the Academy exit. He also been set to walk rather than run as in
	the original script. A secondary check for the datapad remaining
	in the PC's inventory has been added, since this was a problem in
	the vanilla game.
	
	See also cp_k35_adr_datpd.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-08-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oExitWP = GetObjectByTag("k35_way_entrance", 0);
	object oDatapad = GetItemPossessedBy(oPC, "k35_itm_sithdata");
	
	// Backup check to make sure the PC no longer has the datapad
	if (GetIsObjectValid(oDatapad))
		{
			DestroyObject(oDatapad);
		}
	
	ActionMoveToObject(oExitWP, FALSE);
	ActionDoCommand(DestroyObject(OBJECT_SELF));
	SetCommandable(FALSE, OBJECT_SELF);
}
