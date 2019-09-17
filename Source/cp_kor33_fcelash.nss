////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_lashowe.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script has been added to force Lashowe's mooks to face her on various
	nodes.
	
	See also k_pkor_lashturn1, k_pkor_lashturn2, k_pkor_lashleave, and k33_las_initconv.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-08-09                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oLash = GetObjectByTag("kor33_lashowe", 0);
	object oMook1 = GetObjectByTag("kor33_lasfriend1", 0);
	object oMook2 = GetObjectByTag("kor33_lasfriend2", 0);
	
	AssignCommand(oMook1, SetFacingPoint(GetPosition(oLash)));
	AssignCommand(oMook2, SetFacingPoint(GetPosition(oLash)));
}
