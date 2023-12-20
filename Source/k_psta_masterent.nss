//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_sta45_malak2.dlg in sta_m45ab (Star Forge Deck 2).
	
	This script fires at the beginning of the second scene with the Sith talking
	to Malak about dealing with the invading Jedi. It has been altered to face
	the Sith towards and Malak, and likewise face Malak towards the Sith. In the
	vanilla scene the Sith just stares off into space when he walks up next to
	Malak, which looked kind of weird. It prevents Malak being instantly refaced
	on the subsequent line due to speaker/listener tags.
	
	Updated 2023-12-20 to walk the Sith directly to Malak, in combination with a
	DLG listener and camera angle change.
	
	Issue #173: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/173
	
	DP 2023-12-08 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oMalak = GetObjectByTag("sta45b_malak", 0);
	object oMaster = GetNearestObjectByTag("SithMaster", OBJECT_SELF, 1);
	
	ActionPauseConversation();
	
	AssignCommand(oMaster, SetFacingPoint(GetPosition(oMalak)));
	AssignCommand(oMaster, ActionMoveToObject(oMalak));
	AssignCommand(oMaster, ActionDoCommand(DelayCommand(0.5, CP_FaceNPC(oMalak, oMaster))));
	
	ActionWait(4.3);
	ActionResumeConversation();
}
