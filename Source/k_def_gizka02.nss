//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for unk41_gizkap.utc/unk41_gizka002.utc in unk_m41aa (Lehon Central Beach).
	
	This is a UserDefine script for some of the Gizka hopping around the beach.
	It trigger's Bastila's DLG after having killed Mission and Zaalbar. It has
	been slightly altered to cancel combat and clear off all VFX (like activated
	energy shields) for all party members before the conversation starts.
	
	Updated 2021-11-27 to force Mission and Zaalbar's corpses to be permanent and
	non-selectable, to prevent any loot double dipping if the player exits the
	Hawk again. Necessitated a switch of checks for firing the post-death Bastila
	conversation, since they now remain valid objects.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_punk_carrun, k_punk_finale01, k_punk_finale02, k_punk_finale05, k_punk_finale06,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23 / DP 2021-11-27												*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void CP_ClearNPC(object oNPC) {
	CancelCombat(oNPC);
	AssignCommand(oNPC, ClearAllEffects());
	AssignCommand(oNPC, ClearAllActions());
}

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oCand = GetObjectByTag("cand", 0);
	object oHK = GetObjectByTag("HK47", 0);
	object oT3 = GetObjectByTag("T3M4", 0);
	object oMiss = GetObjectByTag("mission", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	object oInvis = GetObjectByTag("invish", 0);
	object oArea = GetArea(OBJECT_SELF);
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{
			// If on the DS route and chose to kill Mission and Zaalbar, make their corpses permanent.
			if (!GetLocalBoolean(oArea, 50) && !IsAvailableCreature(NPC_MISSION) && !IsAvailableCreature(NPC_ZAALBAR) && GetGlobalNumber("G_FinalChoice") == 1)
				{
					SetLocalBoolean(oArea, 50, TRUE);
					
					// Make Mission and Zaalbar's corpses permanent.
					AssignCommand(oMiss, SetIsDestroyable(FALSE, FALSE, FALSE));
					AssignCommand(oZaal, SetIsDestroyable(FALSE, FALSE, FALSE));
				}
			
			// Once Mission and Zaalbar are dead, run the Bastila conversation and transition to the Hawk.
			if (!GetLocalBoolean(oArea, 51) && !IsAvailableCreature(NPC_MISSION) && !IsAvailableCreature(NPC_ZAALBAR) && GetGlobalNumber("G_FinalChoice") == 1
			&& GetIsDead(oMiss) && GetIsDead(oZaal))
				{
					SetLocalBoolean(oArea, 51, TRUE);
					
					SetPartyLeader(NPC_PLAYER);
					
					CP_ClearNPC(oPC);
					CP_ClearNPC(oBast);
					CP_ClearNPC(oCand);
					CP_ClearNPC(oHK);
					CP_ClearNPC(oT3);
					
					NoClicksFor(1.0);
					
					DelayCommand(0.75, AssignCommand(oInvis, ActionStartConversation(oPC, "unk41_bastexit", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
				}
		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{
			UT_DoAmbientReaction("cs_gizkabeg");
		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

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
	else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase("wp_homebase");
		}
}
