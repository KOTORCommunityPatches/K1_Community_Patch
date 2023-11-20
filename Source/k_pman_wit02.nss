////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_trial.dlg in manm26aa (Manaan Ahto West).
	
	This script fires during Sunry's trial cutscene when witnesses leave the
	"stand" and return to their previous position. It simply adds an animation
	to ensure they reface correctly.
	
	See also k_pman_26a_aread, k_pman_murder81, k_pman_trial05.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ClearAllActions();
	ActionMoveToObject(GetObjectByTag("trial_" + GetTag(OBJECT_SELF), 0));
	ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("trial_stand02"))));
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
	ActionDoCommand(SetLockOrientationInDialog(OBJECT_SELF, FALSE));
}
