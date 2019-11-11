//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for manm26ae (Manaan East Central).
	
	This is a hijacked OnEnter for East Central, since DeNCS can't decompile the
	vanilla script. It simply checks for the presence of the Sith prisoner in the
	Republic embassy. If he is no longer there, then the force cage he was in is
	deactivated. 
	
	See also cp_man_area_26e (bytecode only).
	
	Updated 2019-10-01 to change the validity check of the prisoner to checking the
	global for the Sith Base being sealed. The former method would seemingly fail
	at the first attempt, since it would check before the original OnEnter managed
	to destroy it. Based on the bytecode of the vanilla script, checking the global
	is what it does to destroy the prisoner in the first place.
	
	Issue #137: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/137
	
	DP 2019-05-17
	
//////////////////////////////////////////////////////////////////////////////////
	
	Added a new check to destroy Lorgal's fake corpse on subsequent visits to the
	area, since it clips through the force cage base, and it is unrealistic that the
	Republic would leave a corpse just laying around in the middle of their embassy
	for (presumably) hours/days/weeks.
	
	Issue #333: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/333
	
	DP 2019-11-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	object oFCage = GetObjectByTag("cp_m26ae_fccage", 0);
	object oCorpse = GetObjectByTag("deadrodian", 0);
	
	// Execute original OnEnter
	ExecuteScript("cp_man_area_26e", OBJECT_SELF, -1);
	
	if (GetGlobalBoolean("MAN_SITHBASE_SEALED"))
		{
			AssignCommand(oFCage, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
		}
	
	if (!GetLoadFromSaveGame() && GetIsObjectValid(oCorpse))
		{
			DestroyObject(oCorpse, 0.0, TRUE);
		}
}
