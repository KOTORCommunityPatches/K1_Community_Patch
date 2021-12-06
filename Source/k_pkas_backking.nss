//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas22_chorraw_02.dlg in kas_m22ab (Kashyyyk The Great Walkway).
	
	This script fires on the exit node of Chorrawl's conversation when siding
	with Freyyr, taking the party to the Chieftain's Hall. The original lacked
	a fade-out, so the party was briefly dumped out of the conversation before
	the module transition kicked in.
	
	See also k_pkas_chortrig.
	
	Issue #536: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/536
	
	DP 2021-12-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeOut();
	
	NoClicksFor(1.0);
	
	AssignCommand(GetFirstPC(), DelayCommand(0.75, StartNewModule("kas_m23ad", "kas23_MeetKing")));
	
	DestroyObject(OBJECT_SELF);
}
