//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    Fired by kas_xor_dialog.dlg in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
    This script fires on the first node of the post-combat scene in the final Xor
	encounter in all eligible landing bay modules. It jumps Xor and the party for
	better framing and facing during the conversation. Since it has to work across
	four different modules, it dynamically creates the party positions based on
	offsets from one of Xor's vanilla waypoints.
	
	See also k_kas_xorattack, k_kas_xorthug_ud, k_kas_xor_user.

	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2021-12-06																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_Face(object oNPC, object oFace)	 {
	AssignCommand(oNPC, SetFacingPoint(GetPosition(oFace)));
	DelayCommand(0.2, AssignCommand(oNPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJuh = GetObjectByTag("Juhani", 0);
	object oXor = GetObjectByTag("kas_xor1", 0);
	object oWPXor = GetObjectByTag("kas_xor1_spawn", 0);
	vector vXor = GetPosition(oWPXor);
	vector vPC = Vector(vXor.x + 2.0, vXor.y, vXor.z);
	vector vJuh = Vector(vXor.x, vXor.y + 2.0, vXor.z);
	vector vPM2 = Vector(vXor.x + 2.0, vXor.y + 2.0, vXor.z);
	location lPC = Location(vPC, GetFacing(oWPXor));
	location lJuh = Location(vJuh, GetFacing(oWPXor));
	location lPM2 = Location(vPM2, GetFacing(oWPXor));
	location lXor = GetLocation(oWPXor);
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	SetGlobalFadeIn(1.5, 1.5);
	
	CP_PartyJump(oXor, lXor);
	CP_PartyJump(oPC, lPC);
	CP_PartyJump(oJuh, lJuh);
	
	if (GetIsObjectValid(oPM1) && GetTag(oPM1) != "Juhani")
		{
			CP_PartyJump(oPM1, lPM2);
		}
		else if (GetIsObjectValid(oPM2) && GetTag(oPM2) != "Juhani")
			{
				CP_PartyJump(oPM2, lPM2);
			}
	
	DelayCommand(0.5, CP_Face(oXor, oJuh));
	DelayCommand(0.5, CP_Face(oPM1, oXor));
	DelayCommand(0.5, CP_Face(oPM2, oXor));
	DelayCommand(0.5, CP_Face(oPC, oXor));
	
	DelayCommand(3.0, ActionResumeConversation());
}
