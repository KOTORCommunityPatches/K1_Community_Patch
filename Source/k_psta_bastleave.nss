//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta_carth.dlg in sta_m45aa (Star Forge Deck 1).
	
	This script fires at the end of the scene where you meet back with Bastila
	and Carth in front of the Ebon Hawk after defeating Malak. It runs the party
	to the Hawk as the scene fades out. It has been tweaked slightly to prevent
	potential pathing issues, clearing any effects on the player (like Force speed)
	and delaying both Carth and the PC's start to space them out a little further.
	
	Issue #173: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/173
	
	DP 2023-12-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("sta_bastila", 0);
	object oCarth = GetObjectByTag("sta_carth", 0);
	object oBastWP = GetObjectByTag("sta_way_bast_end", 0);
	object oPCWP = GetObjectByTag("sta_way_bast_pc", 0);
	
	UT_ActionPauseConversation(3.5);
	
	AssignCommand(oPC, ClearAllEffects());
	
	if (GetIsObjectValid(oBast))
		{
			SetLockHeadFollowInDialog(oBast, TRUE);
			AssignCommand(oBast, ActionMoveToObject(oBastWP, TRUE));
		}
	
	if (GetIsObjectValid(oCarth))
		{
			SetLockHeadFollowInDialog(oCarth, TRUE);
			DelayCommand(0.5, AssignCommand(oCarth, ActionMoveToObject(oBastWP, TRUE)));
		}
	
	DelayCommand(1.0, AssignCommand(oPC, ActionMoveToObject(oPCWP, TRUE)));
}
