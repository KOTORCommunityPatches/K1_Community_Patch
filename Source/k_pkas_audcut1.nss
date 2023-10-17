//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_audspeak.dlg in kas_m23aa (Kashyyyk Village of Rwookrrorro).
	
	This script fires on the first node of the cutscene that is triggered after
	being ejected from the Chieftain's Hall at the end of the first meeting with
	Chuundar. It simply walks the party forwards from their initial module start
	position outside the Hall's entrance. However, since the start position is
	a single waypoint, the party members tend to get in the PC's way as they
	try to walk, causing all sorts of janky pathing behaviour. Now the party is
	jumped into separate starting positions under the fadeout to keep them out
	of each other's way.
	
	Issue #515: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/515
	
	DP 2023-10-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oWP_PC = GetWaypointByTag("kas23_audmove1");
	object oWP_PM1 = GetWaypointByTag("kas23_audmove2");
	object oWP_PM2 = GetWaypointByTag("kas23_audmove3");
	object oDoor = GetObjectByTag("kas23ad_door", 0);
	location lPC = Location(Vector(92.88,66.28,43.30), 202.50);
	location lPM1 = Location(Vector(94.45,65.61,43.30), 202.50);
	location lPM2 = Location(Vector(93.46,67.94,43.30), 202.50);
	
	ActionPauseConversation();
	
	DelayCommand(1.0, SetGlobalFadeIn(0.0, 3.0));
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	DelayCommand(2.5, AssignCommand(oPC, ActionMoveToObject(oWP_PC)));
	DelayCommand(2.6, AssignCommand(oPM1, ActionMoveToObject(oWP_PM1)));
	DelayCommand(2.6, AssignCommand(oPM2, ActionMoveToObject(oWP_PM2)));
	
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	AssignCommand(oDoor, DelayCommand(2.5, ActionCloseDoor(oDoor)));
	
	DelayCommand(4.0, ActionResumeConversation());
}
