////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for manm26ae (Manaan East Central).
	
	This is a hijacked OnEnter for East Central, since DeNCS can't decompile
	the vanilla script. It simply checks for the presence of the Sith prisoner
	in the Republic embassy. If he is no longer there, then the force cage
	he was in is deactivated. See also cp_man_area_26e (bytecode only).
	
	DP 2019-05-17                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oFCage = GetObjectByTag("cp_m26ae_fccage", 0);
	object oSith = GetObjectByTag("man26_sithpris", 0);
	
	// Execute original OnEnter
	ExecuteScript("cp_man_area_26e", OBJECT_SELF, -1);
	
	if(!GetIsObjectValid(oSith))
		{
			AssignCommand(oFCage,ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
		}
}