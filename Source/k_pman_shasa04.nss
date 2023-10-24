//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_shasa.dlg in manm27aa (Manaan Sith Base).
	
	This script fires just before the end of the LS branch of the conversation
	with Shasa and her fellow Selkath Sith apprentices. The vanilla script had
	Shasa leave, with the other Selkath having left on an earlier node. That
	didn't make any sense however, since the line that this script fires on has
	Shasa directly tell them to leave. The other script (k_pman_shasa20) has been
	removed from the previous node and all the Selkath now leave on this node.
	The functionality of the other script has been incorporated and the timings
	have been altered to suit.
	
	See also cp_man27aa_shajp, k_pman_shasa10.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2023-10-24																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_SelkLeave() {
	object oWP = GetObjectByTag("man27_wp_selleave", 0);
	object oSelk;
	int nCnt = 1;
	float fDelay = 0.0;
	
	while (nCnt <= 3)
		{
			oSelk = GetObjectByTag("man27_seljed" + IntToString(nCnt), 0);
			
			DelayCommand(fDelay, AssignCommand(oSelk, ActionMoveToObject(oWP, TRUE)));
			fDelay = fDelay + IntToFloat(nCnt);
			nCnt++;
		}
}

void main() {
	
	SetGlobalNumber("MAN_MISSING_PLOT", 3);
	
	ActionPauseConversation();
	
	NoClicksFor(12.0);
	
	DelayCommand(3.0, CP_SelkLeave());
	
	DelayCommand(7.0, ActionMoveToObject(GetObjectByTag("man27_wp_selleave", 0), TRUE));
	
	DelayCommand(8.0, SetGlobalFadeOut(0.0, 1.0));
	
	DelayCommand(9.0, ActionResumeConversation());
	
	DelayCommand(12.0, SetGlobalFadeIn(0.0, 1.0));
}
