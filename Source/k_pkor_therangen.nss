////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor37_therangen.utp in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This script fires when you add a grenade/mine to the Therangen Obelisk
	blocking the bridge in the Tomb of Ajunta Pall. There are a number of
	issues that can occur during this sequence, including the AI of party
	members being permanently disabled. Some minor tweaks have been made to
	the various scene elements to try and prevent this, notably by forcibly
	preventing clicking through the scene.
	
	See also k_pkor_droidhost, k_pkor_actdroid1, and k_pkor_ther_blow.
	
	Issue #164: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/164
	
	DP 2019-07-11                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int GrenadeCheck() {
	
	object oItem = GetInventoryDisturbItem();
	string sItemTag = GetTag(oItem);
	
	if (((((((((((((((((((sItemTag == "G_w_StunGren01") ||
	(sItemTag == "g_w_adhsvgren001")) ||
	(sItemTag == "g_w_fraggren01")) ||
	(sItemTag == "G_w_SonicGren01")) ||
	(sItemTag == "G_w_ThermlDet01")) ||
	(sItemTag == "G_W_FIREGREN001")) ||
	(sItemTag == "G_I_TRAPKIT002")) ||
	(sItemTag == "G_I_TRAPKIT005")) ||
	(sItemTag == "G_I_TRAPKIT011")) ||
	(sItemTag == "G_I_TRAPKIT008")) ||
	(sItemTag == "G_I_TRAPKIT003")) ||
	(sItemTag == "G_I_TRAPKIT006")) ||
	(sItemTag == "G_I_TRAPKIT012")) ||
	(sItemTag == "G_I_TRAPKIT009")) ||
	(sItemTag == "G_I_TRAPKIT001")) ||
	(sItemTag == "G_I_TRAPKIT004")) ||
	(sItemTag == "G_I_TRAPKIT010")) ||
	(sItemTag == "G_I_TRAPKIT007")))
		{
			return TRUE;
		}
	else
		{
			return FALSE;
		}
}

void main() {
	
	object oInvItem = GetInventoryDisturbItem();
	
	if (((GetInventoryDisturbType() == INVENTORY_DISTURB_TYPE_ADDED) && GrenadeCheck()))
		{
			//ChangeFactionByFaction(STANDARD_FACTION_HOSTILE_1, STANDARD_FACTION_NEUTRAL);
			
			DestroyObject(oInvItem);
			
			PauseGame(FALSE);
			
			NoClicksFor(5.0);
			
			UT_NPC_InitConversation("kor37_firescene");
		}
}
