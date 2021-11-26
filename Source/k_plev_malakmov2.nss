//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_darthmala2.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	As part of returning Bastila's equipped gear at the end of the Malak showdown
	on the Leviathan, she now only equips a stunt saber if she doesn't already
	have a saber equipped, in much the same way as Carth is already dealt with
	in the vanilla scene. Forcibly equipping her with a stunt saber has now been
	removed from this script.
	
	See also k_plev_bastatk, k_plev_destweap, k_plev_finale1, k_plev_pause.
	
	Issue #419: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/419
	
	DP 2021/11/26																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("Carth", 0);
	object oBastila = GetObjectByTag("Bastila", 0);
	object oMalak = GetObjectByTag("DarthMalak400", 0);
	object oDoor = GetObjectByTag("lev40_blastdoorb", 0);
	object oWP_PC = GetObjectByTag("lev40_wpconfa", 0);
	object oWP_Bast = GetObjectByTag("lev40_wpconfb", 0);
	object oWP_Carth = GetObjectByTag("lev40_wpconfc", 0);
	object oWP_Malak = GetObjectByTag("lev40_wpmalak", 0);
	
	ActionPauseConversation();
	
	MusicBackgroundStop(GetArea(OBJECT_SELF));
	DelayCommand(0.2, MusicBackgroundChangeNight(GetArea(OBJECT_SELF), 8));
	DelayCommand(0.2, MusicBackgroundChangeDay(GetArea(OBJECT_SELF), 8));
	DelayCommand(0.5, MusicBackgroundPlay(GetArea(OBJECT_SELF)));
	
	SetPartyLeader(NPC_PLAYER);
	
	DelayCommand(0.2, AssignCommand(oDoor, ActionOpenDoor(OBJECT_SELF)));
	
	AssignCommand(oPC, JumpToLocation(GetLocation(oWP_PC)));
	UT_TeleportPartyMember(oCarth, GetLocation(oWP_Carth));
	UT_TeleportPartyMember(oBastila, GetLocation(oWP_Bast));
	
	DelayCommand(1.0, AssignCommand(oMalak, ActionMoveToObject(oWP_Malak)));
	
	if (GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oCarth) == OBJECT_INVALID)
		{
			AssignCommand(oCarth, ActionEquipMostDamagingRanged(OBJECT_INVALID));
		}
	
	DelayCommand(4.5, ActionResumeConversation());
}
