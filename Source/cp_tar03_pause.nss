//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_cutdlg.dlg in tar_m03aa (Taris Lower City).
	
	This script has been added to prevent the final lines by the Black Vulkar gang
	member directed at the player ("More strangers!" / "Sith aren't welcome here!")
	from being unintentionally skipped altogether, which can occur when clicking
	through the alien VO at the start of the scene.
	
	Issue #233: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/233
	
	DP 2019-11-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionPauseConversation();
	
	NoClicksFor(1.5);
	
	DelayCommand(1.5, ActionResumeConversation());
}
