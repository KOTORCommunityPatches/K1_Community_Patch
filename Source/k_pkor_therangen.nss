//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor37_therangen.utp in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This script fires when you add a grenade/mine to the Therangen Obelisk
	blocking the bridge in the Tomb of Ajunta Pall. There are a number of
	issues that can occur during this sequence, including the AI of party
	members being permanently disabled. Some minor tweaks have been made to
	the various scene elements to try and prevent this, notably by forcibly
	preventing clicking through the scene.
	
	Updated - The droids on the bridge were discovered to have an issue where
	the player using Critical Strike attacks against the Tuk'ata would "wake"
	them up prematurely. To counteract that, their AI is now disabled in their
	OnSpawn script. Thus it is turned back on here just before the cutscene
	starts.
	
	See also k_pkor_droidhost, k_pkor_actdroid1, and k_pkor_ther_blow.
	
	Issue #164: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/164
	
	Issue #431: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/431
	
	See also k_pkor_droidhost, k_pkor_actdroid1, k_pkor_spndrdhrt, and k_pkor_ther_blow.
	
	DP 2019-07-11 / DP 2020-09-10												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int GrenadeCheck() {
	
	object oItem = GetInventoryDisturbItem();
	string sItemTag = GetTag(oItem);
	
	if (sItemTag == "G_w_StunGren01" ||
		sItemTag == "g_w_adhsvgren001" ||
		sItemTag == "g_w_fraggren01" ||
		sItemTag == "G_w_SonicGren01" ||
		sItemTag == "G_w_ThermlDet01" ||
		sItemTag == "G_W_FIREGREN001" ||
		sItemTag == "G_I_TRAPKIT002" ||
		sItemTag == "G_I_TRAPKIT005" ||
		sItemTag == "G_I_TRAPKIT011" ||
		sItemTag == "G_I_TRAPKIT008" ||
		sItemTag == "G_I_TRAPKIT003" ||
		sItemTag == "G_I_TRAPKIT006" ||
		sItemTag == "G_I_TRAPKIT012" ||
		sItemTag == "G_I_TRAPKIT009" ||
		sItemTag == "G_I_TRAPKIT001" ||
		sItemTag == "G_I_TRAPKIT004" ||
		sItemTag == "G_I_TRAPKIT010" ||
		sItemTag == "G_I_TRAPKIT007")
			{
				return TRUE;
			}
			else
				{
					return FALSE;
				}
}

void main() {
	
	object oDroid1 = GetObjectByTag("kor37_bridge1", 0);
	object oDroid2 = GetObjectByTag("kor37_bridge2", 0);
	object oDroid3 = GetObjectByTag("kor37_bridge3", 0);
	object oDroid4 = GetObjectByTag("kor37_bridge4", 0);
	object oInvItem = GetInventoryDisturbItem();
	
	if (GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED && GrenadeCheck())
		{
			DestroyObject(oInvItem);
			
			PauseGame(FALSE);
			
			NoClicksFor(5.0);
			
			AssignCommand(oDroid1, CP_DisableAI(FALSE));
			AssignCommand(oDroid2, CP_DisableAI(FALSE));
			AssignCommand(oDroid3, CP_DisableAI(FALSE));
			AssignCommand(oDroid4, CP_DisableAI(FALSE));
			
			AssignCommand(GetObjectByTag("kor37_firescene"), ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
		}
}
