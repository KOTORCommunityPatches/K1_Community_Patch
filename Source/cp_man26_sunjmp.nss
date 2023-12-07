////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_sunry.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on most of the first nodes of each branch of Sunry's
	DLG while he is in prison, jumping the party into position to help alleviate
	facing issues and Jolee skating across the floor. Switched to waypoints rather
	than the usual locations to try and prevent party members flaking out due to
	being in the outside corridor.
	
	Updated 2023-12-07 to add in an initial jump before herding everyone into their
	final positions. For some reason the party members will sometimes ignore their
	jump orders and stay scattered. Seems like switching to the use of waypoints
	didn't alleviate this as first thought, even when they are already inside the
	room.
	
	Issue #523: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/523
	
	DP 2023-11-17 / DP 2023-12-07												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSunry = GetObjectByTag("man26_sunry");
	object oFace = GetObjectByTag("man26_sel3");
	location lPC = GetLocation(GetWaypointByTag("cp_sun_jmp_pc"));
	location lJol = GetLocation(GetWaypointByTag("cp_sun_jmp_jol"));
	location lPM2 = GetLocation(GetWaypointByTag("cp_sun_jmp_pm2"));
	location lStartPC = Location(Vector(30.32,9.95,58.62), 42.47);
	location lStartPM1 = Location(Vector(29.61,10.72,58.62), 42.47);
	location lStartPM2 = Location(Vector(31.04,9.16,58.62), 42.47);
	
	SetGlobalFadeOut();
	DelayCommand(0.6, SetGlobalFadeIn(0.5, 0.5));
	
	// Since the party members have a habit of ignoring their orders, start
	// with a safety jump first before doing a second, final jump.
	CP_PartyHerder(lStartPC, lStartPM1, lStartPM2);
	
	// Reface Sunry towards the party.
	DelayCommand(0.2, AssignCommand(oSunry, ActionDoCommand(SetFacingPoint(GetPosition(oFace)))));
	DelayCommand(0.3, AssignCommand(oSunry, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
	
	if (IsNPCPartyMember(NPC_JOLEE))
		{
			if (GetTag(oPM1) == "Jolee")
				{
					DelayCommand(0.2, CP_PartyHerder(lPC, lJol, lPM2));
					DelayCommand(0.3, CP_FaceNPC(oPC, oSunry));
					DelayCommand(0.3, CP_FaceNPC(oPM1, oSunry));
					DelayCommand(0.3, CP_FaceNPC(oPM2, oSunry));
				}
				else
					{
						DelayCommand(0.2, CP_PartyHerder(lPC, lPM2, lJol));
						DelayCommand(0.3, CP_FaceNPC(oPC, oSunry));
						DelayCommand(0.3, CP_FaceNPC(oPM1, oSunry));
						DelayCommand(0.3, CP_FaceNPC(oPM2, oSunry));
					}
		}
		else
			{
				DelayCommand(0.2, CP_PartyHerder(lPC, lJol, lPM2));
				DelayCommand(0.3, CP_FaceNPC(oPC, oSunry));
				DelayCommand(0.3, CP_FaceNPC(oPM1, oSunry));
				DelayCommand(0.3, CP_FaceNPC(oPM2, oSunry));
			}
}
