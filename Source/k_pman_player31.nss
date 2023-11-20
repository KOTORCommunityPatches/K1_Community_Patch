////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarb.dlg in manm26aa (Manaan Ahto West).
	
	This script fires in the player's trial post-Sith Base. It commands them to
	walk up to the judges in the courtroom. Their orientation is now locked and
	they are given a facing command.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////


void main() {
	
	ClearAllActions();
	
	ActionDoCommand(SetLockOrientationInDialog(OBJECT_SELF, TRUE));
	
	ActionMoveToObject(GetObjectByTag("trial_pc", 0));
	
	ActionDoCommand(SignalEvent(GetObjectByTag("man26_selarb", 0), EventUserDefined(0)));
	
	ActionDoCommand(DelayCommand(0.75, SetFacingPoint(GetPosition(GetObjectByTag("man26_seljud1")))));
	
	ActionDoCommand(ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
}
