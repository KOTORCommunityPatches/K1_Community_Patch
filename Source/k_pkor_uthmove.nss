////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor39_utharwynn.dlg in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This script Fires during the introductory cutscene, moving Uthar and Yuthura
	forwards after the player. In the vanilla script, Uthar is commanded to move
	to the player rather than a waypoint, resulting in an offset that causes
	some facing issues on Yuthura's interjection. He is now moved to a location
	in line with Yuthura, and her waypoints have been tweaked in a GIT edit to
	fine tune her positioning.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-10                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oYuthura = GetObjectByTag("kor39_yuthura", 0);
	object oWP_Yuthura = GetObjectByTag("k39_way_yuthmove", 0);
	object oDoor = GetObjectByTag("kor39_kor36", 0);
	location lUthar = Location(Vector(11.177,108.943,21.0), 0.0);
	
	ActionPauseConversation();

	DelayCommand(0.5, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
	DelayCommand(1.0, SetLocked(oDoor, TRUE));

	ActionMoveToLocation(lUthar);
	DelayCommand(2.0, AssignCommand(oYuthura, ActionMoveToObject(oWP_Yuthura)));
	
	ActionResumeConversation();
}
