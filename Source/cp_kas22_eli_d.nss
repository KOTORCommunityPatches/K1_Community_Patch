//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnDeath for kas22_eli_01.utc in kas_m22aa (Kashyyyk Landing Pad).
	
	This is a modified OnDeath script for Eli that sends signals to Matton's OUD
	in order to deal with the added cutscene of him being killed and transitioning
	directly to Matton's conversation.
	
	See also cp_kas22_matt_d.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	
	// Matton killed Eli
	if (GetGlobalBoolean("kas_elikilled"))
		{
			SignalEvent(oMatton, EventUserDefined(100));
		}
	
	// KOTOR_DEFAULT_EVENT_ON_DEATH
	ExecuteScript("k_ai_master", OBJECT_SELF, 1007);
}
