////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script fires on Carth's "He's gone" line after Saul dies. The vanilla
	version handled killing Saul, but that has now been moved to the script that
	fires on the previous line in order to prevent Carth talking over Saul's
	death cry. See also k_plev_journal.
	
	DP 2019-07-08                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oCarth = GetObjectByTag("Carth", 0);
	
	AssignCommand(oCarth, ClearAllActions());
}
