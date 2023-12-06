////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_go_hawk.dlg in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
	This script warps the party to the Ebon Hawk. It's part of the replacement
	for the vanilla transition zone to the Ebon Hawk in each of the modules
	where the party fights Xor. In order to get the fade-out that occurs just
	before the transition to hold up until the loading screen, it was necessary
	to make use of a DLG to fire the actual transition command itself. Doing so
	directly in the trigger OnEnter resulted in the fade briefly breaking before
	the load screen.
	
	See also cp_go_hawk.
	
	Issue #704: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/704
	
	DP 2023-11-21																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetGlobalFadeOut();
	StartNewModule("ebo_m12aa", "K_EBN_RAMP_ENTRANCE");
}
