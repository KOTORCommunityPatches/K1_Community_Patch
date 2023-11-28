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
	
	Updated 2023-11-28 to switch to CP include functions for the facing and to
	tweak the timings to ensure everyone does as they are told. Also flags Xor
	to enable his added OnDeath event and turns the party AI back on, since it
	was disabled for the pre-convo setup.
	
	See also cp_xor_invis_ud, k_kas_xorattack, k_kas_xorthug_ud, k_kas_xor_user.

	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2021-12-06 / DP 2023-11-28												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

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
	location lPC = Location(vPC, 135.0);
	location lJuh = Location(vJuh, -90.0);
	location lPM2 = Location(vPM2, 225.0);
	location lXor = Location(vXor, 90.0);
	int SW_FLAG_EVENT_ON_DEATH = 27;
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	DelayCommand(1.5, SetGlobalFadeIn(0.0, 1.5));
	
	// Enable the OnDeath UserDefine event for Xor.
	SetLocalBoolean(oXor, SW_FLAG_EVENT_ON_DEATH, TRUE);
	
	DelayCommand(0.1, AssignCommand(oXor, JumpToLocation(lXor)));
	DelayCommand(0.2, AssignCommand(oPC, JumpToLocation(lPC)));
	DelayCommand(0.3, AssignCommand(oJuh, JumpToLocation(lJuh)));
	
	if (GetIsObjectValid(oPM1) && GetTag(oPM1) != "Juhani")
		{
			DelayCommand(0.4, AssignCommand(oPM1, JumpToLocation(lPM2)));
		}
		else if (GetIsObjectValid(oPM2) && GetTag(oPM2) != "Juhani")
			{
				DelayCommand(0.4, AssignCommand(oPM2, JumpToLocation(lPM2)));
			}
	
	DelayCommand(0.8, CP_FaceNPC(oXor, oJuh));
	DelayCommand(0.8, CP_FaceNPC(oPM1, oXor));
	DelayCommand(0.8, CP_FaceNPC(oPM2, oXor));
	DelayCommand(0.8, CP_FaceNPC(oPC, oJuh));
	
	// Turn party member AI back on.
	DelayCommand(2.0, AssignCommand(oPM1, CP_DisableAI(FALSE)));
	DelayCommand(2.0, AssignCommand(oPM2, CP_DisableAI(FALSE)));
	
	DelayCommand(3.0, ActionResumeConversation());
}
