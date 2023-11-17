////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_repac.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on the exit node of the cutscene of the Republic vs
	Sith trial. It walks both the diplomats to the back of the courtroom so that
	they are out of the way for the party's interactions with the judges.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-17																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_Walk(location lTarget1, location lTarget2, object oFace) {
	ActionForceMoveToLocation(lTarget1);
	ActionForceMoveToLocation(lTarget2);
	ActionDoCommand(SetFacingPoint(GetPosition(oFace)));
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
	ActionDoCommand(SetCommandable(TRUE));
	SetCommandable(FALSE);
}

void main() {
	
	object oRepDip = GetObjectByTag("man26_repac", 0);
	object oSithDip = GetObjectByTag("man26_sithac", 0);
	object oJudge = GetObjectByTag("man26_seljud1");
	object oRepWP = GetWaypointByTag("wp_man26_replaw2");
	object oSithWP = GetWaypointByTag("wp_man26_sithlaw2");
	location lRepDip = Location(Vector(57.46,5.60,59.16), 138.61);
	location lSithDip = Location(Vector(57.46,-13.87,59.16), 221.25);
	
	AssignCommand(oRepDip, CP_Walk(lRepDip, GetLocation(oRepWP), oJudge));
	AssignCommand(oSithDip, CP_Walk(lSithDip, GetLocation(oSithWP), oJudge));
}
