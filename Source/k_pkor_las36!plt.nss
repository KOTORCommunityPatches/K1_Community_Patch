////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).

	This script sets Lashowe to a non-plot object after the battle with the
	Tukata mother. In rare instances, her saber could remain ignited throughout
	the following conversation, which looked especially bad given she uses the
	flirt animation (and thus waved an ignited saber in her own face). In order
	to prevent this, her saber is forcibly overridden and set to powered down.
	
	See also k36_las_hostile.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetPlotFlag(OBJECT_SELF, FALSE);
	
	// Override saber and set it to powered down
	SetLightsaberPowered(OBJECT_SELF, TRUE, FALSE, FALSE);
}
