////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_lashowe.dlg in korr_m33aa (Korriban Dreshdae)
	
	This script fires on various nodes to return Lashow to facing the PC. It has
	been edited to also make the PC face her, as well as her mooks.
	
	See also k_pkor_lashturn1, cp_kor33_fcelash, k_pkor_lashleave, and k33_las_initconv.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-08-09                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oLash = GetObjectByTag("kor33_lashowe", 0);
	object oMook1 = GetObjectByTag("kor33_lasfriend1", 0);
	object oMook2 = GetObjectByTag("kor33_lasfriend2", 0);
	
	SetFacingPoint(GetPosition(oPC));
	
	AssignCommand(oPC, SetFacingPoint(GetPosition(oLash)));
	
	AssignCommand(oMook1, SetFacingPoint(GetPosition(oLash)));
	AssignCommand(oMook2, SetFacingPoint(GetPosition(oLash)));
}
