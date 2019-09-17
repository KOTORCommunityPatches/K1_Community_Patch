////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Created by the KOTOR 1 Restoration mod. Permission to include in K1CP granted
	by Fair Strides.
	
	Added conditional for Bastila's dialogue on the Hawk to enable showing
	the fourth vision if you have been to all four planets before triggering
	the Leviathan capture sequence.
	
	2019-02-02                                                                */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	int int1 = (GetGlobalNumber("Ebon_Vision") == 3);
	return int1;
}
