////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kas25_freyyr_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).

	This script is an alteration of the vanilla script that fires if you
	agree to give Freyyr the blade of Bacca's sword in the Kashyyyk Lower
	Shadowlands. The vanilla version reportedly failed to properly remove
	the blade from the player's inventory when handing it over, so the
	manner of removing it has been changed.
	
	Issue #43: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/43
	
	DP 2019-03-16                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBlade = GetItemPossessedBy(oPC, "kas25_swordblade");
	
	ActionPauseConversation();
	ActionDoCommand(DestroyObject(oBlade, 0.0, FALSE, 0.0));
	ActionResumeConversation();
}
