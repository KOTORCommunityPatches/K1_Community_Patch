//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_bolook.dlg in danm14ac (Dantooine Grove)
	
	This script is fired during the intro of the Murder Mystery quest, moving
	the characters after they were spawned in a few nodes earlier. As per JC's
	original notes, the edited version now forces Handon to perform the injured
	idle animation when finished.
	
	Updated 2023-12-12 to add an animation to the PC, since they were freezing
	at the end of the scene.
	
	Originally created by JC for DP's mod "Handon's Enhanced Waistline".
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	Issue #110: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/110
	
	DP 2019-02-19 / DP 2023-12-12												*/
//////////////////////////////////////////////////////////////////////////////////

void CP_PlayAnim() {
	AssignCommand(OBJECT_SELF, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN_INJURED, 1.0, 6.0));
	SetLocalBoolean(OBJECT_SELF, 51, TRUE);
}

void main() {
	
	AssignCommand(GetFirstPC(), ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
	AssignCommand(GetObjectByTag("dan14_bolook"),ActionMoveToObject(GetObjectByTag("POST_dan14_bolook01")));
	AssignCommand(GetObjectByTag("dan14_handon"),ActionMoveToObject(GetObjectByTag("POST_dan14_handon01")));
	AssignCommand(GetObjectByTag("dan14_idroid"),ActionMoveToObject(GetObjectByTag("POST_dan14_idroid01")));
	AssignCommand(GetObjectByTag("dan14_rickard"),ActionMoveToObject(GetObjectByTag("POST_dan14_rickard01")));
	
	AssignCommand(GetObjectByTag("dan14_handon"), ActionDoCommand(CP_PlayAnim()));
}
