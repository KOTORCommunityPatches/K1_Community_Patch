//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_gendar041.dlg in tar_m04aa (Taris Undercity).
	
	This added script fires on every opening node for Gendar's conversation in the
	Taris Undercity. It jumps the party into position in front of him, disables the
	random waypoint walking of the surrounding ambient NPCs for the duration of the
	conversation to stop them trying to blunder through the middle of it, and moves
	them away if they are too close at the start.
	
	See also cp_tar04_rukilwk.
	
	Issue #722: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/722
	
	DP 2023-12-10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_HaltWalk(object oNPC) {
	object oGendar = GetObjectByTag("Gendar041");
	int	SW_FLAG_WAYPOINT_WALK_RANDOM = 38;
	
	SetLocalBoolean(oNPC, SW_FLAG_WAYPOINT_WALK_RANDOM, FALSE);
	DelayCommand(0.1, AssignCommand(oNPC, ClearAllActions()));
	
	if (GetDistanceBetween(oGendar, OBJECT_SELF) < 10.0)
		{
			DelayCommand(0.2, AssignCommand(oNPC, ActionMoveAwayFromObject(oGendar, FALSE, 16.0)));
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
	object oShal = GetObjectByTag("outcastshaleena", 0);
	location lPC = Location(Vector(209.45,140.84,1.50), 270.00);
	location lPM2 = Location(Vector(210.95,140.76,1.50), 240.00);
	location lPM1 = Location(Vector(207.95,140.76,1.50), -60.00);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.75, 1.0);
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.2, CP_FaceNPC(oPC, oFace));
	DelayCommand(0.2, CP_FaceNPC(oPM1, oFace));
	DelayCommand(0.2, CP_FaceNPC(oPM2, oFace));
	DelayCommand(0.2, CP_FaceNPC(OBJECT_SELF, oPC));
	
	CP_HaltWalk(oOut1);
	CP_HaltWalk(oOut2);
	CP_HaltWalk(oOut3);
	CP_HaltWalk(oOut4);
	CP_HaltWalk(oShal);
}
