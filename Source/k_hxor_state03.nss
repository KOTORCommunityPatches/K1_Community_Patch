////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by various Xor encounter DLGs.
	
	Original script edit from The Comprehensive KOTOR Bug Fix Collection by blennus.
	
	This script is an edit of the vanilla script to increment the Global value
	in the same manner k_hxor_state02 does to prevent issues with other messengers
	appearing.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	int int1 = (GetGlobalNumber("K_XOR_AMBUSH") == 2);
	
	if (int1)
		{
			DelayCommand(2.0, SetGlobalNumber("K_XOR_AMBUSH", 3));
		}
	
	return int1;
}
