////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_sunry.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on most of the first nodes of each branch of Sunry's
	DLG while he is in prison, jumping the party into position to help alleviate
	facing issues and Jolee skating across the floor. Switched to waypoints rather
	than the usual locations to try and prevent party members flaking out due to
	being in the outside corridor.
	
	Issue #523: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/523
	
	DP 2023-11-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oSunry = GetObjectByTag("man26_sunry");
	object oFace = GetObjectByTag("man26_sel3");
	object oWP_PC = GetWaypointByTag("cp_sun_jmp_pc");
	object oWP_Jol = GetWaypointByTag("cp_sun_jmp_jol");
	object oWP_PM2 = GetWaypointByTag("cp_sun_jmp_pm2");
	
	SetGlobalFadeOut();
	DelayCommand(0.6, SetGlobalFadeIn(0.5, 0.5));
	
	// Reface Sunry towards the party.
	DelayCommand(0.1, AssignCommand(oSunry, ActionDoCommand(SetFacingPoint(GetPosition(oFace)))));
	DelayCommand(0.15, AssignCommand(oSunry, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.1)));
	
	if (IsNPCPartyMember(NPC_JOLEE))
		{
			DelayCommand(0.1, CP_PartyJumpObject(oPC, oWP_PC));
			DelayCommand(0.2, CP_FaceNPC(oPC, oSunry));
			
			if (GetTag(oPM1) == "Jolee")
				{
					DelayCommand(0.1, CP_PartyJumpObject(oPM1, oWP_Jol));
					DelayCommand(0.1, CP_PartyJumpObject(oPM2, oWP_PM2));
					DelayCommand(0.2, CP_FaceNPC(oPM1, oSunry));
					DelayCommand(0.2, CP_FaceNPC(oPM2, oSunry));
				}
				else
					{
						DelayCommand(0.1, CP_PartyJumpObject(oPM2, oWP_Jol));
						DelayCommand(0.1, CP_PartyJumpObject(oPM1, oWP_PM2));
						DelayCommand(0.2, CP_FaceNPC(oPM1, oSunry));
						DelayCommand(0.2, CP_FaceNPC(oPM2, oSunry));
					}
		}
		else
			{
				DelayCommand(0.1, CP_PartyJumpObject(oPC, oWP_PC));
				DelayCommand(0.1, CP_PartyJumpObject(oPM1, oWP_Jol));
				DelayCommand(0.1, CP_PartyJumpObject(oPM2, oWP_PM2));
				DelayCommand(0.2, CP_FaceNPC(oPC, oSunry));
				DelayCommand(0.2, CP_FaceNPC(oPM1, oSunry));
				DelayCommand(0.2, CP_FaceNPC(oPM2, oSunry));
			}
}
