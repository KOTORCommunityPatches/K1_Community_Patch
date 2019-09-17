////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).

	This script is fired during the conversation with Lashowe if you agreed
	to help her kill a Tukata mother to get a holocron after her "ahhh, here
	she comes now" line. It has the Tukata run towards the party. In the vanilla
	script, all three Tukata are commanded to run to a single waypoint. This
	tended to cause pathfinding issues with them running into each other, even
	with delays between them. This version of the script changes to individual
	locations for each Tukata so they run in straight lines.
	
	See also k_pkor_lashtukat and k36_las_tukatasp.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oTukQueen = GetObjectByTag("kor36_tukataquee", 0);
	object oTukMook1 = GetObjectByTag("kor36_tukatahen1", 0);
	object oTukMook2 = GetObjectByTag("kor36_tukatahen2", 0);
	location lQueen = Location(Vector(94.0,248.0,0.8), 180.0);
	location lMook1 = Location(Vector(96.0,250.0,0.9), 180.0);
	location lMook2 = Location(Vector(96.0,246.4,0.82), 180.0);
	
	ActionPauseConversation();
	
	DelayCommand(0.5, AssignCommand(oTukQueen, ActionMoveToLocation(lQueen, TRUE)));
	DelayCommand(1.0, AssignCommand(oTukMook1, ActionMoveToLocation(lMook1, TRUE)));
	DelayCommand(1.0, AssignCommand(oTukMook2, ActionMoveToLocation(lMook2, TRUE)));
	
	DelayCommand(2.8, ActionResumeConversation());
}
