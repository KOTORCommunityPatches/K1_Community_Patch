//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor35_torturer.dlg in korr_m35aa (Korriban Sith Academy).
	
	This script fires when the torturer in the Korriban Sith Academy runs off
	after the Mando prisoner dies or is put in a coma. Changed to set the corpse
	to destroyable, since it was set as not destroyable earlier so that it stays
	if the player chooses to kill the torturer. Also opens the cage door to reflect
	the fact that the torturer says that he is taking the body to dispose of it.
	
	See also k35_init_torture, k35_plc_startvic, k35_tor_move, k35_vic_collapse,
	k35_vic_drugged, k35_vic_narc, k_pkor_painreset, k_pkor_tort01.
	
	Issue #434: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/434
	
	DP 2023-08-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oVictim = GetObjectByTag("kor35_victim", 0);
	object oCage = GetNearestObjectByTag("cagelg", GetFirstPC(), 1);
	
	AssignCommand(oCage, PlayAnimation(ANIMATION_PLACEABLE_OPEN));
	
	AssignCommand(oVictim, SetIsDestroyable(TRUE));
	DestroyObject(oVictim);
}
