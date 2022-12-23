//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan14_jon.dlg in danm14aa  (Dantooine Jedi Enclave Courtyard)
	
	This script has been added to every starting node in the DLG for Jon, the
	farmer whose daughter was killed by Mando raiders. It jumps the party into
	position to fit the framing of the static camera used for most of Jon's
	lines, and also jumps the patrolling Jedi out of the way, since he typically
	bumps into Jon and the party causing all sorts of issues. Almost certainly
	why Bioware used the static camera in the first place.
	
	See also cp_dan14_jediwlk.
	
	Issue #548: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/548
	
	DP 2022-12-23																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJon = GetObjectByTag("dan14_jon", 0);
	object oJedi = GetObjectByTag("dan14_jedim", 0);
	int WALKWAYS_CURRENT_POSITION = 0;
	location lPC = Location(Vector(129.95,133.52,1.50), 53.72);
	location lPM1 = Location(Vector(128.44,133.15,1.50), 53.72);
	location lPM2 = Location(Vector(130.05,131.97,1.50), 53.72);
	location lJediJmp = Location(Vector(98.77,195.42,1.50), 0.00);
	
	NoClicksFor(1.0);
	
	SetGlobalFadeOut();
	
	// Jump the patrolling Jedi out of the way into the back corner
	// and set its next waypoint target to the nearest one.
	CP_PartyJump(oJedi, lJediJmp);
	SetLocalNumber(oJedi, WALKWAYS_CURRENT_POSITION, 6);
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	DelayCommand(0.25, CP_FaceNPC(oPC, oJon));
	DelayCommand(0.25, CP_FaceNPC(oPM1, oJon));
	DelayCommand(0.25, CP_FaceNPC(oPM2, oJon));
	DelayCommand(0.25, CP_FaceNPC(oJon, oPC));
	
	DelayCommand(0.5, SetGlobalFadeIn(0.5, 0.5));
}
