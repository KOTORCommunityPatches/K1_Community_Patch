//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_dasol_01.dlg in kas_m22aa (Kashyyyk Landing Pad).
	
	An added script that fires on the first node of Matton's conversation the first
	time the player speaks to him after Eli is dealt with. This initiates a fade-in
	when coming from the Eli running away scene, since that ends on a fade-out, or
	runs a clear on the player after the Eli being killed scene to prevent them from
	freezing at the end of the conversation, since the killing scene was only between
	Matton and Eli as Speaker/Listener.
	
	See also k_pkas_eligone, k_pkas_elileave.
	
	Issue #118: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/118

	DP 2020-06-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	// Eli was allowed to run away
	if (!GetGlobalBoolean("kas_elikilled"))
		{
			NoClicksFor(4.0);
			
			SetGlobalFadeIn(0.75, 3.0);
		}
	
	// Matton killed Eli
	if (GetGlobalBoolean("kas_elikilled"))
		{
			// Clear the player to prevent them freezing post-conversation.
			AssignCommand(GetFirstPC(), ClearAllActions());
		}
}
