//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithlieu.dlg in manm27aa (Manaan Sith Base).
	
	This script fires on the opening node of the scene with the Sith lieutenant in
	the foyer. It has been changed to face her towards the player, since the party
	are now correctly positioned outside whichever entrance they came in from, and
	adds a fade-in.
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, cp_man27_lieufce, k_pman_27_init01,
	k_pman_secur01, k_pman_secur04, k_pman_sith02.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	
	ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
	
	SetGlobalFadeIn(0.5, 1.0);
	
	SetLockOrientationInDialog(OBJECT_SELF, TRUE);
}
