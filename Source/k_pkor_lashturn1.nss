////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_lashowe.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script fires on various nodes to have Lashow face one of her mooks.
	The vanilla script used the wrong tag.
	
	See also k_pkor_lashturn2, cp_kor33_fcelash, k_pkor_lashleave, and k33_las_initconv.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-08-09                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMook1 = GetObjectByTag("kor33_lasfriend1", 0);
	
	SetFacingPoint(GetPosition(oMook1));
}
