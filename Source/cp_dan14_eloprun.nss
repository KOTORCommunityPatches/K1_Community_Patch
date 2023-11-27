//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg in danm14ad (Dantooine Sandral Grounds).
	
	This is a replacement for the vanilla k_pdan_romance50 that has Rahasia and Shen
	run off during the elopement conclusion to the Sandral-Matale Feud scene. The
	original script used OUD events to simply run then towards the exit, but then
	left them standing there, clearly visible in the background of subsequent shots.
	As well as condensing it into a single script, they now they get destroyed as
	soon as they reach their destination. The original also had them run off well
	before they should have, so it has now been delayed in addition to switching the
	node it fires on. Renamed to avoid potential filename clashes.
	
	Issue #158: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/158
	
	DP 2023-11-27																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oRaha = GetObjectByTag("dan14_rahasia", 0);
	object oShen = GetObjectByTag("dan14_shen", 0);
	location lExit = GetLocation(GetWaypointByTag("FROM14CW"));
	
	NoClicksFor(4.0);
	
	DelayCommand(2.0, AssignCommand(oRaha, CP_ExitArea(lExit, TRUE)));
	DelayCommand(2.75, AssignCommand(oShen, CP_ExitArea(lExit, TRUE)));
}
