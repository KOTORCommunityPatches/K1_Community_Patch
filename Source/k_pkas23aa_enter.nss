//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for kas_m23aa (Kashyyyk Village of Rwookrrorro).
	
	This is the module OnEnter for the Wookiee village. It has been altered to
	prevent the party using Rapid Transit back to the Ebon Hawk after siding with
	Freyyr. Doing so results in the ending cutscenes triggering in the wrong order.
	
	Updated 2023-12-20 to add a hold world fade when exiting the Chieftain's Hall
	for the first time. Also stripped out the vanilla Kashyyyk include functions
	to remove unnecessary bloat.
	
	See also cp_kas23_zaaladd, k_pkas_audcut1.
	
	Issue #119: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/119
	
	Issue #515: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/515
	
	DP 2021-11-15 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oInvis = GetObjectByTag("kas23_audspeak", 0);
	object oGuard = GetObjectByTag("kas23_wookgua_01", 0);
	int SW_PLOT_BOOLEAN_07 = 6;
	
	if (!GetLoadFromSaveGame() && !GetLocalBoolean(oInvis, SW_PLOT_BOOLEAN_07) && GetIsPC(GetEnteringObject()) && GetGlobalBoolean("kas_SpawnGorwook"))
		{
			HoldWorldFadeInForDialog();
			
			SetLocalBoolean(oInvis, SW_PLOT_BOOLEAN_07, TRUE);
		}
	
	if (GetGlobalBoolean("kas_ChuundarDead"))
		{
			// Prevent the party from using Rapid Transit so the Landing Pad cutscenes aren't screwed up.
			SetAreaUnescapable(TRUE);
			
			if (GetIsObjectValid(oGuard))
				{
					DestroyObject(oGuard);
				}
		}
}
