////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Heartbeat script for the turret mini-game sequence.
	
	Part of reordering the post-Taris escape sequence. Shows the Dantooine
	landing movie before the conversation with Bastila and Carth and swaps
	the Ebon Hawk's cockpit background from space to Dantooine, since it
	is heavily implied that it is taking place after having already landed.
	
	Taken from DP's "Taris Escape Sequence Adjustments" mod. Original script
	edits for the mod developed with the help of JC.
	
	DP 2019-04-28                                                           */
////////////////////////////////////////////////////////////////////////////////

// Prototypes
void sub6();
string sub5();
void sub4(string stringParam1);
void sub3(string stringParam1);
void sub2();
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub6() {
	StartNewModule("STUNT_35", "", "07_2", "", "", "", "", "");
}

string sub5() {
	int nGlobal = GetGlobalNumber("K_FUTURE_PLANET");
	if ((nGlobal == 15)) {
		return "05_2a";
	}
	else {
		if ((nGlobal == 20)) {
			return "05_4a";
		}
		else {
			if ((nGlobal == 25)) {
				return "05_5a";
			}
			else {
				if ((nGlobal == 30)) {
					return "05_7a";
				}
				else {
					if ((nGlobal == 35)) {
						return "05_3a";
					}
					else {
						if ((nGlobal == 40)) {
							return "NULL";
						}
						else {
							if ((nGlobal == 55)) {
								return "LIVE_1a";
							}
							else {
								if ((nGlobal == 60)) {
									return "LIVE_2a";
								}
								else {
									if ((nGlobal == 65)) {
										return "LIVE_3a";
									}
									else {
										if ((nGlobal == 70)) {
											return "LIVE_4a";
										}
										else {
											if ((nGlobal == 75)) {
												return "LIVE_5a";
											}
											else {
												if ((nGlobal == 80)) {
													return "LIVE_6a";
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	return "NULL";
}

void sub4(string stringParam1) {
	AurPostString(("RENDER/STUNT Debug ****************** " + stringParam1), 10, 10, 4.0);
}

void sub3(string stringParam1) {
	PrintString(("RENDER/STUNT Debug ****************** " + stringParam1));
}

void sub2() {
	sub3(" Start: ST_PlayPostTurret()");
	SetGlobalNumber("K_TURRET_SKYBOX", (-1));
	int nGlobal = GetGlobalNumber("K_STAR_MAP");
	int int3 = GetGlobalNumber("K_KOTOR_MASTER");
	int int5 = GetGlobalBoolean("K_HK47_SIMULATION");
	int int7 = GetGlobalBoolean("K_RANDOM_MINI_GAME");
	sub4(("Firing Play Post Turret " + IntToString(int5)));
	if ((int5 == 1)) {
		SetGlobalBoolean("K_HK47_SIMULATION", 0);
		StartNewModule("ebo_m12aa", "K_MINI_GAME", "", "", "", "", "", "");
	}
	else {
		if ((int7 == 1)) {
			SetGlobalBoolean("K_RANDOM_MINI_GAME", 0);
			StartNewModule("ebo_m12aa", "", "11b", sub5(), "", "", "", "");
			SetGlobalNumber("K_CURRENT_PLANET", GetGlobalNumber("K_FUTURE_PLANET"));
		}
		else {
			if (((nGlobal == 0) && (int3 == 10))) {
				SetGlobalBoolean("K_SPACE_SKYBOX_ON", FALSE);
				StartNewModule("ebo_m12aa", "K_TARIS_DESTROYED", "11b", "05_2a", "", "", "", "");
			}
			else {
				if (((nGlobal == 40) && (int3 == 20))) {
					StartNewModule("ebo_m40ad", "", "11b", "", "", "", "", "");
				}
				else {
					if (((nGlobal == 50) && (int3 == 40))) {
						sub6();
					}
				}
			}
		}
	}
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	int int1 = GetGlobalBoolean("ebo_turret_done");
	AurPostString("Heartbeat", 5, 11, 1.0);
	if (int1) {
		sub1("DelayCommand", 5, 12, 60.0);
		DelayCommand(1.0, sub2());
		DisableVideoEffect();
		int1 = 0;
		SetGlobalNumber("ebo_num_fighters", 0);
		SetGlobalBoolean("ebo_turret_done", 0);
	}
}

