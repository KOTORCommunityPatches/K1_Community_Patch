////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired at the start of each duel in tar_m02ae (Taris Upper City Cantina).
	
	This script gives the duel opponent an animation acknowledging their
	introduction to the crowd by the announcer. Adjusted to tweak the delay
	times in order to properly sync the animation with the VO.
	
	Originally part of DP's "Taris Dueling Arena Adjustment" mod.
	
	Issue #76: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/76
	
	DP 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oOpponent;
	int nGlobal = GetGlobalNumber("tar_duel");
	object oPC = GetFirstPC();
	float fIntroTime;
	
	switch (nGlobal) {
		case 0:
			oOpponent = GetObjectByTag("deadeyedun021", 0);
			fIntroTime = 9.0;
			break;
		case 1:
			oOpponent = GetObjectByTag("gerlontwof021", 0);
			fIntroTime = 9.5;
			break;
		case 2:
			oOpponent = GetObjectByTag("ice021", 0);
			fIntroTime = 13.0;
			break;
		case 3:
			oOpponent = GetObjectByTag("marl021", 0);
			fIntroTime = 9.0;
			break;
		case 4:
			oOpponent = GetObjectByTag("twitch021", 0);
			fIntroTime = 15.0;
			break;
		case 6:
			sub1("BENDAK MAD", 5, 5, 1.0);
			oOpponent = GetObjectByTag("Bendakstar021", 0);
			fIntroTime = 17.0;
			break;
	}

	AssignCommand(oOpponent, ClearAllActions());
	DelayCommand(fIntroTime, AssignCommand(oOpponent, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 0.5, 0.0)));
	ActionPauseConversation();
	ActionWait(fIntroTime);
	ActionResumeConversation();
}
