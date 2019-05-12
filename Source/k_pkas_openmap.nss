////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_comp_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This is the script that fires at the end of the conversation with the
	Rakatan computer in the Lower Shadowlands. It has the Star Map placeable
	play the opening, map fragment, and closing animations. Because of the
	party interjections straight after the conversation with the computer
	ends, in the vanilla game the map usually closes before you regain
	control of the player again. Additionally, the map itself can get stuck
	in a mid-animation state due to being commanded to perform an animation
	while already in the middle of another. To alleviate both these issues,
	the time that the map stays open has been more or less doubled, but using
	a time that matches multiples of the base animation duration.

	DP 2019-05-13                                                             */
////////////////////////////////////////////////////////////////////////////////


// Prototypes
void sub6();
void sub5();
int sub4(int intParam1);
void sub3();
void sub2();
void sub1(int intParam1);

void sub6() {
	string sModule = GetModuleFileName();
	if ((sModule == "manm28ad")) {
		SetGlobalBoolean("K_STAR_MAP_MANAAN", 1);
		AddJournalQuestEntry("k_starforge", 40, 1);
	}
	else {
		if ((sModule == "korr_m39aa")) {
			SetGlobalBoolean("K_STAR_MAP_KORRIBAN", 1);
			AddJournalQuestEntry("k_starforge", 10, 1);
		}
		else {
			if ((sModule == "Kas_m25aa")) {
				SetGlobalBoolean("K_STAR_MAP_KASHYYYK", 1);
				AddJournalQuestEntry("k_starforge", 30, 1);
			}
			else {
				if ((sModule == "Tat_m18ac")) {
					SetGlobalBoolean("K_STAR_MAP_TATOOINE", 1);
					AddJournalQuestEntry("k_starforge", 20, 1);
				}
			}
		}
	}
	if ((GetGlobalNumber("K_STAR_MAP") == 50)) {
		AddJournalQuestEntry("k_starforge", 50, 1);
	}
}

void sub5() {
	int nGlobal = GetGlobalNumber("K_STAR_MAP");
	int int3 = GetGlobalNumber("K_SWG_BASTILA");
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, 10);
	if ((nLocalBool == 0)) {
		nGlobal = (nGlobal + 10);
		SetGlobalNumber("K_STAR_MAP", nGlobal);
		if ((nGlobal == 30)) {
			if ((int3 < 3)) {
				SetGlobalNumber("K_SWG_BASTILA", 99);
			}
		}
		else {
			if ((nGlobal == 40)) {
				SetGlobalNumber("K_CAPTURED_LEV", 5);
				if ((int3 < 5)) {
					SetGlobalNumber("K_SWG_BASTILA", 99);
				}
			}
			else {
				if ((nGlobal == 50)) {
					SetGlobalNumber("K_KOTOR_MASTER", 30);
				}
			}
		}
		SetLocalBoolean(OBJECT_SELF, 10, 1);
		sub6();
	}
}

int sub4(int intParam1) {
	if ((intParam1 == 0)) {
		return ANIMATION_PLACEABLE_ANIMLOOP01;
	}
	else {
		if ((intParam1 == 10)) {
			return ANIMATION_PLACEABLE_ANIMLOOP02;
		}
		else {
			if ((intParam1 == 20)) {
				return ANIMATION_PLACEABLE_ANIMLOOP03;
			}
			else {
				if ((intParam1 == 30)) {
					return ANIMATION_PLACEABLE_ANIMLOOP04;
				}
				else {
					if ((intParam1 == 40)) {
						return ANIMATION_PLACEABLE_ANIMLOOP06;
					}
				}
			}
		}
	}
	return (-1);
}

void sub3() {
	int nGlobal = GetGlobalNumber("K_STAR_MAP");
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, 10);
	float float1 = 62.94;
	if ((nLocalBool == 0)) {
		ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE, 1.0, 0.0);
		ActionPlayAnimation(sub4(nGlobal), 1.0, 0.0);
		if ((nGlobal == 40)) {
			float1 = 93.34;
		}
		DelayCommand(float1, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE, 1.0, 0.0));
	}
}

void sub2() {
	sub3();
	sub5();
}

void sub1(int intParam1) {
	if (((intParam1 == 1) || (intParam1 == 0))) {
		SetGlobalBoolean("kas_StarMap", intParam1);
	}
	return;
}

void main() {
	object oKas25_starmap = GetObjectByTag("kas25_starmap", 0);
	SetGlobalBoolean("kas_ComputerDown", 1);
	sub1(1);
	CreateItemOnObject("kas_starpad", GetFirstPC(), 1);
	AssignCommand(oKas25_starmap, PlaySound("pl_starmap_open"));
	AssignCommand(oKas25_starmap, sub2());
	ActionPauseConversation();
	DelayCommand(14.0, ActionResumeConversation());
}