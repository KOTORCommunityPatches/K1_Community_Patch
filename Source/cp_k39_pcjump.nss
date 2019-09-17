////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor39_utharwynn.dlg in korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This script is fired on the initial node when entering the tomb with
	Uthar and Yuthura. Since the camera angle on this node was changed from
	looking at a closed door to facing in the opposite direction (the same
	as on the following node), the player needs to be moved back a bit so
	that they don't start standing in the shot. Easier to script it than to
	edit the module entry point and starting trigger geometry, since the jump
	is covered by a fade-in.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-23                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	location lPC = Location(Vector(7.619,107.719,21.0), 0.0);
	
	AssignCommand(oPC, ActionJumpToLocation(lPC));
	AssignCommand(oPC, ActionDoCommand(SetFacing(DIRECTION_EAST)));
}
