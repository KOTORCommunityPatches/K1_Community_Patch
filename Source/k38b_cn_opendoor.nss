////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k38b_plc_console.dlg in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires when using the ancient computer to open the door that
	leads to Jorak Uln's trapped corridor. The DLG has been changed to allow
	skipping, but doing so with this script on an earlier node caused the
	door animation to skip frames. The addition of NoClicksFor should prevent
	that occurring.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-27                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oDoor = GetObjectByTag("k38b_dor_locked", 0);
	
	AssignCommand(oDoor, ActionDoCommand(SetLocked(oDoor, FALSE)));
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	
	NoClicksFor(1.0);
}
