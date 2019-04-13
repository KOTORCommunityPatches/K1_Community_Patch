////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Hijacked OnEnter script for manm26ac (West Central).
	
	The vanilla OnEnter is not able to be decompiled by DeNCS, so the required
	fixes for the Xor quest are handled before firing the renamed original.
	
	JC 2019-03-18                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

// Execute original OnEnter script
	ExecuteScript("cp_m26ac_en", OBJECT_SELF, (-1));
// If the first Xor encounter is done, make him appear for the second one
	if ((GetGlobalBoolean("K_MESS_JUHANI") == 1)) {
		SetGlobalNumber("K_XOR_AMBUSH", 1);
	}
}