//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    UserDefine for kas_xor1.utc in kas_m22aa (Kashyyyk Landing Pad), korr_m33aa
	(Korriban Dreshdae), manm26ad (Manaan Docking Bay), tat_m17ab (Tatooine
	Docking Bay).
	
    This is the OUD for Xor in all eligible landing bay modules. The original had
	a perception event to try and trigger the attack scene if he and his mooks
	had been spawned when Juhani wasn't present and the player later returned,
	but it didn't work since it didn't specify the correct object to start the
	conversation and his module-specific OnSpawn left out the OnPerceived flag.
	That is now handled by the trigger instead. His OnDamaged event has been
	tweaked to work with an added party herding script that fires at the start
	of the post-combat scene.
	
	Updated 2022-03-27 to amend the check for the mooks being dead, since there
	is apparently some specific issue with the Selkath mooks on Manaan remaining
	as valid objects post-death that doesn't happen on other planets.
	
	Updated 2023-11-28 to correct the handling of faction reputation when Xor is
	the last one standing, fiddle with timings, turn off the party AI to make them
	behave, and add an OnDeath event for triggering Juhani's related personal
	conversation.
	
	Updated 2023-12-20 to remove the OnDeath event for now, since it will require
	a custom DLG to only fire the two desired convos. Save for inclusion post-1.10.0
	when there's more time to work on it properly.
	
	See also cp_xor_invis_ud, cp_xor_ptyjmpend, k_kas_xorattack, k_kas_xorthug_ud.

	Issue #8: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/8
	
	Issue #397: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/397
	
	DP 2021-12-06 / DP 2022-03-27 / DP 2023-11-28 / DP 2023-12-20				*/
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
	object oThugA = GetObjectByTag("kas_xor2", 0);
	object oThugB = GetObjectByTag("kas_xor3", 0);
	object oInvis = GetObjectByTag("invis_xor_conv", 0);
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
			// Once Xor hits his minimum HP.
			if (GetCurrentHitPoints(OBJECT_SELF) <= 20)
				{
					// If his mooks are dead and Xor is the last man standing, surrender and trigger his final cutscene.
					if ( (!GetIsObjectValid(oThugA) || GetIsDead(oThugA)) && (!GetIsObjectValid(oThugB) || GetIsDead(oThugB)) )
						{
							SetGlobalFadeOut();
							
							NoClicksFor(1.5);
							
							SetPartyLeader(NPC_PLAYER);
							
							// Turn off AI for Xor and the party members.
							CP_DisableAI(TRUE);
							AssignCommand(oPM1, CP_DisableAI(TRUE));
							AssignCommand(oPM2, CP_DisableAI(TRUE));
							
							CP_ClearNPC(OBJECT_SELF);
							
							// Set his unique faction back to non-hostile.
							AdjustReputation(oPC, OBJECT_SELF, 100);
							AdjustReputation(oPM1, OBJECT_SELF, 100);
							AdjustReputation(oPM2, OBJECT_SELF, 100);
							
							DelayCommand(0.3, SurrenderToEnemies());
							
							DelayCommand(0.5, CP_ClearNPC(oPC));
							DelayCommand(0.5, CP_ClearNPC(oPM1));
							DelayCommand(0.5, CP_ClearNPC(oPM2));
							
							DelayCommand(0.6, CP_PartyJumpObject(OBJECT_SELF, GetObjectByTag("kas_xor1_spawn", 0)));
							
							DelayCommand(1.0, AssignCommand(oInvis, ActionStartConversation(OBJECT_SELF, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
						}
						// If Xor goes down first, have him surrender and rely on the OnDeath event of the mooks to trigger the conversation once both of them are killed.
						else
							{
								// Checked by the OnDeath event of the mooks. See k_kas_xorthug_ud.
								UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
								
								// Turn off his AI.
								CP_DisableAI(TRUE);
								
								CP_ClearNPC(OBJECT_SELF);
								ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_NEUTRAL);
								DelayCommand(0.4, SurrenderToEnemies());
								DelayCommand(0.8, PlayAnimation(ANIMATION_LOOPING_LISTEN_INJURED, 1.0, -1.0));
							}
				}
		}
	else if (nUser == 1007) // DEATH
		{

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
}
