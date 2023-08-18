//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul403.dlg in lev_m40aa (Leviathan Prison Block).
	
	Reorients the player from their initial spawn-in facing under the cover of
	Saul taunting of Carth during the intro of the torture scene in the Leviathan
	Prison Block.
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-08-18																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oSaul = GetObjectByTag("SaulKarath401", 0);
	
	AssignCommand(oPC, SetFacing(DIRECTION_EAST));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
}
