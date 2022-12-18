//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_holo.dlg in unk_m41ab (Lehon South Beach).
	
	This script fires on the opening node of the scene with the hologram outside
	the Elder's Compound on Lehon. It walks the party from their starting point
	set by the trigger that fires the scene towards the point the hologram spawns
	on the following node. This has been tweaked slightly to try and ensure that
	the party walk commands are not broken by excessive user input, which could
	happen in the vanilla scene. The party positioning and facing has also been
	slightly tweaked, and Force Speed has been stripped to prevent power walking.
	
	See also cp_unk41ab_hotlk.
	
	Issue #560: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/560
	
	DP 2022-12-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oHolo = GetObjectByTag("spawn1", 0);
	location lPC = Location(Vector(47.69,110.81,4.85), -75.00);
	location lPM1 = Location(Vector(48.55,111.53,4.86), -86.25);
	location lPM2 = Location(Vector(46.63,110.96,4.79), -57.03);
	
	ActionPauseConversation();
	
	NoClicksFor(2.5);
	
	SetGlobalFadeIn(0.5, 0.75);
	
	CP_RemoveForceSpeed(oPC);
	CP_RemoveForceSpeed(oPM1);
	CP_RemoveForceSpeed(oPM2);
	
	DelayCommand(0.1, CP_PartyMove(oPC, lPC));
	DelayCommand(0.6, CP_PartyMove(oPM1, lPM1));
	DelayCommand(0.6, CP_PartyMove(oPM2, lPM2));
	
	DelayCommand(1.5, CP_FaceNPC(oPC, oHolo));
	DelayCommand(1.5, CP_FaceNPC(oPM1, oHolo));
	DelayCommand(1.5, CP_FaceNPC(oPM2, oHolo));
	
	ActionWait(2.0);
	
	ActionResumeConversation();
}
