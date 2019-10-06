//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_09chief_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This fires when you tell the Chieftain that you have his vaporators, causing
	him to walk to the player to take them. It now also sets the PC to face the
	Chieftain, since by default he would normally be facing HK due to the prior
	node.
	
	See also k_ptat_chiefjump.
	
	Issue #293: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/293
	
	DP 2019-10-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oChief = GetObjectByTag("tat20_09chief_01", 0);
	object oVaporators = GetItemPossessedBy(oPC, "tat17_vaporator");
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oChief)));
	ActionTakeItem(oVaporators, oPC);
}
