//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_redpris.dlg in unk_m43aa (Lehon The One's Settlement).
	
	This added script fires on the first node of the Elder Rakata prisoner's DLG.
	It jumps the party into position in order to prevent pathfinding issues at
	the end of the scene when the prisoner runs out of the cell. Additionally,
	it plays a sound for the groan that the prisoner is supposed to be doing on
	that node. The DLG originally used one of the Rakata soundset attack barks,
	n_rakata_atk3, in the Sound slot, but this did nothing. This was changed to
	use the PlaySound function in this script instead, and the SFX was switched
	to the death bark. Although neither really seem suitable for the intended
	task.
	
	Issue #532: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/532
	
	DP 2023-01-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oPris = GetObjectByTag("unk43_redpris", 0);
	location lPC = Location(Vector(54.41,159.80,40.68), 112.39);
	location lPM1 = Location(Vector(54.10,157.91,40.68), 112.39);
	location lPM2 = Location(Vector(55.95,158.67,40.68), 112.39);
	
	NoClicksFor(1.25);
	
	SetGlobalFadeOut();
	
	ActionPauseConversation();
	
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oPM1, lPM1);
	CP_PartyJump(oPM2, lPM2);
	
	DelayCommand(0.1, CP_FaceNPC(oPris, oPC));
	DelayCommand(0.1, CP_FaceNPC(oPC, oPris));
	DelayCommand(0.1, CP_FaceNPC(oPM1, oPris));
	DelayCommand(0.1, CP_FaceNPC(oPM2, oPris));
	
	DelayCommand(0.5, SetGlobalFadeIn(0.25, 0.5));
	
	DelayCommand(0.5, PlaySound("n_rakata_dead"));
	
	DelayCommand(1.75, ActionResumeConversation());
}
