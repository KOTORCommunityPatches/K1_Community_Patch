////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor37_firescene.dlg in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This script fires on the final node of the scene where the Therangen Obelisk
	blocking the bridge in the Tomb of Ajunta Pall is blown up. A number of
	issues can occur during this scene, including the AI of party members being
	permanently disabled. Some minor tweaks have been made to the scene elements
	to try and prevent this, notably by forcibly preventing clicking through the
	scene. Additionally, this script also had a redundant command to turn the
	droids hostile, even though they were already turned hostile in their unique
	scripts on previous nodes, so that has been removed.
	
	See also k_pkor_therangen, k_pkor_actdroid1, and k_pkor_ther_blow.
	
	Issue #164: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/164
	
	DP 2019-07-11                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void AIToggle(int nIndex, int nState) {
	SetLocalBoolean(OBJECT_SELF, nIndex, nState);
}

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oDroid1 = GetObjectByTag("kor37_bridge1", 0);
	object oDroid2 = GetObjectByTag("kor37_bridge2", 0);
	object oDroid3 = GetObjectByTag("kor37_bridge3", 0);
	object oDroid4 = GetObjectByTag("kor37_bridge4", 0);
	
	NoClicksFor(0.6);
	
	ActionPauseConversation();
	
	AssignCommand(oPM1, AIToggle(SW_FLAG_AI_OFF, FALSE));
	AssignCommand(oPM2, AIToggle(SW_FLAG_AI_OFF, FALSE));
	
	//ChangeFactionByFaction(STANDARD_FACTION_NEUTRAL, STANDARD_FACTION_HOSTILE_1);
	
	DelayCommand(0.5, ActionResumeConversation());
	
	DelayCommand(0.5, AssignCommand(oDroid1, ActionAttack(oPC)));
	DelayCommand(0.5, AssignCommand(oDroid2, ActionAttack(oPC)));
	DelayCommand(0.5, AssignCommand(oDroid3, ActionAttack(oPC)));
	DelayCommand(0.5, AssignCommand(oDroid4, ActionAttack(oPC)));
}
