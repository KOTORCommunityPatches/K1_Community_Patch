////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired at the start of each duel in tar_m02ae (Taris Upper City Cantina).
	
	This an added script that gives the player an animation acknowledging their
	introduction to the crowd by the announcer, just like their opponent has.
	
	Originally part of DP's "Taris Dueling Ring Adjustments" mod, slightly
	modified here, and itself originally derived from the vanilla k_ptar_duelwave.
	
	Issue #243
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/243
	
	DP 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	int nGlobal = GetGlobalNumber("tar_duel");
	object oPC = GetFirstPC();
	float fIntroTime;

	switch (nGlobal) {
		case 0:
			fIntroTime = 13.0; //Duncan fight intro
			break;
		case 1:
			fIntroTime = 13.0; //Gerlon fight intro (reuses Duncan's)
			break;
		case 2:
			fIntroTime = 8.5; //Ice fight intro
			break;
		case 3:
			fIntroTime = 10.0; //Marl fight intro
			break;
		case 4:
			fIntroTime = 6.5;  //Twitch fight intro
			break;
		case 6:
			fIntroTime = 9.0;  //Bendak fight intro
			break;
	}

	ActionPauseConversation();
	
	AssignCommand(oPC, ClearAllActions());
	DelayCommand(fIntroTime, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1, 0.5)));
	
	// 2019-09-28 Added an extended delay to ensure the animation plays
	// out fully before the scene cuts to the fight
	DelayCommand((fIntroTime + 2.67), ActionResumeConversation());
}
