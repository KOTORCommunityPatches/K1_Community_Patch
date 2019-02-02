////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Added script for Bastila's dialogue on the Hawk to enable showing
	the fourth vision if you have been to all four planets before triggering
	the Leviathan capture sequence. Created by the KOTOR 1 Restoration mod.
	Permission to include in K1CP granted by Fair Strides.
	
	DP 2019-02-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	SetGlobalNumber("Ebon_Vision", 3);
}