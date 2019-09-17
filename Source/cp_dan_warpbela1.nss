////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This script forcibly teleports Belaya and the random female Jedi mook
	nearby out behind the Ebon Hawk to keep them out of the way of the
	training montage. One or both can randomly appear during various shots
	due to the nature of their waypoint walking patrol. The timing is such
	that they get back to their usual positions by the time the player is
	talking to Zhar post-montage. This could be handled more elegantly no
	doubt, but attempts to teleport them back afterwards were causing a few
	hiccups. Leaving them to make their own way back proved sufficient
	and alleviated the need for an additional script.
	
	Issue #16: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/16
	
	DP 2019-02-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	location lBela = Location(Vector(223.0,83.0,12.64), 0.0);
	location lJedi = Location(Vector(223.0,68.0,12.64), 0.0);
	object oBela = GetObjectByTag("dan13_belaya", 0);
	object oJedi = GetObjectByTag("dan13_jedif", 0);
	
	AssignCommand(oBela, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.2, AssignCommand(oBela, ActionJumpToLocation(lBela)));
	AssignCommand(oJedi, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.2, AssignCommand(oJedi, ActionJumpToLocation(lJedi)));
}
