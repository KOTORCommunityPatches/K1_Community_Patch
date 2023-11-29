//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_rukil.dlg in tar_m04aa (Taris Undercity).
	
	This script fires when the player returns all three Promised Land journals to
	Rukil, jumping him over to Gendar. The vanilla script only jumped Rukil, which
	made for some awkward camera angles given the potential random positioning of
	the player. Now the whole party is jumped across with Rukil, allowing them to
	be shown in wide camera shots.
	
	See also cp_tar04_rukiljp, cp_tar04_rukilwk.
	
	Issue #501: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/501
	
	DP 2023-11-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oFace = GetObjectByTag("Gendar041");
	location lPC = Location(Vector(210.38,139.60,1.50), 240.00);
	location lPM1 = Location(Vector(213.07,141.10,1.50), 220.00);
	location lPM2 = Location(Vector(210.27,142.68,1.50), 255.00);
	location lRukil = Location(Vector(208.42,139.60,1.50), -65.00);
	
	SetGlobalFadeOut(0.0, 0.5);
	
	ActionPauseConversation();
	
	DelayCommand(0.7, CP_PartyHerder(lPC, lPM1, lPM2));
	
	DelayCommand(0.9, CP_FaceNPC(oPC, oFace));
	DelayCommand(0.9, CP_FaceNPC(oPM1, oFace));
	DelayCommand(0.9, CP_FaceNPC(oPM2, oFace));
	
	ActionWait(1.0);
	ActionJumpToLocation(lRukil);
	ActionDoCommand(CP_FaceNPC(OBJECT_SELF, oFace));
	ActionWait(0.5);
	ActionResumeConversation();
}
