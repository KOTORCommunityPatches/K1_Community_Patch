//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_mission031.dlg in tar_m03ae (Taris Lower City Javyar's Cantina).
	
	An added script that is fired on the first node of the party initiating a
	conversation with Mission after the cutscene where she is confronted by a
	pair of Rodians (AKA the "greenies"). It now jumps the party into position
	and faces them, making sure to leave enough room for Mission and Zaalbar to
	pathfind past them when they get their command to exit the cantina at the
	end of the conversation.	
	
	See also k_ptar_miscs0, k_ptar_missexcan.
	
	Issue #495: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/495
	
	DP 2023-07-26																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"
#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oMission = GetObjectByTag("mission031", 0);
	object oZaal = GetObjectByTag("zaalbar031", 0);
	location lPC = Location(Vector(101.84,108.62,0.00), -30.48);
	location lPM1 = Location(Vector(100.55,108.51,0.00), -30.48);
	location lPM2 = Location(Vector(101.31,109.81,0.00), -30.48);
	
	SetGlobalFadeOut();
	
	NoClicksFor(1.0);
	
	// Jump the party in front of Mission, but far back enough to leave room for Zaalbar
	// to exit past them without pathfinding issues at the end of the conversation.
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	// Face the party towards Mission and Mission towards the party. Face Zaalbar between them.
	DelayCommand(0.2, CP_FaceNPC(oPC, oMission));
	DelayCommand(0.2, CP_FaceNPC(oPM1, oMission));
	DelayCommand(0.2, CP_FaceNPC(oPM2, oMission));
	DelayCommand(0.2, CP_FaceNPC(oMission, oPC));
	DelayCommand(0.2, AssignCommand(oZaal, SetFacing(245.0)));
	DelayCommand(0.25, AssignCommand(oZaal, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	
	DelayCommand(0.4, SetGlobalFadeIn(0.5, 1.0));
}
