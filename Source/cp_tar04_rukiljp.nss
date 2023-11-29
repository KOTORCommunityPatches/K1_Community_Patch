//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_rukil.dlg in tar_m04aa (Taris Undercity).
	
	This added script fires on every opening node for Rukil's conversation (except
	for the betrayal branch). It jumps the party into position in front of Rukil,
	disables the random waypoint walking of the surrounding ambient NPCs for the
	duration of the conversation to stop them trying to blunder through the middle
	of it, and moves them away if they are too close.
	
	See also cp_tar04_rukilwk, k_ptar_rukcs0.
	
	Issue #501: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/501
	
	DP 2023-11-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_HaltWalk(object oNPC) {
	object oRukil = GetObjectByTag("Rukil04");
	int	SW_FLAG_WAYPOINT_WALK_RANDOM = 38;
	
	SetLocalBoolean(oNPC, SW_FLAG_WAYPOINT_WALK_RANDOM, FALSE);
	DelayCommand(0.1, AssignCommand(oNPC, ClearAllActions()));
	
	if (GetDistanceBetween(oRukil, OBJECT_SELF) < 5.0)
		{
			DelayCommand(0.2, AssignCommand(oNPC, ActionMoveAwayFromObject(oRukil, FALSE, 6.0)));
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oFace = OBJECT_SELF;
	object oOut1 = GetObjectByTag("OutcastMan043", 0);
	object oOut2 = GetObjectByTag("OutcastMan044", 0);
	object oOut3 = GetObjectByTag("OutcastWom041", 0);
	object oOut4 = GetObjectByTag("OutcastWom042", 0);
	object oOut5 = GetObjectByTag("OutcastWom042", 1);
	location lPC = Location(Vector(206.06,144.34,1.50), 90.00);
	location lPM1 = Location(Vector(204.56,144.42,1.50), 40.00);
	location lPM2 = Location(Vector(207.56,144.42,1.50), 140.00);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.2, CP_FaceNPC(oPC, oFace));
	DelayCommand(0.2, CP_FaceNPC(oPM1, oFace));
	DelayCommand(0.2, CP_FaceNPC(oPM2, oFace));
	DelayCommand(0.2, CP_FaceNPC(OBJECT_SELF, oPC));
	
	CP_HaltWalk(oOut1);
	CP_HaltWalk(oOut2);
	CP_HaltWalk(oOut3);
	CP_HaltWalk(oOut4);
	CP_HaltWalk(oOut5);
}
