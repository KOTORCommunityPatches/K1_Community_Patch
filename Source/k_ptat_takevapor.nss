//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09chief_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This fires when you tell the Chieftain that you have his vaporators, causing
	him to walk to the player to take them. It now also sets the PC to face the
	Chieftain, since by default he would normally be facing HK due to the prior
	node.
	
	Updated 2022-06-22 to additionally destroy the vaporators after the Chieftain
	has taken them from the player, in order to prevent them being dropped by
	him if he later turns hostile.
	
	See also k_ptat_chiefjump.
	
	Issue #293: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/293
	
	Issue #630: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/630
	
	DP 2019-10-06 / DP 2022-06-22												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oChief = GetObjectByTag("tat20_09chief_01", 0);
	object oVaporators = GetItemPossessedBy(oPC, "tat17_vaporator");
	
	NoClicksFor(4.0);
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oChief)));
	
	ActionTakeItem(oVaporators, oPC);
	
	DelayCommand(3.5, DestroyObject(GetItemPossessedBy(oChief, "tat17_vaporator"), 0.0, TRUE));
}
