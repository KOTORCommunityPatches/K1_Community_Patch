//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by missdoor_dlg.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script fires after the door opens, running Zaalbar towards the entrance.
	The vanilla script also commanded the door to open again, so presumably they
	had enough problems during testing that they really, really wanted to make
	sure. That has been removed, and Zaalbar has also been changed from running
	to a waypoint in an odd position to right up to the entrance and setting his
	facing towards Mission, since in the vanilla version he ends up angled off to
	one side.
	
	See also cp_tar05_misswlk, k_ptar_addzaal, k_ptar_destzaal, k_ptar_misunlock,
	k_ptar_trigdoor.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oFakeZaal = GetObjectByTag("tar05_zaalbar", 0);
	location lBigZ = Location(Vector(233.868,190.156,29.96), 0.0);
	
	ActionPauseConversation();
	
	DelayCommand(2.0, CP_PartyMove(oFakeZaal, lBigZ, TRUE));
	DelayCommand(2.5, AssignCommand(oFakeZaal, ActionDoCommand(SetFacing(DIRECTION_EAST))));
	// Fire an animation to force the facing to take effect.
	DelayCommand(2.6, AssignCommand(oFakeZaal, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0)));
	
	ActionWait(4.0);
	ActionResumeConversation();
}
