//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    UserDefine for kas_xor2.utc / kas_xor3.utc in kas_m22aa (Kashyyyk Landing
	Pad), korr_m33aa (Korriban Dreshdae), manm26ad (Manaan Docking Bay),
	tat_m17ab (Tatooine Docking Bay).
	
    This is the OUD for Xor's two thugs in all eligible landing bay modules. The
	OnDeath event fires the post-combat scene if Xor was taken down to his minimum
	HP before the two mooks were killed. The original could seemingly fail to fire
	in some cases, resulting in the quest breaking, so it has tweaked to hopefully
	prevent that.
	
	Updated 2022-03-27 to add in an alternative OnDeath check to account for
	killing both mooks simultaneously, which could result in the final cutscene
	not firing. Hopefully resolved for realsies this time.
	
	Updated 2023-11-28 to mirror the tweaks made in Xor's OUD to the pre-convo
	wrangling under the fade-out, like disabling the party AI.
	
	See also cp_xor_invis_ud, cp_xor_ptyjmpend, k_kas_xorattack, k_kas_xor_user.

	Issue #8: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/8
	
	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2021-12-06 / DP 2022-03-27 / DP 2023-11-28								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void CP_ClearNPC(object oNPC) {
	AssignCommand(oNPC, ClearAllActions());
	CancelCombat(oNPC);
	AssignCommand(oNPC, ClearAllEffects());
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oXor = GetObjectByTag("kas_xor1", 0);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{

		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{
			object oOtherMook;
			
			// Since both mooks share this script, work out which one is which.
			if (GetTag(OBJECT_SELF) == "kas_xor2")
				{
					oOtherMook = GetObjectByTag("kas_xor3", 0);
				}
				else
					{
						oOtherMook = GetObjectByTag("kas_xor2", 0);
					}
			
			// Check if the other mook is also dead, and fire the final cutscene if so.
			if (!GetIsObjectValid(oOtherMook) && UT_GetTalkedToBooleanFlag(oXor) || GetIsDead(oOtherMook) && UT_GetTalkedToBooleanFlag(oXor))
				{
					SetGlobalFadeOut();
					
					NoClicksFor(1.5);
					
					SetPartyLeader(NPC_PLAYER);
					
					// Disable the party AI.
					AssignCommand(oPM1, CP_DisableAI(TRUE));
					AssignCommand(oPM2, CP_DisableAI(TRUE));
					
					DelayCommand(0.25, CP_ClearNPC(oXor));
					DelayCommand(0.5, CP_ClearNPC(oPC));
					DelayCommand(0.5, CP_ClearNPC(oPM1));
					DelayCommand(0.5, CP_ClearNPC(oPM2));
					
					DelayCommand(0.6, CP_PartyJumpObject(oXor, GetObjectByTag("kas_xor1_spawn", 0)));
					
					DelayCommand(1.0, AssignCommand(GetObjectByTag("invis_xor_conv", 0), ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
	else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase("wp_homebase");
		}
}
