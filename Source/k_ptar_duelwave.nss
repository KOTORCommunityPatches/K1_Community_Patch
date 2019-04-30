////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired at the start of each duel in tar_m02ae (Taris Upper City Cantina).
	
	This script gives the duel opponent an animation acknowledging their
	introduction to the crowd by the announcer. Adjusted to tweak the delay
	times in order to properly sync the animation with the VO.
	
	Originally part of DP's "Taris Dueling Arena Adjustment" mod.
	
	DP 2019-04-30                                                             */
////////////////////////////////////////////////////////////////////////////////

// Globals
	int intGLOB_1 = 0;
	int intGLOB_2 = 1;
	int intGLOB_3 = 2;
	int intGLOB_4 = 3;
	int intGLOB_5 = 4;
	int intGLOB_6 = 5;
	int intGLOB_7 = 6;
	int intGLOB_8 = 7;
	int intGLOB_9 = 8;
	int intGLOB_10 = 9;
	int intGLOB_11 = 10;
	int intGLOB_12 = 11;
	int intGLOB_13 = 12;
	int intGLOB_14 = 13;
	int intGLOB_15 = 14;
	int intGLOB_16 = 15;
	int intGLOB_17 = 16;
	int intGLOB_18 = 17;
	int intGLOB_19 = 18;
	int intGLOB_20 = 19;
	int intGLOB_21 = 1100;
	int intGLOB_22 = (-6);
	int intGLOB_23 = (-5);
	int intGLOB_24 = (-4);
	int intGLOB_25 = (-2);
	int intGLOB_26 = (-1);
	int intGLOB_27 = 0;

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