////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Originally created for DP's mod "Handon's Enhanced Waistline".
	
	Fired by dan14_bolook.dlg on Entry 56 in danm14ac (Grove)
	
	This script forces Rickard to run off after being told he can leave. In
	the vanilla scene, both Handon and Rickard stand around despite being
	told they can leave if the other is solely accused by the player.
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	object oObject = GetObjectByTag("dan14_rickard", 0);
	object oExit = GetWaypointByTag("FROM14BW");

	AssignCommand(oObject, ActionForceMoveToObject(oExit, TRUE));
	AssignCommand(oObject, ActionDoCommand(SetCommandable(TRUE)));
	AssignCommand(oObject, ActionDoCommand(DestroyObject(OBJECT_SELF)));
}
