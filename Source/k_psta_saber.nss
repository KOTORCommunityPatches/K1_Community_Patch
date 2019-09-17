////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta_jedifem.dlg in sta_m45aa (Star Forge Deck 1).
	
	This script fires during the initial conversation with the Jedi strike team
	after exiting the Ebon Hawk. Widescreen revealed that the Jedi running off
	were only moving a few feet away, so this was changed in conjunction with
	the addition of a new static camera to better sell the idea they were running
	off to fight the Dark Jedi.
	
	Issue #173: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/173
	
	DP 2019-06-27                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oJedi1 = GetObjectByTag("sta_Jedi001", 0);
	object oJedi2 = GetObjectByTag("sta_Jedi002", 0);
	object oJedi3 = GetObjectByTag("sta_Jedi003", 0);
	object oJedi4 = GetObjectByTag("sta_Jedi004", 0);
	location oJediWP8 = Location(Vector(77.78,156.996,36.305), 0.0);
	location oJediWP9 = Location(Vector(77.781,155.172,36.305), 0.0);
	location oJediWP10 = Location(Vector(77.553,159.211,36.305), 0.0);
	
	UT_ActionPauseConversation(5.0);
	
	AssignCommand(oJedi1, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT));
	DelayCommand(1.0, AssignCommand(oJedi2, ActionEquipMostDamagingMelee(OBJECT_INVALID, 0)));
	DelayCommand(1.0, AssignCommand(oJedi3, ActionEquipMostDamagingMelee(OBJECT_INVALID, 0)));
	DelayCommand(1.5, AssignCommand(oJedi4, ActionEquipMostDamagingMelee(OBJECT_INVALID, 0)));
	DelayCommand(1.5, AssignCommand(oJedi2, ActionMoveToLocation(oJediWP10, TRUE)));
	DelayCommand(1.75, AssignCommand(oJedi3, ActionMoveToLocation(oJediWP8, TRUE)));
	DelayCommand(2.0, AssignCommand(oJedi4, ActionMoveToLocation(oJediWP9, TRUE)));
}
