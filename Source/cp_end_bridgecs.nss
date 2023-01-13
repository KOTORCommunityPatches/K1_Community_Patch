//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_end_traskbrdg.dlg in end_m01aa (Endar Spire Command Module).
	
	This script is fired on the first node of an added DLG for Trask which plays
	after defeating the two Sith soldiers at the entrance of the Bridge. Once
	both are dead, a cutscene is forced with the party jumped under a fadeout.
	This makes sure both are fully inside the Bridge, and shows the door being
	shut and locked. After that, Trask says his usual lines about Bastila not
	being present and being blown into galactic dust.
	
	See also cp_end_trasksp_d, k_pend_door20, k_pend_room7_01.
	
	Issue #490: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/490
	
	DP 2023-01-13																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_end"
#include "cp_inc_k1"
 
 void main() {
	
	object oPC = GetFirstPC();
	object oTrask = GetTrask();
	object oDoor = GetObjectByTag("end_door08", 0);
	object oSith1 = GetObjectByTag("end_bridgesith1", 0);
	object oSith2 = GetObjectByTag("end_bridgesith2", 0);
	object oRep1 = GetObjectByTag("end_bridgerep1", 0);
	object oRep2 = GetObjectByTag("end_bridgerep2", 0);
	object oDoorWP = GetObjectByTag("wp_end_bridgedoor", 0);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oTrask, ClearAllActions());
	
	DelayCommand(0.1, CP_FaceNPC(oPC, oTrask));
	DelayCommand(0.1, CP_FaceNPC(oTrask, oPC));
	
	// Blow up the door.
	SetLocked(oDoor, TRUE);
	DelayCommand(1.2, PlayExplosion("wp_end_room7_2", TRUE, TRUE));
	DelayCommand(1.8, PlayExplosion("wp_end_bridgedoor", TRUE, TRUE));
	DelayCommand(2.0, UT_CreateObject(OBJECT_TYPE_PLACEABLE, "plc_smoke", GetLocation(oDoorWP)));
	DelayCommand(2.5, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
	
	SetGlobalBoolean("END_BRIDGE_SEALED", TRUE);
	
	DelayCommand(4.0, ActionResumeConversation());
}
