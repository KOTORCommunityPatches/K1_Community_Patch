////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_trial.dlg in manm26aa (Manaan Ahto West).
	
	This is a replacement for the vanilla script (k_pman_clean05) that fires near
	the end of Sunry's trial. In the branches where he is found guilty and either
	executed or imprisoned, the DLG would end before the fade-out had finished. In
	order not to interfere with the conclusion of the good end where he is found
	innocent, this script has been added to achieve the same result but adding in
	a delay to ensure that the fade-out works correctly.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	NoClicksFor(5.0);
	
	SetGlobalFadeOut(0.0, 4.0);
	
	DestroyObject(GetItemPossessedBy(GetPCSpeaker(), "W_RTAPE"));
	
	ActionWait(5.0);
	ActionResumeConversation();
}
