//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar09_darkjedi91.dlg in tar_m09ab (Taris Sith Base Governor's Quarters).
	
	A replacement for the generic k_act_atkonend that fires at the end of the
	confrontation scene with the Governor in the second level of the Sith Base
	on Taris. It was apparently possible for click spammers to bypass the original
	script and get the DLG to trigger again, so it has been replaced with a custom
	version that adds in a NoClicksFor. Also coupled with an added a Talked To check
	in the DLG to prevent reinitialisation.
	
	Issue #790: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/790
	
	DP 2024-04-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	NoClicksFor(0.5);
	
	DelayCommand(0.2, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1));
	DelayCommand(0.3, ExecuteScript("k_ai_master", OBJECT_SELF, 3001));
}
