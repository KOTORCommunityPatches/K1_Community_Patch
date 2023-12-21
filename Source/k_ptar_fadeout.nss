//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar10_kandon01.dlg in tar_m10aa (Taris Black Vulkar Base Upper).
	
	This script is fired to move the player to the room where they spend the
	night before the swoop race. Just a minor change to set the facing of the
	PC so they aren't pointing in an odd direction and preventing the player
	from skipping the line, which can cause some cutscene screwiness.
	
	Updated 2023-12-21 to jump the PC into position and lock their orientation
	to prevent them staring at the Vulkar's spawn-in point, rather than walking
	them forwards as was done initially. Also streamlined/cleaned up some of
	the other code.
	
	See also k_ptar_racecs0.
	
	Issue #12: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/12
	
	DP 2019-05-01 / DP 2023-12-21												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void RemoveParty() {
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oVulkSpwn = GetObjectByTag("tar11_wpcsvulkar", 0);
	
	UT_ClearAllPartyMembers();
	
	DestroyObject(oPM1);
	DestroyObject(oPM2);
	
	CreateObject(OBJECT_TYPE_CREATURE, "tar11_csvulkar", GetLocation(oVulkSpwn), FALSE);
}

void main() {

	object oPC = GetFirstPC();
	object oWP = GetObjectByTag("tar11_wppcsleep", 0);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(6.0, 1.0);
	
	NoClicksFor(9.0);
	
	DelayCommand(7.0, CP_DLGLock(oPC, TRUE));
	
	DelayCommand(7.0, RemoveParty());
	
	DelayCommand(7.1, CP_PartyJumpObject(oPC, oWP));
	DelayCommand(7.2, AssignCommand(oPC, SetFacing(DIRECTION_SOUTH)));
	DelayCommand(7.3, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.5)));
	
	ActionWait(8.0);
	ActionResumeConversation();
}
