////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This is a simple script to adjust Carth's facing when he turns around
	after Saul dies. 
	
	See also k_plev_journal, k_plev_killsaul, k_plev_playpron2.
	
	Issue #131: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/131
	
	DP 2019-09-29                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oCarth = GetObjectByTag("carth", 0);
	
	AssignCommand(oCarth, SetFacing(DIRECTION_WEST));
}
