//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_blackrak.dlg in unk_m41ac (Lehon North Beach).
	
	This script fires on the first node of the first encounter scene with the One's
	Rakata outside their settlement. It has been tweaked to strip off Force Speed
	to prevent the party power walking.
	
	Issue #531: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/531
	
	DP 2022-08-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	
	ActionPauseConversation();
	
	SetGlobalFadeIn(0.0, 1.0);
	
	// Appears to be redundant, since the party is already jumped to the same waypoints by the trigger script k_punk_ambush.
	UT_TeleportWholeParty(GetObjectByTag("playerwp1", 0), GetObjectByTag("pm1wp1", 0), GetObjectByTag("pm2wp1", 0));
	
	// Strip off Force Speed, if present.
	CP_RemoveForceSpeed(oPC);
	CP_RemoveForceSpeed(oPM1);
	CP_RemoveForceSpeed(oPM2);
	
	AssignCommand(oPC, ActionMoveToLocation(GetLocation(GetObjectByTag("playerwp2", 0)), FALSE));
	DelayCommand(1.0, AssignCommand(oPM1, ActionMoveToLocation(GetLocation(GetObjectByTag("pm1wp2", 0)), FALSE)));
	DelayCommand(1.0, AssignCommand(oPM2, ActionMoveToLocation(GetLocation(GetObjectByTag("pm2wp2", 0)), FALSE)));
	
	AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("unk41_blk1", 0)))));
	DelayCommand(1.2, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("unk41_blk1", 0))))));
	DelayCommand(1.2, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(GetObjectByTag("unk41_blk1", 0))))));
	
	CreateObject(OBJECT_TYPE_CREATURE, "unk41_blk1", GetLocation(GetObjectByTag("blk1wp2", 0)));
	CreateObject(OBJECT_TYPE_CREATURE, "unk41_blk2", GetLocation(GetObjectByTag("blk2wp2", 0)));
	CreateObject(OBJECT_TYPE_CREATURE, "unk41_blk3", GetLocation(GetObjectByTag("blk3wp2", 0)));
	CreateObject(OBJECT_TYPE_CREATURE, "unk41_blk4", GetLocation(GetObjectByTag("blk4wp2", 0)));
	CreateObject(OBJECT_TYPE_CREATURE, "unk41_rancor01", GetLocation(GetObjectByTag("rancor01wp2", 0)));
	CreateObject(OBJECT_TYPE_CREATURE, "unk41_rancor02", GetLocation(GetObjectByTag("rancor02wp2", 0)));
	
	ActionWait(3.0);
	ActionResumeConversation();
}
