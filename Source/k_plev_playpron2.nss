////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script fires at the start of the cutscene resumption once all enemies
	on the bridge are defeated. It jumps the party and Saul into position. Due
	to a combination of the changes to the scene, there was an issue causing the
	player to freeze during all of their replies for this second half of the
	conversation, seemingly due to the way combat ends. Forcibly cancelling
	combat seems to cure it. Additionally, the vanilla version of this script
	was something of a mess, for some reason jumping everyone twice within the
	space of half a second or so. That has been cleaned up.
	
	See also cp_lev_crthfacwt, k_plev_journal, k_plev_killsaul.
	
	Issue #131: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/131
	
	DP 2019-09-29                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oSaul = GetObjectByTag("saulkarath402", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oBastila = GetObjectByTag("bastila", 0);
	object oPC = GetFirstPC();
	location lSaul = GetLocation(GetObjectByTag("lev_saulend_wp", 0));
	location lPC = GetLocation(GetObjectByTag("lev_saulend_wp_pc", 0));
	location lCarth = GetLocation(GetObjectByTag("lev_saulend_wp_carth", 0));
	location lBast = GetLocation(GetObjectByTag("lev_saulend_wp_bast", 0));
	
	NoClicksFor(2.5);
	
	ActionPauseConversation();
	
	// The player could be frozen during the conversation, seemingly due to how
	// combat ends abruptly, so make sure they are cancelled out of that.
	CancelCombat(oPC);
	
	SetPartyLeader(NPC_PLAYER);
	RemovePartyMember(NPC_CARTH);
	RemovePartyMember(NPC_BASTILA);
	
	SetGlobalBoolean("LEV_SAULDEAD", TRUE);
	
	DelayCommand(0.2, CP_PartyJump(oBastila, lBast));
	DelayCommand(0.3, CP_PartyJump(oPC, lPC));
	DelayCommand(0.4, CP_PartyJump(oCarth, lCarth));
	DelayCommand(0.5, CP_PartyJump(oSaul, lSaul));
	
	SetLockOrientationInDialog(oSaul, TRUE);
	DelayCommand(1.0, AssignCommand(oSaul, PlayAnimation(ANIMATION_LOOPING_PRONE, 1.0, -1.0)));
	
	DelayCommand(2.5, ActionResumeConversation());
}
