//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for manm26ae (Manaan East Central).
	
	This is a hijacked OnEnter for East Central, since DeNCS can't decompile
	the vanilla script. It simply checks for the presence of the Sith prisoner
	in the Republic embassy. If he is no longer there, then the force cage
	he was in is deactivated. 
	
	See also cp_man_area_26e (bytecode only).
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2019-05-17
	
//////////////////////////////////////////////////////////////////////////////////
	
	Updated to change the check to deactivate the cage from the prisoner still
	being valid to checking the global for the Sith Base being sealed. The former
	method would seemingly fail at the first attempt, since it would check before
	the original OnEnter managed to destroy it. Based on the bytecode, checking
	the global is what the original does to destroy the prisoner in the first place.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2019-10-01																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	object oFCage = GetObjectByTag("cp_m26ae_fccage", 0);
	
	// Execute original OnEnter
	ExecuteScript("cp_man_area_26e", OBJECT_SELF, -1);
	
	if (GetGlobalBoolean("MAN_SITHBASE_SEALED"))
		{
			AssignCommand(oFCage,ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
		}
}
