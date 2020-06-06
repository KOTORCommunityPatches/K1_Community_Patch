//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnDeath for kas22_eli_01.utc in kas_m22aa (Kashyyyk Landing Pad).
	
	This is a modified OnDeath script for Eli to deal with the added cutscene of
	Matton killing him.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118
	
	DP 2020-06-05																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oMatton = GetObjectByTag("kas22_dasol_01", 0);
	
	// 0 = SW_PLOT_BOOLEAN_01
	if (GetLocalBoolean(oMatton, 58))
		{
			AssignCommand(oMatton, DelayCommand(2.0, ActionResumeConversation()));
		}
	
	// 1007 = KOTOR_DEFAULT_EVENT_ON_DEATH
	ExecuteScript("k_ai_master", OBJECT_SELF, 1007);
}
