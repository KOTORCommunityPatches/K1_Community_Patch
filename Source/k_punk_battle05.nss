//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_battle.dlg in unk_m43aa (Lehon The One's Settlement).
	
	This is one of the scripts used in the cutscene with The One when taking the
	Light Side route on the Unknown World and siding with the Elders. The scene
	fires as soon as you enter the amphitheatre and has The One run to the lever
	that controls the gates to the Rancor pens. There were a few issues in this
	scene due to timings and camera angles, so those have been changed. Here,
	the timing of the level activating was reduced, since it was badly out of
	sync in the vanilla version (0.9s delay). Additionally, the Rancors are now
	jumped to their starting positions, since their AI has them randomly wandering
	around their cage, which means one or two might lag behind the others in coming
	out of their cages in the final shot. The length of this particular shot has
	also been reduced by half a second, since the vanilla shot had The One just
	standing with his back to the camera for what seemed like too long.
	
	See also k_punk_battle02.
	
	Issue #287: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/287
	
	DP 2019-10-01																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oLever = GetObjectByTag("unk43_ranclever", 0);
	object oRancor1 = GetObjectByTag("unk43_rancor1", 0);
	object oRancor2 = GetObjectByTag("unk43_rancor2", 0);
	object oRancor3 = GetObjectByTag("unk43_rancor3", 0);
	object oRancor4 = GetObjectByTag("unk43_rancor4", 0);
	location lRancor1 = Location(Vector(15.488,118.906,40.683), 45.0);
	location lRancor2 = Location(Vector(15.394,155.166,40.683), -45.0);
	location lRancor3 = Location(Vector(52.369,118.357,40.683), 135.0);
	location lRancor4 = Location(Vector(52.027,155.238,40.683), -135.0);
	
	ActionPauseConversation();
	
	SetFacingPoint(GetPosition(oLever));
	ActionInteractObject(oLever);
	ActionPlayAnimation(ANIMATION_LOOPING_GET_MID);
	
	DelayCommand(0.5, ActionInteractObject(oLever));
	DelayCommand(0.5, AssignCommand(oLever, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
	
	CP_PartyJump(oRancor1, lRancor1);
	CP_PartyJump(oRancor2, lRancor2);
	CP_PartyJump(oRancor3, lRancor3);
	CP_PartyJump(oRancor4, lRancor4);
	
	DelayCommand(1.5, ActionResumeConversation());
}
