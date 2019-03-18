////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor37_shaardan.dlg in korr_m37aa (Tomb of Ajunta Pall).
	
	The vanilla script for Shaardan turning hostile. See k37_sha_hostile.nss
	for more details.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

struct structtype1 {
	int int1;
	int int3;
	int int5;
	object object1;
	int int7;
	int int9;
	int int11;
	int int13;
	int int15;
	int int17;
};

// Globals
	int intGLOB_1 = 1;
	int intGLOB_2 = 2;
	int intGLOB_3 = 3;
	int intGLOB_4 = 4;
	int intGLOB_5 = 5;
	int intGLOB_6 = 6;
	int intGLOB_7 = 3;
	int intGLOB_8 = 4;
	int intGLOB_9 = 5;
	int intGLOB_10 = 6;
	int intGLOB_11 = 7;
	int intGLOB_12 = 1;
	int intGLOB_13 = 2;
	int intGLOB_14 = 3;
	int intGLOB_15 = 4;
	int intGLOB_16 = 5;
	int intGLOB_17 = 6;
	int intGLOB_18 = 7;
	int intGLOB_19 = 8;
	int intGLOB_20 = 9;
	int intGLOB_21 = 10;
	int intGLOB_22 = 11;
	int intGLOB_23 = 12;
	int intGLOB_24 = 13;
	int intGLOB_25 = 14;
	int intGLOB_26 = 15;
	int intGLOB_27 = 16;
	int intGLOB_28 = 17;
	int intGLOB_29 = 18;
	int intGLOB_30 = 19;
	int intGLOB_31 = 20;
	int intGLOB_32 = 21;
	int intGLOB_33 = 22;
	int intGLOB_34 = 23;
	int intGLOB_35 = 24;
	int intGLOB_36 = 25;
	int intGLOB_37 = 26;
	int intGLOB_38 = 27;
	int intGLOB_39 = 28;
	int intGLOB_40 = 29;
	int intGLOB_41 = 30;
	int intGLOB_42 = 59;
	int intGLOB_43 = 0;
	int intGLOB_44 = 1;
	int intGLOB_45 = 2;
	int intGLOB_46 = 29;
	int intGLOB_47 = 30;
	int intGLOB_48 = 34;
	int intGLOB_49 = 35;
	int intGLOB_50 = 36;
	int intGLOB_51 = 37;
	int intGLOB_52 = 38;
	int intGLOB_53 = 39;
	int intGLOB_54 = 41;
	int intGLOB_55 = 42;
	int intGLOB_56 = 46;
	int intGLOB_57 = 47;
	int intGLOB_58 = 15;
	int intGLOB_59 = 10;
	int intGLOB_60 = 5;
	int intGLOB_61 = 2;
	struct structtype1 structGLOB_1;
	int intGLOB_71 = 1;
	int intGLOB_72 = 2;
	int intGLOB_73 = 3;
	int intGLOB_74 = 20;
	int intGLOB_75 = 21;
	int intGLOB_76 = 22;
	int intGLOB_77 = 23;
	int intGLOB_78 = 24;
	int intGLOB_79 = 25;
	int intGLOB_80 = 26;
	int intGLOB_81 = 27;
	int intGLOB_82 = 28;
	int intGLOB_83 = 31;
	int intGLOB_84 = 32;
	int intGLOB_85 = 33;
	int intGLOB_86 = 40;
	int intGLOB_87 = 43;
	int intGLOB_88 = 44;
	int intGLOB_89 = 45;
	int intGLOB_90 = 48;
	int intGLOB_91 = 49;
	int intGLOB_92 = 50;
	int intGLOB_93 = 51;
	int intGLOB_94 = 52;
	int intGLOB_95 = 53;
	int intGLOB_96 = 54;
	int intGLOB_97 = 55;
	int intGLOB_98 = 56;
	int intGLOB_99 = 57;
	int intGLOB_100 = 58;
	int intGLOB_101 = 60;
	int intGLOB_102 = 61;
	int intGLOB_103 = 62;
	int intGLOB_104 = 63;
	int intGLOB_105 = 64;
	int intGLOB_106 = 65;
	int intGLOB_107 = 66;
	int intGLOB_108 = 67;
	int intGLOB_109 = 68;
	int intGLOB_110 = 69;
	int intGLOB_111 = 70;
	int intGLOB_112 = 71;
	int intGLOB_113 = 72;
	int intGLOB_114 = 1;
	int intGLOB_115 = 2;
	int intGLOB_116 = 3;
	int intGLOB_117 = 4;
	int intGLOB_118 = 0;
	int intGLOB_119 = 1;
	int intGLOB_120 = 2;
	int intGLOB_121 = 3;
	int intGLOB_122 = 4;
	int intGLOB_123 = 5;
	int intGLOB_124 = 6;
	int intGLOB_125 = 7;
	int intGLOB_126 = 8;
	int intGLOB_127 = 9;
	int intGLOB_128 = 10;
	int intGLOB_129 = 11;
	int intGLOB_130 = 12;
	int intGLOB_131 = 13;
	int intGLOB_132 = 14;
	int intGLOB_133 = 15;
	int intGLOB_134 = 16;
	int intGLOB_135 = 17;
	int intGLOB_136 = 18;
	int intGLOB_137 = 19;
	int intGLOB_138 = 1100;
	int intGLOB_139 = (-6);
	int intGLOB_140 = (-5);
	int intGLOB_141 = (-4);
	int intGLOB_142 = (-2);
	int intGLOB_143 = (-1);
	int intGLOB_144 = 0;
	int intGLOB_145 = 24;

// Prototypes
void sub80(int intParam1);
void sub79(string stringParam1, int intParam2, int intParam3, float floatParam4);
void sub78();
int sub77(int intParam1, int intParam2);
void sub76();
void sub75(string stringParam1);
int sub74(object objectParam1);
void sub73();
int sub72();
int sub71();
object sub70(object objectParam1);
int sub69(object objectParam1);
int sub68(object objectParam1);
talent sub67(object objectParam1, talent talentParam2);
int sub66(int intParam1);
int sub65(int intParam1);
int sub64();
int sub63();
int sub62();
int sub61();
int sub60();
int sub59();
int sub58();
int sub57();
int sub56();
int sub55();
int sub54();
int sub53();
int sub52();
talent sub51(int intParam1);
string sub50(int intParam1);
int sub49();
int sub48();
int sub47();
int sub46();
int sub45();
int sub44();
int sub43();
int sub42();
int sub41();
int sub40();
int sub39();
int sub38();
int sub37();
int sub36(int intParam1);
int sub35(int intParam1);
talent sub34(int intParam1);
object sub33();
int sub32(object objectParam1);
talent sub31(object objectParam1, talent talentParam2);
talent sub30(object objectParam1, talent talentParam2);
int sub29();
object sub28();
int sub27();
talent sub26(int intParam1);
talent sub25(int intParam1);
talent sub24(int intParam1);
talent sub23(int intParam1, int intParam2);
int sub22(object objectParam1, float floatParam2);
int sub21(object objectParam1, float floatParam2);
object sub20();
int sub19();
int sub18(object objectParam1);
int sub17();
object sub16(int intParam1);
int sub15(int intParam1, object objectParam2);
object sub14();
int sub13(object objectParam1);
int sub12();
int sub11();
void sub10(int intParam1, int intParam2);
string sub9(int intParam1);
int sub8();
int sub7(int intParam1);
string sub6(object objectParam1);
void sub5();
string sub4(object objectParam1);
void sub3(string stringParam1);
void sub2(object objectParam1);
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub80(int intParam1) {
	SetGlobalNumber("KOR33_SHAARDAN", intParam1);
}

void sub79(string stringParam1, int intParam2, int intParam3, float floatParam4) {
}

void sub78() {
	int nRandom = d8(1);
	if ((nRandom == 1)) {
		ActionPlayAnimation(103, 1.0, 0.0);
	}
	else {
		if ((nRandom == 2)) {
			ActionPlayAnimation(102, 1.0, 0.0);
		}
		else {
			if ((nRandom == 3)) {
				ActionPlayAnimation(1, 1.0, 3.0);
			}
			else {
				if ((((nRandom == 4) || (nRandom == 5)) && (GetRacialType(OBJECT_SELF) != 5))) {
					if ((GetGender(OBJECT_SELF) == 0)) {
						sub10(intGLOB_46, 0);
						ActionPlayAnimation(24, 1.0, 20.4);
						ActionDoCommand(sub10(intGLOB_46, 1));
					}
					else {
						if ((GetGender(OBJECT_SELF) == 1)) {
							sub10(intGLOB_46, 0);
							ActionPlayAnimation(24, 1.0, 13.3);
							ActionDoCommand(sub10(intGLOB_46, 1));
						}
					}
				}
				else {
					if ((((nRandom == 6) || (nRandom == 4)) || (nRandom == 5))) {
						ActionPlayAnimation(100, 1.0, 0.0);
					}
					else {
						if ((nRandom == 7)) {
							ActionPlayAnimation(101, 1.0, 0.0);
						}
						else {
							if ((nRandom == 8)) {
								sub10(intGLOB_46, 0);
								ActionPlayAnimation(1, 1.0, 5.0);
								ActionDoCommand(sub10(intGLOB_46, 1));
							}
						}
					}
				}
			}
		}
	}
}

int sub77(int intParam1, int intParam2) {
	int int1;
	int int2 = sub7(intGLOB_54);
	if (((intParam1 == intParam2) && (int2 == 0))) {
		int1 = (-1);
		sub10(intGLOB_54, 1);
	}
	else {
		if (((intParam2 == 1) && (int2 == 1))) {
			int1 = 1;
			sub10(intGLOB_54, 0);
		}
		else {
			if ((int2 == 0)) {
				int1 = 1;
			}
			else {
				if ((int2 == 1)) {
					int1 = (-1);
				}
			}
		}
	}
	return int1;
}

void sub76() {
	if ((!sub7(intGLOB_55))) {
		string string1 = "POST_";
		string string2 = "WP_";
		string string3;
		int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_43);
		int int4 = GetLocalNumber(OBJECT_SELF, intGLOB_44);
		int int6 = GetLocalNumber(OBJECT_SELF, intGLOB_45);
		if (((nLocal < 10) && (nLocal > 0))) {
			string3 = ("0" + IntToString(nLocal));
		}
		else {
			if ((nLocal == 0)) {
				if (sub7(intGLOB_52)) {
					nLocal = (Random(int4) + 1);
					if ((nLocal < 10)) {
						string3 = ("0" + IntToString(nLocal));
					}
					else {
						string3 = IntToString(nLocal);
					}
				}
				else {
					string3 = "01";
				}
			}
			else {
				if ((nLocal < 10)) {
					string3 = ("0" + IntToString(nLocal));
				}
				else {
					string3 = IntToString(nLocal);
				}
			}
		}
		string string9;
		string string10;
		if ((int6 > 0)) {
			string string11;
			if ((int6 < 10)) {
				string11 = ("0" + IntToString(int6));
			}
			else {
				string11 = IntToString(int6);
			}
			string10 = ((string2 + string11) + "_02");
		}
		else {
			string10 = ((string2 + GetTag(OBJECT_SELF)) + "_02");
		}
		object oWP = GetWaypointByTag(string10);
		if (((int4 == 0) && GetIsObjectValid(oWP))) {
		}
		if (GetIsObjectValid(oWP)) {
			int nLen = GetStringLength(string10);
			string9 = (GetStringLeft(string10, (nLen - 2)) + string3);
		}
		else {
			string2 = "UNKNOWN";
			string9 = (string1 + GetTag(OBJECT_SELF));
		}
		object object3 = GetWaypointByTag(string9);
		int int14 = sub7(intGLOB_53);
		if ((GetDistanceToObject2D(object3) <= 2.5)) {
			int int16;
			if (sub7(intGLOB_52)) {
				nLocal = (Random(int4) + 1);
			}
			else {
				if (((nLocal < int4) && (!sub7(intGLOB_52)))) {
					int16 = sub77(int4, nLocal);
					nLocal = (nLocal + int16);
				}
				else {
					if ((nLocal == int4)) {
						int16 = sub77(int4, nLocal);
						if (sub7(intGLOB_48)) {
							sub10(intGLOB_55, 1);
						}
						else {
							if (sub7(intGLOB_49)) {
								nLocal = 1;
								sub10(intGLOB_54, 0);
							}
							else {
								nLocal = (nLocal + int16);
							}
						}
					}
				}
			}
		}
		if (GetIsObjectValid(GetWaypointByTag(string9))) {
			int nRandom;
			if (sub7(intGLOB_51)) {
				nRandom = d3(1);
			}
			else {
				if (sub7(intGLOB_56)) {
					nRandom = (d6(1) + 6);
				}
				else {
					if (sub7(intGLOB_57)) {
						nRandom = d12(1);
					}
					else {
						if ((nRandom > 0)) {
							ActionWait(IntToFloat(nRandom));
						}
					}
				}
			}
			object3 = GetWaypointByTag(string9);
			float float3 = (GetDistanceBetween2D(GetWaypointByTag(string9), OBJECT_SELF) / 1.25);
			if ((float3 < 30.0)) {
				float3 = 30.0;
			}
			ActionForceMoveToObject(object3, sub7(intGLOB_53), 2.5, float3);
			if (sub7(intGLOB_46)) {
				ActionDoCommand(sub78());
			}
			SetLocalNumber(OBJECT_SELF, intGLOB_43, nLocal);
			if ((string2 != "UNKNOWN")) {
				ActionDoCommand(sub76());
			}
		}
	}
}

void sub75(string stringParam1) {
	if ((!ShipBuild())) {
		PrintString(stringParam1);
	}
}

int sub74(object objectParam1) {
	string string1 = (("WP_" + GetTag(objectParam1)) + "_01");
	string string3 = ("POST_" + GetTag(objectParam1));
	int nLocal = GetLocalNumber(objectParam1, intGLOB_45);
	string string5;
	if ((nLocal < 10)) {
		string5 = ("0" + IntToString(nLocal));
	}
	else {
		string5 = IntToString(nLocal);
	}
	string string8 = (("WP_" + string5) + "_01");
	object oWP = GetWaypointByTag(string1);
	object object3 = GetWaypointByTag(string8);
	object object5 = GetWaypointByTag(string3);
	sub75(("Walk Initiate for " + GetTag(objectParam1)));
	sub75(("TAG WAY FOUND = " + IntToString(GetIsObjectValid(oWP))));
	sub75(("WAY POINT NAME = " + GetTag(oWP)));
	sub75(("SERIES INT = " + IntToString(nLocal)));
	sub75(("SERIES WAY FOUND = " + IntToString(GetIsObjectValid(object3))));
	sub75(("SERIES Series Tag = " + string8));
	sub75("");
	if (((GetIsObjectValid(oWP) || GetIsObjectValid(object3)) || GetIsObjectValid(object5))) {
		return 1;
	}
	return 0;
}

void sub73() {
	int int1 = sub71();
}

int sub72() {
	sub3("GENERIC DEBUG *************** Start Commoner AI");
	object oNearest = GetNearestCreature(3, 1, OBJECT_SELF, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	object object3;
	int int1 = 1;
	int int2 = 1;
	object object4 = GetNearestCreature(3, 2, OBJECT_SELF, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
	while ((GetIsObjectValid(object4) && (int1 == 1))) {
		if ((((GetStandardFaction(object4) == 1) || (GetStandardFaction(object4) == 3)) || (GetStandardFaction(object4) == 6))) {
			if ((GetDistanceBetween(OBJECT_SELF, object4) <= 20.0)) {
				object3 = object4;
				int1 = 0;
			}
		}
		else {
			(int2++);
			object4 = GetNearestCreature(3, 2, OBJECT_SELF, int2, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
		}
	}
	if (GetIsObjectValid(oNearest)) {
		sub3("GENERIC DEBUG *************** Clear 2710");
		ClearAllActions();
		ActionMoveAwayFromObject(oNearest, 1, 20.0);
		DelayCommand(0.2, ActionDoCommand(sub73()));
		return 1;
	}
	else {
		if (GetIsObjectValid(object3)) {
			sub3(("GENERIC DEBUG *************** Object Flee = " + sub4(object3)));
			sub3("GENERIC DEBUG *************** Clear 2720");
			ClearAllActions();
			ActionMoveAwayFromObject(object3, 1, 20.0);
			DelayCommand(0.2, ActionDoCommand(sub73()));
			return 1;
		}
	}
	return 0;
}

int sub71() {
	sub3(("GENERIC DEBUG *************** Post DCR Checks for " + sub4(OBJECT_SELF)));
	if ((sub7(intGLOB_101) && (!sub7(intGLOB_102)))) {
		if (sub72()) {
			return 1;
		}
	}
	else {
		if (sub7(intGLOB_102)) {
			sub3("GENERIC DEBUG *************** Clear 1000");
			ClearAllActions();
			return 1;
		}
	}
	if (((!IsObjectPartyMember(OBJECT_SELF)) && (sub74(OBJECT_SELF) == 1))) {
		sub3("GENERIC DEBUG *************** Clear 1100");
		ClearAllActions();
		DelayCommand(1.0, sub76());
		return 1;
	}
	else {
		if ((((GetPartyMemberByIndex(0) != OBJECT_SELF) && (!GetIsObjectValid(GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF)))) && IsObjectPartyMember(OBJECT_SELF))) {
			if ((!GetSoloMode())) {
				sub79("NO TARGET: FOLLOW LEADER", 10, 10, 4.0);
				CancelCombat(OBJECT_SELF);
				sub3("GENERIC DEBUG *************** Clear 1200");
				ClearAllActions();
				ActionFollowLeader();
			}
			return 1;
		}
	}
	return 0;
}

object sub70(object objectParam1) {
	sub3("GENERIC DEBUG *************** Starting: Determine Attack Target");
	int nStyle = GetPartyAIStyle();
	int nNPCStyle = GetNPCAIStyle(OBJECT_SELF);
	object object1;
	object oLastTarget = GetLastHostileTarget(OBJECT_SELF);
	sub3(((("GENERIC DEBUG *************** Intruder = " + IntToString(GetIsObjectValid(objectParam1))) + " Last Target = ") + IntToString(GetIsObjectValid(oLastTarget))));
	if (((GetIsObjectValid(objectParam1) && (!GetIsDead(objectParam1))) && (!GetIsDebilitated(objectParam1)))) {
		sub3(("GENERIC DEBUG *************** Intruder Target Returned = " + ObjectToString(objectParam1)));
		return objectParam1;
	}
	else {
		if (((GetIsObjectValid(oLastTarget) && (!GetIsDead(oLastTarget))) && (!GetIsDebilitated(oLastTarget)))) {
			sub3(("GENERIC DEBUG *************** Last Target Returned = " + ObjectToString(objectParam1)));
			return oLastTarget;
		}
		else {
			if ((nStyle == 0)) {
				int int13 = 1;
				sub3("GENERIC DEBUG *************** Getting nearest target - 249");
				object oNearest = GetNearestCreature(3, 1, OBJECT_SELF, int13, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
				object1 = oNearest;
				while (((!GetIsDebilitated(object1)) && GetIsObjectValid(object1))) {
					(int13++);
					object1 = GetNearestCreature(3, 1, OBJECT_SELF, int13, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
				}
				if (((!GetIsObjectValid(object1)) && GetIsObjectValid(oNearest))) {
					object1 = oNearest;
				}
			}
			else {
				if ((nStyle == 1)) {
					int int18 = 0;
					object oLastActor;
					while (((!GetIsObjectValid(oLastActor)) && (int18 < 3))) {
						oLastActor = GetLastHostileActor(GetPartyMemberByIndex(int18));
						(int18++);
					}
					if (GetIsObjectValid(oLastActor)) {
						sub3("GENERIC DEBUG *************** Getting nearest target - 262");
						object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
					}
					else {
						oLastActor = GetLastHostileTarget(GetPartyMemberByIndex(0));
						if (GetIsObjectValid(oLastActor)) {
							sub3("GENERIC DEBUG *************** Getting nearest target - 269");
							object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
						}
					}
				}
				else {
					if ((nStyle != 2)) {
						sub3("GENERIC DEBUG *************** Getting nearest target - 275");
						object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
					}
					else {
						sub3("GENERIC DEBUG *************** Getting nearest target - 279");
						object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
					}
				}
			}
		}
	}
	if (GetIsObjectValid(object1)) {
		sub3(("GENERIC DEBUG *************** Attack Target From Determine Attack Target = " + sub4(object1)));
		return object1;
	}
	sub3("GENERIC DEBUG *************** No Attack Targets Found");
	return OBJECT_INVALID;
}

int sub69(object objectParam1) {
	object object1 = sub33();
	talent talent1;
	object object3;
	if ((GetRacialType(OBJECT_SELF) == 5)) {
		return sub32(OBJECT_INVALID);
	}
	if (sub15(intGLOB_117, OBJECT_SELF)) {
		return 1;
	}
	if (GetIsObjectValid(object1)) {
		if (sub15(intGLOB_115, object1)) {
			return 1;
		}
	}
	object object4 = sub14();
	if (GetIsObjectValid(object4)) {
		if (sub15(intGLOB_116, object4)) {
			return 1;
		}
	}
	object3 = sub28();
	sub3(("GENERIC DEBUG *************** Jedi Support AI: AOE Target = " + sub9(GetIsObjectValid(object3))));
	if (GetIsObjectValid(object3)) {
		if ((GetRacialType(object3) == 5)) {
			talent1 = sub23(intGLOB_2, 1);
		}
		else {
			talent1 = sub23(intGLOB_2, 0);
		}
	}
	else {
		sub3("GENERIC DEBUG *************** Jedi Support AI: Inside the Party AI Section");
		object3 = sub70(OBJECT_INVALID);
		sub3(("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + sub4(object3)));
		if (GetIsObjectValid(object3)) {
			sub3(("GENERIC DEBUG *************** Jedi Support AI: Valid oTarget Set As = " + sub4(object3)));
			if ((GetRacialType(object3) == 5)) {
				talent1 = sub23(intGLOB_3, 1);
			}
			else {
				talent1 = sub23(intGLOB_3, 0);
			}
		}
	}
	talent1 = sub30(object3, talent1);
	talent1 = sub31(object3, talent1);
	if ((GetIsObjectValid(object3) && GetIsTalentValid(talent1))) {
		sub3("GENERIC DEBUG *************** Clear 1450");
		ClearAllActions();
		ActionUseTalentOnObject(talent1, object3);
		return 1;
	}
	sub3("GENERIC DEBUG *************** Jedi Support AI: Fall Through");
	return sub32(OBJECT_INVALID);
}

int sub68(object objectParam1) {
	if ((IsObjectPartyMember(OBJECT_SELF) || (d100(1) > 50))) {
		int int3 = 0;
		talent talent1;
		object object1 = sub20();
		if ((GetRacialType(object1) == 5)) {
			int3 = 1;
		}
		talent1 = sub24(int3);
		if (((GetIsObjectValid(object1) && GetIsTalentValid(talent1)) && GetCreatureHasTalent(talent1, OBJECT_SELF))) {
			sub3("GENERIC DEBUG *************** Clear 1400");
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			return 1;
		}
		sub3("GENERIC DEBUG *************** Grenade AI Failure");
		return sub32(objectParam1);
	}
	sub3("GENERIC DEBUG *************** Grenade AI Fall Through");
	return sub32(objectParam1);
}

talent sub67(object objectParam1, talent talentParam2) {
	int int1;
	sub3("GENERIC DEBUG *************** Starting Droid Talent Double Check");
	if ((GetTypeFromTalent(talentParam2) == 0)) {
		sub3("GENERIC DEBUG *************** Droid Talent is a Spell");
		if (((GetIdFromTalent(talentParam2) == 116) || (GetIdFromTalent(talentParam2) == 117))) {
			if ((GetRacialType(objectParam1) == 6)) {
				return talentParam2;
			}
			else {
				int1 = 1;
			}
		}
		if (((GetIdFromTalent(talentParam2) == 118) || (GetIdFromTalent(talentParam2) == 119))) {
			if (((((((((((((((GetHasSpellEffect(99, objectParam1) || GetHasSpellEffect(100, objectParam1)) || GetHasSpellEffect(101, objectParam1)) || GetHasSpellEffect(102, objectParam1)) || GetHasSpellEffect(103, objectParam1)) || GetHasSpellEffect(104, objectParam1)) || GetHasSpellEffect(105, objectParam1)) || GetHasSpellEffect(106, objectParam1)) || GetHasSpellEffect(107, objectParam1)) || GetHasSpellEffect(110, objectParam1)) || GetHasSpellEffect(111, objectParam1)) || GetHasSpellEffect(112, objectParam1)) || GetHasSpellEffect(113, objectParam1)) || GetHasSpellEffect(114, objectParam1)) || GetHasSpellEffect(115, objectParam1))) {
				return talentParam2;
			}
			else {
				int1 = 1;
			}
		}
	}
	if ((int1 == 1)) {
		talent talBest = GetCreatureTalentBest(4481, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
		if ((GetIsTalentValid(talentParam2) && GetCreatureHasTalent(talentParam2, OBJECT_SELF))) {
			return talBest;
		}
		else {
			talent talent3;
			return talent3;
		}
	}
	return talentParam2;
}

int sub66(int intParam1) {
	int int1;
	int nRandom = d4(1);
	if ((sub18(OBJECT_SELF) != 0)) {
		while ((int1 == 0)) {
			if ((sub18(OBJECT_SELF) == 1)) {
				if ((nRandom == 1)) {
					nRandom = intGLOB_17;
				}
				else {
					if ((nRandom == 2)) {
						nRandom = intGLOB_19;
					}
					else {
						if ((nRandom == 3)) {
							nRandom = intGLOB_18;
						}
						else {
							if ((nRandom == 4)) {
								nRandom = intGLOB_16;
							}
						}
					}
				}
			}
			else {
				if ((sub18(OBJECT_SELF) == 2)) {
					if ((nRandom == 1)) {
						nRandom = intGLOB_13;
					}
					else {
						if ((nRandom == 2)) {
							nRandom = intGLOB_15;
						}
						else {
							if ((nRandom == 3)) {
								nRandom = intGLOB_14;
							}
							else {
								if ((nRandom == 4)) {
									nRandom = intGLOB_12;
								}
							}
						}
					}
				}
			}
			int1 = sub36(nRandom);
			if ((int1 == 0)) {
				nRandom = d6(1);
			}
		}
	}
	else {
		nRandom = 2;
	}
	return nRandom;
}

int sub65(int intParam1) {
	int int1 = 0;
	int nRandom = d6(1);
	while ((int1 == 0)) {
		if ((nRandom == 1)) {
			nRandom = intGLOB_13;
		}
		else {
			if ((nRandom == 2)) {
				nRandom = intGLOB_15;
			}
			else {
				if ((nRandom == 3)) {
					nRandom = intGLOB_14;
				}
				else {
					if ((nRandom == 4)) {
						nRandom = intGLOB_12;
					}
					else {
						if (((nRandom == 5) || (nRandom == 6))) {
							if (((IsObjectPartyMember(OBJECT_SELF) && (GetNPCAIStyle(OBJECT_SELF) == 5)) || (!IsObjectPartyMember(OBJECT_SELF)))) {
								if ((nRandom == 5)) {
									nRandom = intGLOB_39;
								}
								else {
									if ((nRandom == 6)) {
										nRandom = intGLOB_40;
									}
								}
							}
							else {
								nRandom = intGLOB_41;
							}
						}
					}
				}
			}
		}
		int1 = sub36(nRandom);
		if ((int1 == 0)) {
			nRandom = d6(1);
		}
	}
	return nRandom;
}

int sub64() {
	talent talBest = GetCreatureTalentBest(4481, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
	if ((GetIsTalentValid(talBest) && GetCreatureHasTalent(talBest, OBJECT_SELF))) {
		int nTalent = GetIdFromTalent(talBest);
		return nTalent;
	}
	return (-1);
}

int sub63() {
	if (GetHasSpell(19, OBJECT_SELF)) {
		return 19;
	}
	else {
		if (GetHasSpell(48, OBJECT_SELF)) {
			return 48;
		}
	}
	return (-1);
}

int sub62() {
	if (GetHasSpell(11, OBJECT_SELF)) {
		return 11;
	}
	else {
		if (GetHasSpell(15, OBJECT_SELF)) {
			return 15;
		}
	}
	return (-1);
}

int sub61() {
	if (GetHasSpell(4, OBJECT_SELF)) {
		return 4;
	}
	else {
		if (GetHasSpell(49, OBJECT_SELF)) {
			return 49;
		}
	}
	return (-1);
}

int sub60() {
	if (GetHasSpell(38, OBJECT_SELF)) {
		return 38;
	}
	else {
		if (GetHasSpell(7, OBJECT_SELF)) {
			return 7;
		}
		else {
			if (GetHasSpell(45, OBJECT_SELF)) {
				return 45;
			}
		}
	}
	return (-1);
}

int sub59() {
	if (GetHasSpell(44, OBJECT_SELF)) {
		return 44;
	}
	else {
		if (GetHasSpell(29, OBJECT_SELF)) {
			return 29;
		}
		else {
			if (GetHasSpell(46, OBJECT_SELF)) {
				return 46;
			}
		}
	}
	return (-1);
}

int sub58() {
	if (GetHasSpell(25, OBJECT_SELF)) {
		return 25;
	}
	else {
		if (GetHasSpell(35, OBJECT_SELF)) {
			return 35;
		}
		else {
			if (GetHasSpell(43, OBJECT_SELF)) {
				return 43;
			}
		}
	}
	return (-1);
}

int sub57() {
	talent talBest = GetCreatureTalentBest(4356, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
	if ((GetIsTalentValid(talBest) && GetCreatureHasTalent(talBest, OBJECT_SELF))) {
		int nTalent = GetIdFromTalent(talBest);
		return nTalent;
	}
	return (-1);
}

int sub56() {
	if (GetHasSpell(37, OBJECT_SELF)) {
		return 37;
	}
	else {
		if (GetHasSpell(34, OBJECT_SELF)) {
			return 34;
		}
		else {
			if (GetHasSpell(8, OBJECT_SELF)) {
				return 8;
			}
		}
	}
	return (-1);
}

int sub55() {
	if (GetHasSpell(17, OBJECT_SELF)) {
		return 17;
	}
	else {
		if (GetHasSpell(24, OBJECT_SELF)) {
			return 24;
		}
		else {
			if (GetHasSpell(18, OBJECT_SELF)) {
				return 18;
			}
		}
	}
	return (-1);
}

int sub54() {
	if (GetHasSpell(3, OBJECT_SELF)) {
		return 3;
	}
	else {
		if (GetHasSpell(21, OBJECT_SELF)) {
			return 21;
		}
	}
	return (-1);
}

int sub53() {
	if (GetHasSpell(26, OBJECT_SELF)) {
		return 26;
	}
	else {
		if (GetHasSpell(27, OBJECT_SELF)) {
			return 27;
		}
		else {
			if (GetHasSpell(23, OBJECT_SELF)) {
				return 23;
			}
		}
	}
	return (-1);
}

int sub52() {
	if (GetHasSpell(32, OBJECT_SELF)) {
		return 32;
	}
	else {
		if (GetHasSpell(9, OBJECT_SELF)) {
			return 9;
		}
		else {
			if (GetHasSpell(50, OBJECT_SELF)) {
				return 50;
			}
		}
	}
	return (-1);
}

talent sub51(int intParam1) {
	SetLocalBoolean(OBJECT_SELF, intGLOB_42, 0);
	int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_8);
	talent talFeat;
	talent talent2;
	int nTalent = (-1);
	int int4 = 0;
	int int5 = 0;
	if ((intParam1 == intGLOB_25)) {
		if ((nLocal == 1)) {
			nTalent = sub52();
		}
		else {
			if ((nLocal == 2)) {
				nTalent = sub53();
			}
			else {
				nTalent = sub54();
			}
		}
	}
	else {
		if ((intParam1 == intGLOB_26)) {
			if ((nLocal == 1)) {
				nTalent = sub55();
				int5 = 1;
			}
			else {
				if ((nLocal == 2)) {
					nTalent = sub56();
					int5 = 1;
				}
				else {
					nTalent = sub57();
					int4 = 1;
				}
			}
		}
		else {
			if ((intParam1 == intGLOB_27)) {
				if ((nLocal == 1)) {
					nTalent = sub58();
				}
				else {
					if ((nLocal == 2)) {
						nTalent = sub57();
						int4 = 1;
					}
					else {
						nTalent = sub57();
						int4 = 1;
					}
				}
			}
			else {
				if ((intParam1 == intGLOB_28)) {
					if ((nLocal == 1)) {
						nTalent = sub59();
					}
					else {
						if ((nLocal == 2)) {
							nTalent = sub57();
							int4 = 1;
						}
						else {
							nTalent = sub57();
							int4 = 1;
						}
					}
				}
				else {
					if ((intParam1 == intGLOB_29)) {
						if ((nLocal == 1)) {
							nTalent = sub52();
						}
						else {
							if ((nLocal == 2)) {
								nTalent = sub60();
							}
							else {
								nTalent = sub57();
								int4 = 1;
							}
						}
					}
					else {
						if ((intParam1 == intGLOB_30)) {
							if ((nLocal == 1)) {
								nTalent = sub60();
							}
							else {
								if ((nLocal == 2)) {
									nTalent = sub53();
								}
								else {
									nTalent = sub61();
								}
							}
						}
						else {
							if ((intParam1 == intGLOB_31)) {
								if ((nLocal == 1)) {
									nTalent = sub58();
								}
								else {
									if ((nLocal == 2)) {
										nTalent = sub53();
									}
									else {
										nTalent = sub54();
									}
								}
							}
							else {
								if ((intParam1 == intGLOB_32)) {
									if ((nLocal == 1)) {
										nTalent = sub59();
									}
									else {
										if ((nLocal == 2)) {
											nTalent = sub53();
										}
										else {
											nTalent = sub54();
										}
									}
								}
								else {
									if ((intParam1 == intGLOB_33)) {
										if ((nLocal == 1)) {
											nTalent = sub52();
										}
										else {
											if ((nLocal == 2)) {
												nTalent = sub62();
											}
											else {
												nTalent = sub53();
											}
										}
									}
									else {
										if ((intParam1 == intGLOB_34)) {
											if ((nLocal == 1)) {
												nTalent = sub57();
												int4 = 1;
											}
											else {
												if ((nLocal == 2)) {
													nTalent = sub62();
												}
												else {
													nTalent = sub57();
													int4 = 1;
												}
											}
										}
										else {
											if ((intParam1 == intGLOB_35)) {
												if ((nLocal == 1)) {
													nTalent = sub62();
												}
												else {
													if ((nLocal == 2)) {
														nTalent = sub53();
													}
													else {
														nTalent = sub61();
													}
												}
											}
											else {
												if ((intParam1 == intGLOB_36)) {
													if ((nLocal == 1)) {
														nTalent = sub57();
														int4 = 1;
													}
													else {
														if ((nLocal == 2)) {
															nTalent = sub57();
															int4 = 1;
														}
														else {
															nTalent = sub53();
														}
													}
												}
												else {
													if ((intParam1 == intGLOB_37)) {
														if ((nLocal == 1)) {
															nTalent = sub60();
														}
														else {
															if ((nLocal == 2)) {
																nTalent = sub57();
																int4 = 1;
															}
															else {
																nTalent = sub53();
															}
														}
													}
													else {
														if ((intParam1 == intGLOB_38)) {
															if ((nLocal == 1)) {
																nTalent = sub62();
															}
															else {
																if ((nLocal == 2)) {
																	nTalent = sub63();
																}
																else {
																	nTalent = sub57();
																	int4 = 1;
																}
															}
														}
														else {
															if ((intParam1 == intGLOB_16)) {
																nTalent = sub57();
																int4 = 1;
															}
															else {
																if ((intParam1 == intGLOB_17)) {
																	if (((nLocal == 1) || (nLocal == 2))) {
																		nTalent = sub57();
																		int4 = 1;
																	}
																}
																else {
																	if ((intParam1 == intGLOB_18)) {
																		if (((nLocal == 1) || (nLocal == 2))) {
																			nTalent = sub57();
																			int4 = 1;
																		}
																	}
																	else {
																		if (((intParam1 == intGLOB_19) || (intParam1 == intGLOB_15))) {
																			sub3("GENERIC DEBUG *************** Melee/Ranged Breather");
																		}
																		else {
																			if ((intParam1 == intGLOB_12)) {
																				nTalent = sub64();
																				int4 = 1;
																			}
																			else {
																				if ((intParam1 == intGLOB_13)) {
																					if (((nLocal == 1) || (nLocal == 2))) {
																						nTalent = sub64();
																						int4 = 1;
																					}
																				}
																				else {
																					if ((intParam1 == intGLOB_14)) {
																						if (((nLocal == 1) || (nLocal == 2))) {
																							nTalent = sub64();
																							int4 = 1;
																						}
																					}
																					else {
																						if ((intParam1 == intGLOB_20)) {
																							talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																						}
																						else {
																							if ((intParam1 == intGLOB_21)) {
																								if ((nLocal == 1)) {
																									talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																								}
																								else {
																									talFeat = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
																								}
																							}
																							else {
																								if ((intParam1 == intGLOB_22)) {
																									if ((nLocal == 1)) {
																										talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																									}
																									else {
																										talFeat = GetCreatureTalentRandom(61951, OBJECT_SELF, 0);
																									}
																								}
																								else {
																									if ((intParam1 == intGLOB_23)) {
																										if ((nLocal == 1)) {
																											talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																										}
																										if ((nLocal == 2)) {
																											talFeat = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
																										}
																										if ((nLocal == 3)) {
																											talFeat = GetCreatureTalentRandom(4353, OBJECT_SELF, 0);
																										}
																									}
																									else {
																										if ((intParam1 == intGLOB_24)) {
																											if ((nLocal == 1)) {
																												talFeat = GetCreatureTalentRandom(61951, OBJECT_SELF, 0);
																											}
																											if ((nLocal == 2)) {
																												talFeat = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
																											}
																											if ((nLocal == 3)) {
																												talFeat = GetCreatureTalentRandom(4353, OBJECT_SELF, 0);
																											}
																										}
																										else {
																											if ((intParam1 == intGLOB_39)) {
																												if ((nLocal == 1)) {
																													nTalent = sub64();
																													int4 = 1;
																												}
																												if ((nLocal == 2)) {
																													nTalent = sub64();
																													int4 = 1;
																												}
																												if ((nLocal == 3)) {
																													talFeat = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
																												}
																											}
																											else {
																												if ((intParam1 == intGLOB_40)) {
																													if ((nLocal == 1)) {
																														talFeat = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
																													}
																													if ((nLocal == 2)) {
																														nTalent = sub64();
																														int4 = 1;
																													}
																													if ((nLocal == 3)) {
																														talFeat = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
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
					}
				}
			}
		}
	}
	(nLocal++);
	SetLocalNumber(OBJECT_SELF, intGLOB_8, nLocal);
	if (((!GetIsTalentValid(talFeat)) || (!GetCreatureHasTalent(talFeat, OBJECT_SELF)))) {
		if (((nTalent != (-1)) && (int4 == 0))) {
			talFeat = TalentSpell(nTalent);
		}
		else {
			if (((nTalent != (-1)) && (int4 == 1))) {
				talFeat = TalentFeat(nTalent);
			}
		}
	}
	else {
		nTalent = GetIdFromTalent(talFeat);
	}
	if ((GetIsTalentValid(talFeat) && GetCreatureHasTalent(talFeat, OBJECT_SELF))) {
		return talFeat;
	}
	return talent2;
}

string sub50(int intParam1) {
	if ((intParam1 == intGLOB_12)) {
		return "SW_COMBO_RANGED_FEROCIOUS";
	}
	else {
		if ((intParam1 == intGLOB_13)) {
			return "SW_COMBO_RANGED_AGGRESSIVE";
		}
		else {
			if ((intParam1 == intGLOB_14)) {
				return "SW_COMBO_RANGED_DISCIPLINED";
			}
			else {
				if ((intParam1 == intGLOB_15)) {
					return "SW_COMBO_RANGED_CAUTIOUS";
				}
				else {
					if ((intParam1 == intGLOB_16)) {
						return "SW_COMBO_MELEE_FEROCIOUS";
					}
					else {
						if ((intParam1 == intGLOB_17)) {
							return "SW_COMBO_MELEE_AGGRESSIVE";
						}
						else {
							if ((intParam1 == intGLOB_18)) {
								return "SW_COMBO_MELEE_DISCIPLINED";
							}
							else {
								if ((intParam1 == intGLOB_19)) {
									return "SW_COMBO_MELEE_CAUTIOUS";
								}
								else {
									if ((intParam1 == intGLOB_20)) {
										return "SW_COMBO_BUFF_PARTY";
									}
									else {
										if ((intParam1 == intGLOB_21)) {
											return "SW_COMBO_BUFF_DEBILITATE";
										}
										else {
											if ((intParam1 == intGLOB_22)) {
												return "SW_COMBO_BUFF_DAMAGE";
											}
											else {
												if ((intParam1 == intGLOB_23)) {
													return "SW_COMBO_BUFF_DEBILITATE_DESTROY";
												}
												else {
													if ((intParam1 == intGLOB_24)) {
														return "SW_COMBO_SUPRESS_DEBILITATE_DESTROY";
													}
													else {
														if ((intParam1 == intGLOB_25)) {
															return "SW_COMBO_SITH_ATTACK";
														}
														else {
															if ((intParam1 == intGLOB_26)) {
																return "SW_COMBO_BUFF_ATTACK";
															}
															else {
																if ((intParam1 == intGLOB_27)) {
																	return "SW_COMBO_SITH_CONFOUND";
																}
																else {
																	if ((intParam1 == intGLOB_28)) {
																		return "SW_COMBO_JEDI_SMITE";
																	}
																	else {
																		if ((intParam1 == intGLOB_29)) {
																			return "SW_COMBO_SITH_TAUNT";
																		}
																		else {
																			if ((intParam1 == intGLOB_30)) {
																				return "SW_COMBO_SITH_BLADE";
																			}
																			else {
																				if ((intParam1 == intGLOB_31)) {
																					return "SW_COMBO_SITH_CRUSH";
																				}
																				else {
																					if ((intParam1 == intGLOB_32)) {
																						return "SW_COMBO_JEDI_CRUSH";
																					}
																					else {
																						if ((intParam1 == intGLOB_33)) {
																							return "SW_COMBO_SITH_BRUTALIZE";
																						}
																						else {
																							if ((intParam1 == intGLOB_34)) {
																								return "SW_COMBO_SITH_DRAIN";
																							}
																							else {
																								if ((intParam1 == intGLOB_35)) {
																									return "SW_COMBO_SITH_ESCAPE";
																								}
																								else {
																									if ((intParam1 == intGLOB_36)) {
																										return "SW_COMBO_JEDI_BLITZ";
																									}
																									else {
																										if ((intParam1 == intGLOB_37)) {
																											return "SW_COMBO_SITH_SPIKE";
																										}
																										else {
																											if ((intParam1 == intGLOB_38)) {
																												return "SW_COMBO_SITH_SCYTHE";
																											}
																											else {
																												if ((intParam1 == intGLOB_39)) {
																													return "SW_COMBO_DROID_UTILITIES";
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
				}
			}
		}
	}
	return "NO COMBO SELECTED";
}

int sub49() {
	talent talRandom = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
	if (GetIsTalentValid(talRandom)) {
		return 1;
	}
	return 0;
}

int sub48() {
	if ((GetHasSpell(48, OBJECT_SELF) || GetHasSpell(19, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub47() {
	if ((GetHasSpell(15, OBJECT_SELF) || GetHasSpell(11, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub46() {
	if ((GetHasSpell(49, OBJECT_SELF) || GetHasSpell(4, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub45() {
	if (((GetHasSpell(45, OBJECT_SELF) || GetHasSpell(7, OBJECT_SELF)) || GetHasSpell(38, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub44() {
	if (((GetHasSpell(46, OBJECT_SELF) || GetHasSpell(29, OBJECT_SELF)) || GetHasSpell(44, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub43() {
	if (((GetHasSpell(43, OBJECT_SELF) || GetHasSpell(35, OBJECT_SELF)) || GetHasSpell(25, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub42() {
	if (((GetHasSpell(8, OBJECT_SELF) || GetHasSpell(37, OBJECT_SELF)) || GetHasSpell(34, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub41() {
	if (((GetHasSpell(17, OBJECT_SELF) || GetHasSpell(24, OBJECT_SELF)) || GetHasSpell(18, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub40() {
	if ((GetHasSpell(21, OBJECT_SELF) || GetHasSpell(3, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub39() {
	if (((GetHasSpell(9, OBJECT_SELF) || GetHasSpell(50, OBJECT_SELF)) || GetHasSpell(32, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub38() {
	if (((GetHasSpell(23, OBJECT_SELF) || GetHasSpell(27, OBJECT_SELF)) || GetHasSpell(26, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub37() {
	if (((((((((((((((GetHasSpell(9, OBJECT_SELF) || GetHasSpell(11, OBJECT_SELF)) || GetHasSpell(15, OBJECT_SELF)) || GetHasSpell(13, OBJECT_SELF)) || GetHasSpell(12, OBJECT_SELF)) || GetHasSpell(23, OBJECT_SELF)) || GetHasSpell(25, OBJECT_SELF)) || GetHasSpell(26, OBJECT_SELF)) || GetHasSpell(27, OBJECT_SELF)) || GetHasSpell(32, OBJECT_SELF)) || GetHasSpell(49, OBJECT_SELF)) || GetHasSpell(4, OBJECT_SELF)) || GetHasSpell(35, OBJECT_SELF)) || GetHasSpell(43, OBJECT_SELF)) || GetHasSpell(50, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub36(int intParam1) {
	if ((intParam1 == intGLOB_41)) {
		return 0;
	}
	talent talRandom;
	talent talent2;
	if ((((intParam1 == intGLOB_16) || (intParam1 == intGLOB_17)) || (intParam1 == intGLOB_18))) {
		talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
		if ((GetIsTalentValid(talRandom) && GetCreatureHasTalent(talRandom, OBJECT_SELF))) {
			return 1;
		}
	}
	else {
		if ((intParam1 == intGLOB_15)) {
			return 1;
		}
		else {
			if ((((intParam1 == intGLOB_12) || (intParam1 == intGLOB_13)) || (intParam1 == intGLOB_14))) {
				if (((((((((GetHasFeat(31, OBJECT_SELF) || GetHasFeat(20, OBJECT_SELF)) || GetHasFeat(77, OBJECT_SELF)) || GetHasFeat(29, OBJECT_SELF)) || GetHasFeat(18, OBJECT_SELF)) || GetHasFeat(82, OBJECT_SELF)) || GetHasFeat(30, OBJECT_SELF)) || GetHasFeat(26, OBJECT_SELF)) || GetHasFeat(92, OBJECT_SELF))) {
					return 1;
				}
			}
			else {
				if ((intParam1 == intGLOB_19)) {
					return 1;
				}
				else {
					if ((intParam1 == intGLOB_20)) {
						talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
						if ((GetIsTalentValid(talRandom) && GetCreatureHasTalent(talRandom, OBJECT_SELF))) {
							return 1;
						}
					}
					else {
						if ((intParam1 == intGLOB_21)) {
							talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
							talent2 = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
							if ((((GetIsTalentValid(talRandom) && GetIsTalentValid(talent2)) && GetCreatureHasTalent(talRandom, OBJECT_SELF)) && GetCreatureHasTalent(talent2, OBJECT_SELF))) {
								return 1;
							}
						}
						else {
							if ((intParam1 == intGLOB_22)) {
								talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
								if ((GetIsTalentValid(talRandom) && sub37())) {
									return 1;
								}
							}
							else {
								if ((intParam1 == intGLOB_23)) {
									talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
									talent2 = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
									if (((GetIsTalentValid(talRandom) && GetIsTalentValid(talent2)) && sub37())) {
										return 1;
									}
								}
								else {
									if ((intParam1 == intGLOB_24)) {
										talRandom = GetCreatureTalentRandom(65327, OBJECT_SELF, 0);
										talent2 = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
										if (((GetIsTalentValid(talRandom) && GetIsTalentValid(talent2)) && sub37())) {
											return 1;
										}
									}
									else {
										if ((intParam1 == intGLOB_25)) {
											if (((sub38() && sub39()) && sub40())) {
												return 1;
											}
										}
										else {
											if ((intParam1 == intGLOB_26)) {
												talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
												if (((sub41() && sub42()) && GetIsTalentValid(talRandom))) {
													return 1;
												}
											}
											else {
												if ((intParam1 == intGLOB_27)) {
													talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
													if ((sub43() && GetIsTalentValid(talRandom))) {
														return 1;
													}
												}
												else {
													if ((intParam1 == intGLOB_28)) {
														talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
														if ((sub44() && GetIsTalentValid(talRandom))) {
															return 1;
														}
													}
													else {
														if ((intParam1 == intGLOB_29)) {
															talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
															if (((sub39() && sub45()) && GetIsTalentValid(talRandom))) {
																return 1;
															}
														}
														else {
															if ((intParam1 == intGLOB_30)) {
																if (((sub45() && sub38()) && sub46())) {
																	return 1;
																}
															}
															else {
																if ((intParam1 == intGLOB_31)) {
																	if (((sub43() && sub38()) && sub40())) {
																		return 1;
																	}
																}
																else {
																	if ((intParam1 == intGLOB_32)) {
																		if (((sub44() && sub38()) && sub40())) {
																			return 1;
																		}
																	}
																	else {
																		if ((intParam1 == intGLOB_32)) {
																			if (((sub39() && sub47()) && sub38())) {
																				return 1;
																			}
																		}
																		else {
																			if ((intParam1 == intGLOB_34)) {
																				talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																				if ((sub47() && GetIsTalentValid(talRandom))) {
																					return 1;
																				}
																			}
																			else {
																				if ((intParam1 == intGLOB_35)) {
																					if (((sub47() && sub38()) && sub46())) {
																						return 1;
																					}
																				}
																				else {
																					if ((intParam1 == intGLOB_36)) {
																						talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																						if ((sub38() && GetIsTalentValid(talRandom))) {
																							return 1;
																						}
																					}
																					else {
																						if ((intParam1 == intGLOB_37)) {
																							talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																							if (((sub38() && sub45()) && GetIsTalentValid(talRandom))) {
																								return 1;
																							}
																						}
																						else {
																							if ((intParam1 == intGLOB_38)) {
																								talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																								if (((sub47() && sub48()) && GetIsTalentValid(talRandom))) {
																									return 1;
																								}
																							}
																							else {
																								if (((intParam1 == intGLOB_39) || (intParam1 == intGLOB_40))) {
																									object oLArmItem = GetItemInSlot(7, OBJECT_SELF);
																									object oRArmItem = GetItemInSlot(8, OBJECT_SELF);
																									sub3(((("GENERIC DEBUG *************** Droid Items = " + sub4(oLArmItem)) + " / ") + sub4(oRArmItem)));
																									if (sub49()) {
																										sub3("GENERIC DEBUG *************** Droid Utility Check is TRUE");
																										return 1;
																									}
																									sub3("GENERIC DEBUG *************** Droid Utility Check is FALSE");
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
	return 0;
}

int sub35(int intParam1) {
	int int1;
	int nRandom;
	while ((int1 == 0)) {
		if ((intParam1 == 0)) {
			nRandom = (Random(23) + 1);
			if (((nRandom == 1) || (nRandom == 2))) {
				return intGLOB_16;
			}
			else {
				if (((nRandom == 3) || (nRandom == 4))) {
					return intGLOB_17;
				}
				else {
					if (((nRandom == 5) || (nRandom == 6))) {
						return intGLOB_18;
					}
					else {
						if ((((nRandom == 7) || (nRandom == 8)) || (nRandom == 9))) {
							return intGLOB_19;
						}
						else {
							if (((nRandom >= 10) || (nRandom <= 24))) {
								nRandom = (nRandom + 3);
							}
						}
					}
				}
			}
		}
		else {
			nRandom = Random(15);
			nRandom = (nRandom + 13);
		}
		int1 = sub36(nRandom);
	}
	return nRandom;
}

talent sub34(int intParam1) {
	int nRandom;
	int int2;
	talent talent1;
	int nNPCStyle = GetNPCAIStyle(OBJECT_SELF);
	sub3("GENERIC DEBUG *************** Starting GetComboMove");
	if (((structGLOB_1.int13 == 4) || (structGLOB_1.int13 == 0))) {
		SetLocalNumber(OBJECT_SELF, intGLOB_8, 0);
		SetLocalNumber(OBJECT_SELF, intGLOB_7, 0);
		nRandom = d6(1);
		if ((nRandom > 0)) {
			if ((((GetLevelByClass(4, OBJECT_SELF) > 0) || (GetLevelByClass(3, OBJECT_SELF) > 0)) || (GetLevelByClass(5, OBJECT_SELF) > 0))) {
				int2 = sub35(intParam1);
				sub3(("GENERIC DEBUG *************** Starting Jedi Combo " + sub50(int2)));
				SetLocalNumber(OBJECT_SELF, intGLOB_8, 1);
				SetLocalNumber(OBJECT_SELF, intGLOB_7, int2);
				return sub51(int2);
			}
			else {
				if (((GetLevelByClass(6, OBJECT_SELF) > 0) || (GetLevelByClass(7, OBJECT_SELF) > 0))) {
					int2 = sub65(intParam1);
					sub3(("GENERIC DEBUG *************** Starting Droid Combo " + sub50(int2)));
					SetLocalNumber(OBJECT_SELF, intGLOB_8, 1);
					SetLocalNumber(OBJECT_SELF, intGLOB_7, int2);
					return sub51(int2);
				}
				else {
					int2 = sub66(intParam1);
					sub3(("GENERIC DEBUG *************** Starting NPC Combo " + sub50(int2)));
					SetLocalNumber(OBJECT_SELF, intGLOB_8, 1);
					SetLocalNumber(OBJECT_SELF, intGLOB_7, int2);
					return sub51(int2);
				}
			}
		}
		else {
			return talent1;
		}
	}
	else {
		sub3(("GENERIC DEBUG *************** Continuing Combo " + sub50(structGLOB_1.int15)));
		return sub51(structGLOB_1.int15);
	}
	return talent1;
}

object sub33() {
	sub3("GENERIC DEBUG *************** Starting Poison Check");
	effect efNext;
	if (IsObjectPartyMember(OBJECT_SELF)) {
		int int2 = 0;
		int2;
		while ((int2 > 2)) {
			efNext = GetFirstEffect(GetPartyMemberByIndex(int2));
			while (GetIsEffectValid(efNext)) {
				if ((GetEffectType(efNext) == 31)) {
					return GetPartyMemberByIndex(int2);
				}
				efNext = GetNextEffect(GetPartyMemberByIndex(int2));
			}
			(int2++);
		}
	}
	else {
		efNext = GetFirstEffect(OBJECT_SELF);
		while (GetIsEffectValid(efNext)) {
			if ((GetEffectType(efNext) == 31)) {
				return OBJECT_SELF;
			}
			efNext = GetNextEffect(OBJECT_SELF);
		}
	}
	sub3("GENERIC DEBUG ***************  Returning Invalid Poison Object");
	return OBJECT_INVALID;
}

int sub32(object objectParam1) {
	object oNPC;
	object oNearest;
	int int1;
	talent talent1;
	oNPC = sub33();
	if (GetIsObjectValid(oNPC)) {
		if (sub15(intGLOB_115, oNPC)) {
			return 1;
		}
	}
	oNPC = sub14();
	if (GetIsObjectValid(oNPC)) {
		if (sub15(intGLOB_116, oNPC)) {
			return 1;
		}
	}
	talent1 = sub34(0);
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, intGLOB_42);
	if ((nLocalBool == 1)) {
		if ((GetNPCAIStyle(OBJECT_SELF) == 5)) {
			oNPC = GetPartyMemberByIndex(0);
		}
		else {
			oNPC = OBJECT_SELF;
		}
	}
	else {
		oNPC = structGLOB_1.object1;
		oNearest = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
		sub3("GENERIC DEBUG *************** Default AI Debug Start *************************");
		sub3(("GENERIC DEBUG *************** Intruder    = " + sub4(objectParam1)));
		sub3(("GENERIC DEBUG *************** Last Target = " + sub4(oNPC)));
		sub3(("GENERIC DEBUG *************** Closest     = " + sub4(oNearest)));
		if ((((IsObjectPartyMember(OBJECT_SELF) && GetIsObjectValid(oNPC)) && (!GetIsDead(oNPC))) && GetObjectSeen(oNPC, OBJECT_SELF))) {
			oNPC = oNPC;
		}
		else {
			if ((GetIsObjectValid(objectParam1) && GetObjectSeen(objectParam1, OBJECT_SELF))) {
				sub3("GENERIC DEBUG *************** Intruder becomes Target");
				oNPC = objectParam1;
			}
			else {
				if ((GetIsObjectValid(oNearest) && GetObjectSeen(oNearest, OBJECT_SELF))) {
					if (((((!GetIsObjectValid(oNPC)) || (!GetIsEnemy(oNPC, OBJECT_SELF))) || GetIsDead(oNPC)) || (GetCurrentHitPoints(oNPC) < GetCurrentHitPoints(oNearest)))) {
						sub3("GENERIC DEBUG *************** Closest becomes Target");
						oNPC = oNearest;
					}
				}
			}
		}
	}
	if ((GetRacialType(OBJECT_SELF) == 5)) {
		talent1 = sub67(oNPC, talent1);
	}
	talent1 = sub30(oNPC, talent1);
	talent1 = sub31(oNPC, talent1);
	sub3("GENERIC DEBUG *************** Default AI Debug End ***************************");
	sub3(((("GENERIC DEBUG *************** Target = " + sub4(oNPC)) + " is Enemy: ") + IntToString(GetIsEnemy(oNPC, OBJECT_SELF))));
	if (GetIsObjectValid(oNPC)) {
		sub3("GENERIC DEBUG *************** Clear 1300");
		ClearAllActions();
		if (sub17()) {
			sub3("GENERIC DEBUG *************** Switching Weapons");
		}
		if ((GetIsTalentValid(talent1) && GetIsEnemy(oNPC, OBJECT_SELF))) {
			sub3("GENERIC DEBUG *************** Using Talent on Target");
			ActionUseTalentOnObject(talent1, oNPC);
			return 1;
		}
		else {
			if (GetIsEnemy(oNPC, OBJECT_SELF)) {
				sub3("GENERIC DEBUG *************** Action Attack by Default");
				ActionAttack(oNPC, 0);
				return 1;
			}
		}
	}
	sub3("GENERIC DEBUG *************** Default AI has failed to do an action");
	return 0;
}

talent sub31(object objectParam1, talent talentParam2) {
	int int1 = 0;
	if ((GetTypeFromTalent(talentParam2) == 0)) {
		if (((((((((((((((GetIdFromTalent(talentParam2) == 29) || (GetIdFromTalent(talentParam2) == 30)) || (GetIdFromTalent(talentParam2) == 31)) || (GetIdFromTalent(talentParam2) == 32)) || (GetIdFromTalent(talentParam2) == 38)) || (GetIdFromTalent(talentParam2) == 44)) || (GetIdFromTalent(talentParam2) == 45)) || (GetIdFromTalent(talentParam2) == 46)) || (GetIdFromTalent(talentParam2) == 50)) || (GetIdFromTalent(talentParam2) == 7)) || (GetIdFromTalent(talentParam2) == 9)) || (GetIdFromTalent(talentParam2) == 11)) || (GetIdFromTalent(talentParam2) == 15)) || (GetIdFromTalent(talentParam2) == 16))) {
			if ((GetRacialType(objectParam1) == 5)) {
				int1 = 1;
			}
		}
	}
	if ((int1 == 1)) {
		talent talBest = GetCreatureTalentBest(4356, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
		if ((GetIsTalentValid(talentParam2) && GetCreatureHasTalent(talentParam2, OBJECT_SELF))) {
			return talBest;
		}
		else {
			talent talent3;
			return talent3;
		}
	}
	return talentParam2;
}

talent sub30(object objectParam1, talent talentParam2) {
	int int1 = 0;
	if ((GetTypeFromTalent(talentParam2) == 0)) {
		if (((GetIdFromTalent(talentParam2) == 49) || (GetIdFromTalent(talentParam2) == 4))) {
			sub3(("GENERIC DEBUG *************** Lightsaber Throw Check = " + FloatToString(GetDistanceBetween(OBJECT_SELF, objectParam1), 4, 2)));
			if ((GetDistanceBetween(OBJECT_SELF, objectParam1) < 10.0)) {
				int1 = 1;
			}
		}
	}
	if ((int1 == 1)) {
		talent talBest = GetCreatureTalentBest(4356, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
		if ((GetIsTalentValid(talentParam2) && GetCreatureHasTalent(talentParam2, OBJECT_SELF))) {
			return talBest;
		}
		else {
			talent talent3;
			return talent3;
		}
	}
	return talentParam2;
}

int sub29() {
	sub3("GENERIC DEBUG *************** Boss AI: Start Targeted Action Routine");
	talent talent1;
	object object1;
	int int1;
	int nRandom = d6(1);
	int int4 = 1;
	if ((nRandom < 4)) {
		nRandom = 1;
	}
	if ((nRandom == 4)) {
		nRandom = 2;
	}
	if ((nRandom == 5)) {
		nRandom = 3;
	}
	if ((nRandom == 6)) {
		nRandom = 4;
	}
	sub3((("GENERIC DEBUG *************** Boss AI: Get the #" + sub9(nRandom)) + " target"));
	object oNearest = GetNearestCreature(3, 1, OBJECT_SELF, int4, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
	sub3(("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + sub4(oNearest)));
	while ((GetIsObjectValid(oNearest) && (int4 <= nRandom))) {
		sub3(((("GENERIC DEBUG *************** Boss AI: Valid oFind = " + sub4(oNearest)) + " nCnt = ") + sub9(int4)));
		if (GetIsObjectValid(oNearest)) {
			sub3(("GENERIC DEBUG *************** Boss AI: Valid oTarget Set As = " + sub4(oNearest)));
			object1 = oNearest;
		}
		(int4++);
		oNearest = GetNearestCreature(3, 1, OBJECT_SELF, int4, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
	}
	int int7 = 1;
	if ((int7 == 1)) {
		if (GetIsTalentValid(talent1)) {
			if ((GetTypeFromTalent(talent1) == 1)) {
				sub3(("GENERIC DEBUG *************** Boss AI: Talent Feat = " + sub9(GetIdFromTalent(talent1))));
			}
			else {
				if ((GetTypeFromTalent(talent1) == 0)) {
					sub3(("GENERIC DEBUG *************** Boss AI: Talent Power = " + sub9(GetIdFromTalent(talent1))));
				}
			}
		}
	}
	if (GetIsObjectValid(object1)) {
		if ((GetRacialType(object1) == 5)) {
			sub3("GENERIC DEBUG *************** Boss AI: Get Boss Combat Move AI Droid");
			int1 = 1;
		}
		talent1 = sub23(intGLOB_3, int1);
		talent1 = sub30(object1, talent1);
		talent1 = sub31(object1, talent1);
		sub3(("GENERIC DEBUG *************** Boss AI: Target = " + sub9(GetIsObjectValid(object1))));
		sub3(("GENERIC DEBUG *************** Boss AI: Talent = " + sub9(GetIsTalentValid(talent1))));
		if ((GetIsTalentValid(talent1) && GetIsObjectValid(object1))) {
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			sub3("GENERIC DEBUG *************** Boss AI: Targeted Power Success");
			return 1;
		}
	}
	sub3("GENERIC DEBUG *************** Boss AI: Targeted Failure");
	return 0;
}

object sub28() {
	int int1 = 0;
	int int2 = 0;
	object object1;
	object oShapeObject = GetFirstObjectInShape(4, 30.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	while (GetIsObjectValid(oShapeObject)) {
		int1 = sub22(oShapeObject, 4.0);
		if (((int1 > 2) && (int2 < int1))) {
			object1 = oShapeObject;
			int2 = int1;
		}
		oShapeObject = GetNextObjectInShape(4, 30.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	}
	return object1;
}

int sub27() {
	sub3("GENERIC DEBUG *************** Boss AI: AOE Function Starting");
	talent talent1;
	object object1 = sub28();
	sub3(("GENERIC DEBUG *************** Boss AI: AOE Target = " + sub9(GetIsObjectValid(object1))));
	int int2;
	if (GetIsObjectValid(object1)) {
		if ((GetRacialType(object1) == 5)) {
			(int2 == 1);
		}
		talent1 = sub23(intGLOB_2, int2);
		if (GetIsTalentValid(talent1)) {
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			sub3("GENERIC DEBUG *************** Boss AI: AOE Success");
			return 1;
		}
	}
	sub3("GENERIC DEBUG *************** Boss AI: AOE Failure");
	return 0;
}

talent sub26(int intParam1) {
	talent talRandom;
	int int1;
	int int2;
	int int3;
	int int4;
	int int5;
	int int6;
	int int7;
	int int8;
	int int9;
	int int10;
	int int11;
	int int12;
	int int13;
	int int14;
	if ((GetRacialType(OBJECT_SELF) == 5)) {
		talRandom = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
		if (GetIsTalentValid(talRandom)) {
			return talRandom;
		}
	}
	if ((GetHasSpell(9, OBJECT_SELF) && (int11 == 0))) {
		int1 = 1;
		(int14++);
	}
	if ((GetHasSpell(7, OBJECT_SELF) && (int11 == 0))) {
		int2 = 1;
		(int14++);
	}
	if ((GetHasSpell(38, OBJECT_SELF) && (int11 == 0))) {
		int3 = 1;
		(int14++);
	}
	if (GetHasSpell(23, OBJECT_SELF)) {
		int4 = 1;
		(int14++);
	}
	if (GetHasSpell(27, OBJECT_SELF)) {
		int5 = 1;
		(int14++);
	}
	if (GetHasSpell(35, OBJECT_SELF)) {
		int6 = 1;
		(int14++);
	}
	if ((GetHasSpell(32, OBJECT_SELF) && (int11 == 0))) {
		int7 = 1;
		(int14++);
	}
	if ((GetHasSpell(30, OBJECT_SELF) && (int11 == 0))) {
		int8 = 1;
		(int14++);
	}
	if ((GetHasSpell(50, OBJECT_SELF) && (int11 == 0))) {
		int9 = 1;
		(int14++);
	}
	if (GetHasSpell(29, OBJECT_SELF)) {
		int10 = 1;
		(int14++);
	}
	if ((GetHasSpell(12, OBJECT_SELF) && (int11 == 1))) {
		int11 = 1;
		(int14++);
	}
	talent talSpell = TalentSpell(83);
	if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
		int12 = 1;
		(int14++);
	}
	int int29;
	if ((int14 > 0)) {
		int29 = (Random(int14) + 1);
	}
	else {
		int29 = 0;
	}
	if (((int1 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(9);
		(int29--);
	}
	if (((int1 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int2 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(7);
		(int29--);
	}
	if (((int2 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int3 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(7);
		(int29--);
	}
	if (((int3 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int4 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(23);
		(int29--);
	}
	if (((int4 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int5 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(27);
		(int29--);
	}
	if (((int5 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int6 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(35);
		(int29--);
	}
	if (((int6 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int7 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(32);
		(int29--);
	}
	if (((int7 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int8 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(30);
		(int29--);
	}
	if (((int8 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int9 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(50);
		(int29--);
	}
	if (((int9 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int10 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(29);
		(int29--);
	}
	if (((int10 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int11 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(12);
		(int29--);
	}
	if (((int11 == 1) && (int29 > 1))) {
		(int29--);
	}
	if (((int12 == 1) && (int29 == 1))) {
		talRandom = TalentSpell(83);
		(int29--);
	}
	if (((int12 == 1) && (int29 > 1))) {
		(int29--);
	}
	return talRandom;
}

talent sub25(int intParam1) {
	talent talent1;
	int int1;
	int int2;
	int int3;
	int int4;
	int int5;
	int int6;
	int int7;
	int int8;
	int int9;
	int int10;
	int int11;
	int nLastForce = GetLastForcePowerUsed(OBJECT_SELF);
	sub3(("GENERIC DEBUG *************** Last Force Power Used = " + sub9(nLastForce)));
	if (((GetHasSpell(30, OBJECT_SELF) && (intParam1 == 0)) && (nLastForce != 30))) {
		int1 = 1;
		(int11++);
	}
	if (((GetHasSpell(31, OBJECT_SELF) && (intParam1 == 0)) && (nLastForce != 31))) {
		int2 = 1;
		(int11++);
	}
	if ((GetHasSpell(25, OBJECT_SELF) && (nLastForce != 25))) {
		int3 = 1;
		(int11++);
	}
	if ((GetHasSpell(26, OBJECT_SELF) && (nLastForce != 26))) {
		int4 = 1;
		(int11++);
	}
	if ((GetHasSpell(4, OBJECT_SELF) && (nLastForce != 4))) {
		int5 = 1;
		(int11++);
	}
	if ((GetHasSpell(35, OBJECT_SELF) && (nLastForce != 35))) {
		int6 = 1;
		(int11++);
	}
	if (((GetHasSpell(44, OBJECT_SELF) && (intParam1 == 0)) && (nLastForce != 44))) {
		int7 = 1;
		(int11++);
	}
	if (((GetHasSpell(47, OBJECT_SELF) && (intParam1 == 1)) && (nLastForce != 47))) {
		int8 = 1;
		(int11++);
	}
	if (((GetHasSpell(13, OBJECT_SELF) && (intParam1 == 1)) && (nLastForce != 13))) {
		int9 = 1;
		(int11++);
	}
	talent talSpell = TalentSpell(131);
	if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
		int10 = 1;
		(int11++);
	}
	int int24;
	if ((int11 > 0)) {
		int24 = (Random(int11) + 1);
	}
	else {
		int24 = 0;
	}
	if (((int1 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(30);
		(int24--);
	}
	if (((int1 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int2 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(31);
		(int24--);
	}
	if (((int1 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int3 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(25);
		(int24--);
	}
	if (((int3 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int4 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(26);
		(int24--);
	}
	if (((int4 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int5 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(4);
		(int24--);
	}
	if (((int5 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int6 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(35);
		(int24--);
	}
	if (((int6 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int7 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(44);
		(int24--);
	}
	if (((int7 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int8 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(47);
		(int24--);
	}
	if (((int8 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int9 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(13);
		(int24--);
	}
	if (((int9 == 1) && (int24 > 1))) {
		(int24--);
	}
	if (((int9 == 1) && (int24 == 1))) {
		talent1 = TalentSpell(131);
		(int24--);
	}
	if (((int10 == 1) && (int24 > 1))) {
		(int24--);
	}
	sub3(("GENERIC DEBUG *************** Force Power Returned = " + sub9(GetIdFromTalent(talent1))));
	return talent1;
}

talent sub24(int intParam1) {
	talent talSpell;
	int int1;
	int int2;
	int int3;
	int int4;
	int int5;
	int int6;
	int int7;
	int int8;
	int int9;
	int int10 = 0;
	int int11 = 0;
	int int12 = 87;
	int12;
	while ((int12 < 96)) {
		talSpell = TalentSpell(int12);
		if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
			switch (int12) {
				case 87:
					int1 = 1;
					(int10++);
					break;
				case 88:
					if ((intParam1 == 0)) {
						int2 = 1;
						(int10++);
					}
					break;
				case 89:
					int3 = 1;
					(int10++);
					break;
				case 90:
					if ((intParam1 == 0)) {
						int4 = 1;
						(int10++);
					}
					break;
				case 91:
					if ((intParam1 == 0)) {
						int5 = 1;
						(int10++);
					}
					break;
				case 92:
					if ((intParam1 == 0)) {
						int6 = 1;
						(int10++);
					}
					break;
				case 93:
					if ((intParam1 == 0)) {
						int7 = 1;
						(int10++);
					}
					break;
				case 94:
					int8 = 1;
					(int10++);
					break;
				case 95:
					if ((intParam1 == 1)) {
						int9 = 1;
						(int10++);
					}
					break;
			}
		}
		(int12++);
	}
	int int14;
	if ((int10 > 0)) {
		int14 = (Random(int10) + 1);
	}
	else {
		int14 = 0;
	}
	if ((int10 > 0)) {
		if (((int14 == 1) && (int1 == 1))) {
			return talSpell = TalentSpell(87);
		}
		if (((int14 > 1) && (int1 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int2 == 1))) {
			return talSpell = TalentSpell(88);
		}
		if (((int14 > 1) && (int2 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int3 == 1))) {
			return talSpell = TalentSpell(89);
		}
		if (((int14 > 1) && (int3 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int4 == 1))) {
			return talSpell = TalentSpell(90);
		}
		if (((int14 > 1) && (int4 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int5 == 1))) {
			return talSpell = TalentSpell(91);
		}
		if (((int14 > 1) && (int5 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int6 == 1))) {
			return talSpell = TalentSpell(92);
		}
		if (((int14 > 1) && (int6 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int7 == 1))) {
			return talSpell = TalentSpell(93);
		}
		if (((int14 > 1) && (int7 == 1))) {
			(int14--);
		}
		if (((int14 == 1) && (int8 == 1))) {
			return talSpell = TalentSpell(94);
		}
		if (((int14 > 1) && (int8 == 1))) {
			(int14--);
		}
	}
	sub3("GENERIC DEBUG *************** Grenade Selection Failure");
	talent talent11;
	return talent11;
	return talent11;
}

talent sub23(int intParam1, int intParam2) {
	talent talent1;
	talent talRandom;
	int int1 = 0;
	if (((intParam1 == intGLOB_1) || (intParam1 == intGLOB_5))) {
		talRandom = sub24(intParam2);
		if (GetIsTalentValid(talRandom)) {
			sub3("GENERIC DEBUG *************** Boss AI: Grenade Talent Chosen");
			return talRandom;
		}
	}
	if (((intParam1 == intGLOB_2) || (intParam1 == intGLOB_5))) {
		talRandom = sub25(intParam2);
		if (GetIsTalentValid(talRandom)) {
			sub3("GENERIC DEBUG *************** Boss AI: AOE Force Power Talent Chosen");
			return talRandom;
		}
	}
	if (((intParam1 == intGLOB_3) || (intParam1 == intGLOB_5))) {
		if ((d100(1) > 50)) {
			talRandom = sub26(intParam2);
			if (GetIsTalentValid(talRandom)) {
				sub3("GENERIC DEBUG *************** Boss AI: Targeted Force Power Talent Chosen");
				return talRandom;
			}
			talRandom = sub25(intParam2);
			if (GetIsTalentValid(talRandom)) {
				sub3("GENERIC DEBUG *************** Boss AI: AOE Force Power Talent Chosen");
				return talRandom;
			}
		}
		if ((sub18(OBJECT_SELF) == 1)) {
			sub3("GENERIC DEBUG *************** Boss AI: Melee Feat Talent Chosen");
			talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
		}
		else {
			sub3("GENERIC DEBUG *************** Boss AI: Range Feat Talent Chosen");
			talRandom = GetCreatureTalentRandom(4369, OBJECT_SELF, 0);
		}
		if (GetIsTalentValid(talRandom)) {
			return talRandom;
		}
	}
	else {
		if (((intParam1 == intGLOB_4) || (intParam1 == intGLOB_5))) {
			if ((d100(1) > 70)) {
				talRandom = sub26(intParam2);
				if (GetIsTalentValid(talRandom)) {
					return talRandom;
				}
				talRandom = sub25(intParam2);
				if (GetIsTalentValid(talRandom)) {
					return talRandom;
				}
			}
			talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
			if (GetIsTalentValid(talRandom)) {
				return talRandom;
			}
			sub3("GENERIC DEBUG *************** Boss AI: No Feats Available");
		}
	}
	return talRandom;
}

int sub22(object objectParam1, float floatParam2) {
	int int1;
	object oShapeObject = GetFirstObjectInShape(4, floatParam2, GetLocation(objectParam1), 0, 1, [0.0,0.0,0.0]);
	while (GetIsObjectValid(oShapeObject)) {
		if ((GetIsEnemy(oShapeObject, OBJECT_SELF) && (!GetIsDead(oShapeObject)))) {
			(int1++);
		}
		oShapeObject = GetNextObjectInShape(4, floatParam2, GetLocation(objectParam1), 0, 1, [0.0,0.0,0.0]);
	}
	return int1;
}

int sub21(object objectParam1, float floatParam2) {
	int int1;
	int int2;
	int nLevel = GetHitDice(OBJECT_SELF);
	object oShapeObject = GetFirstObjectInShape(4, floatParam2, GetLocation(objectParam1), 0, 1, [0.0,0.0,0.0]);
	while (GetIsObjectValid(oShapeObject)) {
		if ((GetIsFriend(oShapeObject, OBJECT_SELF) && (!GetIsDead(oShapeObject)))) {
			(int1++);
		}
		oShapeObject = GetNextObjectInShape(4, floatParam2, GetLocation(objectParam1), 0, 1, [0.0,0.0,0.0]);
	}
	return int1;
}

object sub20() {
	int int1 = 0;
	if (IsObjectPartyMember(OBJECT_SELF)) {
		int1 = 1;
	}
	int int3 = 0;
	int int4 = 0;
	int int5 = 0;
	object object1;
	object oShapeObject = GetFirstObjectInShape(4, 40.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	while (GetIsObjectValid(oShapeObject)) {
		if ((GetObjectSeen(oShapeObject, OBJECT_SELF) && (!GetIsDead(oShapeObject)))) {
			int3 = sub21(oShapeObject, 4.0);
			int4 = sub22(oShapeObject, 4.0);
			if ((((int4 > int1) && (int3 == 0)) && (int5 < int4))) {
				object1 = oShapeObject;
				int5 = int4;
			}
		}
		oShapeObject = GetNextObjectInShape(4, 40.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	}
	return object1;
}

int sub19() {
	sub3("GENERIC DEBUG *************** Boss AI: Grenade Function Starting");
	talent talent1;
	object object1 = sub20();
	sub3(("GENERIC DEBUG *************** Boss AI: Grenade Target = " + sub9(GetIsObjectValid(object1))));
	int int2;
	if (GetIsObjectValid(object1)) {
		if ((GetRacialType(object1) == 5)) {
			(int2 == 1);
		}
		talent1 = sub23(intGLOB_1, int2);
		if (GetIsTalentValid(talent1)) {
			sub3("GENERIC DEBUG *************** Clear 1460");
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			sub3("GENERIC DEBUG *************** Boss AI: AOE Success");
			return 1;
		}
	}
	sub3("GENERIC DEBUG *************** Boss AI: AOE Failure");
	return 0;
}

int sub18(object objectParam1) {
	object oRWeapItem = GetItemInSlot(4, objectParam1);
	if (GetIsObjectValid(oRWeapItem)) {
		if ((((((((((((((((GetBaseItemType(oRWeapItem) == 20) || (GetBaseItemType(oRWeapItem) == 12)) || (GetBaseItemType(oRWeapItem) == 77)) || (GetBaseItemType(oRWeapItem) == 19)) || (GetBaseItemType(oRWeapItem) == 16)) || (GetBaseItemType(oRWeapItem) == 21)) || (GetBaseItemType(oRWeapItem) == 13)) || (GetBaseItemType(oRWeapItem) == 24)) || (GetBaseItemType(oRWeapItem) == 14)) || (GetBaseItemType(oRWeapItem) == 15)) || (GetBaseItemType(oRWeapItem) == 18)) || (GetBaseItemType(oRWeapItem) == 23)) || (GetBaseItemType(oRWeapItem) == 17)) || (GetBaseItemType(oRWeapItem) == 22)) || (GetBaseItemType(oRWeapItem) == 17))) {
			return 2;
		}
		else {
			if (((((((((((((((GetBaseItemType(oRWeapItem) == 9) || (GetBaseItemType(oRWeapItem) == 6)) || (GetBaseItemType(oRWeapItem) == 80)) || (GetBaseItemType(oRWeapItem) == 78)) || (GetBaseItemType(oRWeapItem) == 8)) || (GetBaseItemType(oRWeapItem) == 2)) || (GetBaseItemType(oRWeapItem) == 0)) || (GetBaseItemType(oRWeapItem) == 10)) || (GetBaseItemType(oRWeapItem) == 4)) || (GetBaseItemType(oRWeapItem) == 1)) || (GetBaseItemType(oRWeapItem) == 5)) || (GetBaseItemType(oRWeapItem) == 7)) || (GetBaseItemType(oRWeapItem) == 3)) || (GetBaseItemType(oRWeapItem) == 79))) {
				return 1;
			}
		}
	}
	sub3("GENERIC DEBUG *************** Return No Weapon Type");
	return 0;
}

int sub17() {
	object oInvItem;
	if (((((GetIsObjectValid(GetAttackTarget(OBJECT_SELF)) && (GetDistanceBetween(GetAttackTarget(OBJECT_SELF), OBJECT_SELF) <= 3.0)) && (sub18(OBJECT_SELF) != 1)) && (GetRacialType(OBJECT_SELF) == 6)) && (!IsObjectPartyMember(OBJECT_SELF)))) {
		oInvItem = GetFirstItemInInventory(OBJECT_SELF);
		while (GetIsObjectValid(oInvItem)) {
			sub3("GENERIC DEBUG *************** Checking Melee Weapon");
			if (((((((((((((((GetBaseItemType(oInvItem) == 9) || (GetBaseItemType(oInvItem) == 6)) || (GetBaseItemType(oInvItem) == 80)) || (GetBaseItemType(oInvItem) == 78)) || (GetBaseItemType(oInvItem) == 8)) || (GetBaseItemType(oInvItem) == 2)) || (GetBaseItemType(oInvItem) == 0)) || (GetBaseItemType(oInvItem) == 10)) || (GetBaseItemType(oInvItem) == 4)) || (GetBaseItemType(oInvItem) == 1)) || (GetBaseItemType(oInvItem) == 5)) || (GetBaseItemType(oInvItem) == 7)) || (GetBaseItemType(oInvItem) == 3)) || (GetBaseItemType(oInvItem) == 79))) {
				sub3("GENERIC DEBUG *************** Equipping Melee Weapon");
				ActionEquipMostDamagingMelee(OBJECT_INVALID, 0);
				return 1;
			}
			else {
				oInvItem = GetNextItemInInventory(OBJECT_SELF);
			}
		}
	}
	else {
		if (((((((sub18(OBJECT_SELF) != 2) && (GetLevelByClass(4, OBJECT_SELF) == 0)) && (GetLevelByClass(3, OBJECT_SELF) == 0)) && (GetLevelByClass(5, OBJECT_SELF) == 0)) && (GetDistanceBetween(GetAttemptedAttackTarget(), OBJECT_SELF) > 3.0)) && (!IsObjectPartyMember(OBJECT_SELF)))) {
			oInvItem = GetFirstItemInInventory(OBJECT_SELF);
			while (GetIsObjectValid(oInvItem)) {
				sub3("GENERIC DEBUG *************** Checking Ranged Weapon");
				if ((((((((((((((((GetBaseItemType(oInvItem) == 20) || (GetBaseItemType(oInvItem) == 12)) || (GetBaseItemType(oInvItem) == 77)) || (GetBaseItemType(oInvItem) == 19)) || (GetBaseItemType(oInvItem) == 16)) || (GetBaseItemType(oInvItem) == 21)) || (GetBaseItemType(oInvItem) == 13)) || (GetBaseItemType(oInvItem) == 24)) || (GetBaseItemType(oInvItem) == 14)) || (GetBaseItemType(oInvItem) == 15)) || (GetBaseItemType(oInvItem) == 18)) || (GetBaseItemType(oInvItem) == 23)) || (GetBaseItemType(oInvItem) == 17)) || (GetBaseItemType(oInvItem) == 22)) || (GetBaseItemType(oInvItem) == 17))) {
					sub3("GENERIC DEBUG *************** Equipping Ranged Weapon");
					ActionEquipMostDamagingRanged(OBJECT_INVALID);
					return 1;
				}
				else {
					oInvItem = GetNextItemInInventory(OBJECT_SELF);
				}
			}
		}
	}
	sub3("GENERIC DEBUG *************** Should not currently change weapons");
	return 0;
}

object sub16(int intParam1) {
	object oNPC = GetPartyMemberByIndex(0);
	object object3 = GetPartyMemberByIndex(1);
	object object5 = GetPartyMemberByIndex(2);
	object oNearest;
	int int1 = 0;
	int nRandom;
	int int3 = 0;
	int int4 = 0;
	int int5 = 0;
	if (((GetIsObjectValid(object3) && (GetCurrentHitPoints(object3) > 0)) && GetObjectSeen(object3, OBJECT_SELF))) {
		if (((GetRacialType(object3) != 5) || (intParam1 == 0))) {
			(int1++);
			int4 = 1;
		}
	}
	if (((GetIsObjectValid(object5) && (GetCurrentHitPoints(object5) > 0)) && GetObjectSeen(object5, OBJECT_SELF))) {
		if (((GetRacialType(object5) != 5) || (intParam1 == 0))) {
			(int1++);
			int5 = 1;
		}
	}
	if ((intParam1 == 1)) {
		if (((GetIsObjectValid(oNPC) && (GetCurrentHitPoints(oNPC) > 0)) && GetObjectSeen(oNPC, OBJECT_SELF))) {
			if ((GetRacialType(oNPC) != 5)) {
				(int1++);
				int3 = 1;
			}
		}
	}
	if ((int1 == 0)) {
		oNearest = OBJECT_INVALID;
	}
	else {
		if ((int1 == 1)) {
			if ((int4 == 1)) {
				oNearest = object3;
			}
			else {
				if ((int5 == 1)) {
					oNearest = object5;
				}
				else {
					if ((int3 == 1)) {
						oNearest = oNPC;
					}
				}
			}
		}
		else {
			if ((int1 == 2)) {
				nRandom = d100(1);
				if (((int3 == 1) && (int4 == 1))) {
					if ((nRandom > 50)) {
						oNearest = oNPC;
					}
					else {
						oNearest = object3;
					}
				}
				else {
					if (((int3 == 1) && (int5 == 1))) {
						if ((nRandom > 50)) {
							oNearest = oNPC;
						}
						else {
							oNearest = object5;
						}
					}
					else {
						if (((int4 == 1) && (int5 == 1))) {
							if ((nRandom > 50)) {
								oNearest = object3;
							}
							else {
								oNearest = object5;
							}
						}
					}
				}
			}
			else {
				if ((int1 == 3)) {
					nRandom = d100(1);
					if ((nRandom <= 33)) {
						oNearest = oNPC;
					}
					else {
						if (((nRandom > 33) && (nRandom <= 66))) {
							oNearest = object3;
						}
						else {
							if (((nRandom > 66) && (nRandom <= 100))) {
								oNearest = object5;
							}
						}
					}
				}
			}
		}
	}
	if (((!GetIsEnemy(oNearest, OBJECT_SELF)) && (intParam1 == 1))) {
		sub3("GENERIC DEBUG *************** Searching for Alternate Target");
		oNearest = GetNearestCreature(3, 1, OBJECT_SELF, 1, 0, 6, 0xFFFFFFFF, 0xFFFFFFFF);
		sub3(("GENERIC DEBUG *************** Alternate Target = " + sub4(oNearest)));
	}
	sub3(("GENERIC DEBUG *************** Heal Drain Target = " + sub9(intParam1)));
	sub3(("GENERIC DEBUG *************** Get Active Party Member: " + sub4(oNearest)));
	return oNearest;
}

int sub15(int intParam1, object objectParam2) {
	if (GetIsObjectValid(objectParam2)) {
		talent talSpell;
		talent talent2;
		talent talent3;
		talent talent4;
		talent talBest;
		talent talent6;
		talent talent7;
		talent talent8;
		int int2;
		int int3 = 0;
		int int4 = 0;
		if ((intParam1 == intGLOB_114)) {
			int2 = 61473;
		}
		else {
			if ((intParam1 == intGLOB_115)) {
				int3 = 0;
				talSpell = TalentSpell(28);
				talent2 = TalentSpell(10);
				talent3 = TalentSpell(67);
				if ((GetCreatureHasTalent(talSpell, OBJECT_SELF) || GetCreatureHasTalent(talent2, OBJECT_SELF))) {
					int3 = 1;
					if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
						talent8 = talSpell;
					}
					else {
						talent8 = talent2;
					}
				}
				else {
					if ((GetCreatureHasTalent(talent3, OBJECT_SELF) && (objectParam2 == OBJECT_SELF))) {
						int3 = 1;
						talent8 = talent3;
					}
				}
			}
			else {
				if ((intParam1 == intGLOB_116)) {
					int3 = 0;
					sub3(("GENERIC DEBUG *************** Starting Heal Talent Checks " + sub4(OBJECT_SELF)));
					talSpell = TalentSpell(28);
					talent2 = TalentSpell(10);
					if ((GetRacialType(OBJECT_SELF) != 5)) {
						talBest = GetCreatureTalentBest(5128, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
					}
					else {
						talBest = TalentSpell(128);
						if ((!GetCreatureHasTalent(talBest, OBJECT_SELF))) {
							talBest = TalentSpell(127);
							if ((!GetCreatureHasTalent(talBest, OBJECT_SELF))) {
								talBest = TalentSpell(84);
							}
						}
					}
					talent6 = TalentSpell(15);
					talent7 = TalentSpell(11);
					talent8;
					int3 = 0;
					if ((GetCreatureHasTalent(talSpell, OBJECT_SELF) || GetCreatureHasTalent(talent2, OBJECT_SELF))) {
						sub3("GENERIC DEBUG *************** I have Heal or Cure");
						int3 = 1;
						if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
							talent8 = talSpell;
						}
						else {
							talent8 = talent2;
						}
					}
					else {
						if (((GetIsTalentValid(talBest) || GetCreatureHasTalent(talent6, OBJECT_SELF)) || GetCreatureHasTalent(talent7, OBJECT_SELF))) {
							if ((objectParam2 == OBJECT_SELF)) {
								if ((GetCreatureHasTalent(talent7, OBJECT_SELF) && (!IsObjectPartyMember(OBJECT_SELF)))) {
									sub3("GENERIC DEBUG *************** I have Death Field");
									int3 = 1;
									int4 = 1;
									talent8 = talent7;
								}
								else {
									if ((GetCreatureHasTalent(talent6, OBJECT_SELF) && (!IsObjectPartyMember(OBJECT_SELF)))) {
										sub3("GENERIC DEBUG *************** I have Drain Life");
										int3 = 1;
										int4 = 1;
										talent8 = talent6;
									}
									else {
										sub3("GENERIC DEBUG *************** I have a Med Pack");
										int3 = 1;
										talent8 = talBest;
									}
								}
							}
						}
					}
				}
				else {
					if ((intParam1 == intGLOB_117)) {
						int3 = 0;
						talSpell = TalentSpell(36);
						talent2 = TalentSpell(33);
						talent3 = TalentSpell(22);
						int int22 = 0;
						if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
							int22 = 1;
							talent8 = talSpell;
						}
						else {
							if (GetCreatureHasTalent(talent2, OBJECT_SELF)) {
								int22 = 1;
								talent8 = talent2;
							}
							else {
								if (GetCreatureHasTalent(talent3, OBJECT_SELF)) {
									int22 = 1;
									talent8 = talent3;
								}
							}
						}
						if (((((!GetHasSpellEffect(22, OBJECT_SELF)) && (!GetHasSpellEffect(33, OBJECT_SELF))) && (!GetHasSpellEffect(36, OBJECT_SELF))) && (int22 == 1))) {
							sub3("GENERIC DEBUG *************** I do have VALOR");
							int3 = 1;
						}
						else {
							sub3("GENERIC DEBUG *************** I do not have VALOR");
							int3 = 0;
						}
					}
				}
			}
		}
		if (((int3 == 1) && (int4 == 0))) {
			sub3("GENERIC DEBUG *************** Clear 2300");
			int nTalent = GetIdFromTalent(talent8);
			sub3(("GENERIC DEBUG *************** Spells.2DA ID = " + sub9(nTalent)));
			ClearAllActions();
			ActionUseTalentOnObject(talent8, OBJECT_SELF);
			return 1;
		}
		else {
			if (((int3 == 1) && (int4 == 1))) {
				objectParam2 = sub16(1);
				if (GetIsObjectValid(objectParam2)) {
					sub3(("GENERIC DEBUG *************** Hostile Heal Targeted On: " + sub4(objectParam2)));
					sub3("GENERIC DEBUG *************** Clear 2400");
					ClearAllActions();
					ActionUseTalentOnObject(talent8, objectParam2);
					return 1;
				}
			}
		}
		talent talent23 = GetCreatureTalentBest(int2, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
		if ((GetIsTalentValid(talent8) && (!GetHasSpellEffect(GetIdFromTalent(talent8), OBJECT_SELF)))) {
			if (GetIsObjectValid(objectParam2)) {
				sub3("GENERIC DEBUG *************** Clear 2500");
				ClearAllActions();
				sub3(((("GENERIC DEBUG *************** Target = " + GetName(objectParam2)) + " Talent Code = ") + IntToString(int2)));
				ActionUseTalentOnObject(talent8, OBJECT_SELF);
				return 1;
			}
		}
	}
	sub3(((((("GENERIC DEBUG *************** " + sub4(OBJECT_SELF)) + " VP = ") + sub9(GetCurrentHitPoints(OBJECT_SELF))) + "/") + sub9(GetMaxHitPoints(OBJECT_SELF))));
	sub3("GENERIC DEBUG *************** Healing Not Used");
	return 0;
}

object sub14() {
	sub3("GENERIC DEBUG ***************  Starting Injury Check Function");
	if ((IsObjectPartyMember(OBJECT_SELF) || (GetRacialType(OBJECT_SELF) == 5))) {
		object oNPC = GetPartyMemberByIndex(0);
		object object3 = GetPartyMemberByIndex(1);
		object object5 = GetPartyMemberByIndex(2);
		float float1 = 10.0;
		float float2 = 10.0;
		float float3 = 10.0;
		if ((GetIsObjectValid(oNPC) && (GetRacialType(oNPC) != 5))) {
			float1 = (IntToFloat(GetCurrentHitPoints(oNPC)) / IntToFloat(GetMaxHitPoints(oNPC)));
		}
		if ((GetIsObjectValid(object3) && (GetRacialType(oNPC) != 5))) {
			float2 = (IntToFloat(GetCurrentHitPoints(object3)) / IntToFloat(GetMaxHitPoints(object3)));
		}
		if ((GetIsObjectValid(object5) && (GetRacialType(oNPC) != 5))) {
			float3 = (IntToFloat(GetCurrentHitPoints(object5)) / IntToFloat(GetMaxHitPoints(object5)));
		}
		if (((GetIsObjectValid(oNPC) && (!GetIsDead(oNPC))) && ((float1 < 0.5) && (float1 > 0.0)))) {
			sub3("GENERIC DEBUG ***************  Return oP0");
			return oNPC;
		}
		else {
			if (((GetIsObjectValid(object3) && (!GetIsDead(object3))) && ((float1 < 0.5) && (float1 > 0.0)))) {
				sub3("GENERIC DEBUG ***************  Return oP1");
				return object3;
			}
			else {
				if (((GetIsObjectValid(object5) && (!GetIsDead(object5))) && ((float1 < 0.5) && (float1 > 0.0)))) {
					sub3("GENERIC DEBUG ***************  Return oP2");
					return object5;
				}
			}
		}
	}
	else {
		float float10 = (IntToFloat(GetCurrentHitPoints(OBJECT_SELF)) / IntToFloat(GetMaxHitPoints(OBJECT_SELF)));
		if ((float10 < 0.5)) {
			return OBJECT_SELF;
		}
	}
	return OBJECT_INVALID;
}

int sub13(object objectParam1) {
	sub3("GENERIC DEBUG *************** Boss AI Start");
	object object1 = sub14();
	if (GetIsObjectValid(object1)) {
		if (sub15(intGLOB_116, object1)) {
			return 1;
		}
	}
	if (sub17()) {
		sub3("GENERIC DEBUG *************** Switching Weapons");
	}
	if ((sub19() == 1)) {
		return 1;
	}
	else {
		if ((sub27() == 1)) {
			return 1;
		}
		else {
			if ((sub29() == 1)) {
				return 1;
			}
		}
	}
	sub3("GENERIC DEBUG *************** Boss AI: Fall Through");
	return sub32(OBJECT_INVALID);
}

int sub12() {
	sub3("GENERIC DEBUG *************** Malak AI Start");
	int nGlobal = GetGlobalNumber("K_END_JEDI_LEFT");
	int int3 = GetGlobalNumber("K_END_MALAK_JEDI_USED");
	object oPC = GetFirstPC();
	int int5;
	int int6;
	int int7;
	float fDistance = GetDistanceBetween(OBJECT_SELF, oPC);
	if (((8 - nGlobal) < int3)) {
		int5 = 1;
	}
	sub3(("GENERIC DEBUG *************** Malak Distance to PC = " + FloatToString(GetDistanceBetween(OBJECT_SELF, oPC), 4, 4)));
	if ((fDistance > 10.0)) {
		int6 = 1;
	}
	if ((int6 == 1)) {
		sub3("GENERIC DEBUG *************** Clear 1480");
		ClearAllActions();
		if (((GetHasSpellEffect(8, oPC) || GetHasSpellEffect(34, oPC)) || GetHasSpellEffect(37, oPC))) {
			talent talSpell = TalentSpell(19);
			if (GetIsTalentValid(talSpell)) {
				sub3("GENERIC DEBUG *************** Using Breach");
				ActionUseTalentOnObject(talSpell, oPC);
			}
			int7 = 1;
		}
		else {
			if ((fDistance > 10.0)) {
				int nRandom = d3(1);
				int int14 = (-1);
				if ((nRandom == 1)) {
					int14 = 35;
				}
				else {
					if ((nRandom == 2)) {
						int14 = 49;
					}
					else {
						if ((nRandom > 2)) {
							int7 = 1;
						}
					}
				}
				if ((int14 != (-1))) {
					talent talent3 = TalentSpell(int14);
					if (GetIsTalentValid(talent3)) {
						sub3("GENERIC DEBUG *************** Malak Using Force Power");
						ActionUseTalentOnObject(talent3, oPC);
						return 1;
					}
				}
			}
			int7 = 1;
		}
	}
	if ((int7 == 1)) {
		sub3("GENERIC DEBUG *************** Malak Attacking");
		ActionAttack(oPC, 0);
		return 1;
	}
	sub3("GENERIC DEBUG *************** Malak AI Drop Out");
	return 0;
}

int sub11() {
	int int1 = 0;
	if (((sub7(intGLOB_108) == 0) && (!IsObjectPartyMember(OBJECT_SELF)))) {
		if (((GetHitDice(GetFirstPC()) >= 15) || sub7(intGLOB_105))) {
			talent talSpell = TalentSpell(41);
			talent talent3 = TalentSpell(20);
			talent talent5;
			if (GetCreatureHasTalent(talent3, OBJECT_SELF)) {
				talent5 = talent3;
				int1 = 1;
			}
			else {
				if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
					talent5 = talSpell;
					int1 = 1;
				}
			}
			if ((int1 == 1)) {
				sub3("GENERIC DEBUG *************** Clear 1710");
				ClearAllActions();
				ActionUseTalentOnObject(talent5, OBJECT_SELF);
			}
			sub10(intGLOB_108, 1);
		}
	}
	return int1;
}

void sub10(int intParam1, int intParam2) {
	SetLocalBoolean(OBJECT_SELF, intParam1, intParam2);
}

string sub9(int intParam1) {
	return IntToString(intParam1);
}

int sub8() {
	sub3("GENERIC DEBUG *************** Starting Forcefield Search");
	sub3(((("GENERIC DEBUG *************** Shield Boolean (" + sub9(intGLOB_106)) + ") = ") + sub9(sub7(intGLOB_106))));
	if (((sub7(intGLOB_106) == 0) && (!IsObjectPartyMember(OBJECT_SELF)))) {
		int int4;
		int int5;
		int int6 = 0;
		talent talSpell;
		if ((GetRacialType(OBJECT_SELF) == 5)) {
			int4 = 110;
			int5 = 115;
		}
		else {
			int4 = 99;
			int5 = 107;
		}
		while (((int6 == 0) && (int4 <= int5))) {
			talSpell = TalentSpell(int4);
			if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
				int6 = 1;
			}
			else {
				(int4++);
			}
		}
		if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
			sub3("GENERIC DEBUG *************** Clear 1700");
			ClearAllActions();
			ActionUseTalentOnObject(talSpell, OBJECT_SELF);
			sub10(intGLOB_106, 1);
			return 1;
		}
		else {
			sub3("GENERIC DEBUG *************** Forcefield Search Fallthrough");
			sub10(intGLOB_106, 1);
			return 0;
		}
	}
	sub3("GENERIC DEBUG *************** Forcefield Search Fallthrough");
	return 0;
}

int sub7(int intParam1) {
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, intParam1);
	if ((nLocalBool > 0)) {
		return 1;
	}
	return 0;
}

string sub6(object objectParam1) {
	if ((GetNPCAIStyle(objectParam1) == 3)) {
		return "NPC_AISTYLE_AID";
	}
	else {
		if ((GetNPCAIStyle(objectParam1) == 4)) {
			return "NPC_AISTYLE_GRENADE_THROWER";
		}
		else {
			if ((GetNPCAIStyle(objectParam1) == 5)) {
				return "NPC_AISTYLE_JEDI_SUPPORT";
			}
			else {
				if ((GetNPCAIStyle(objectParam1) == 0)) {
					return "NPC_AISTYLE_DEFAULT_ATTACK";
				}
			}
		}
	}
	int nNPCStyle = GetNPCAIStyle(objectParam1);
	string string1 = IntToString(nNPCStyle);
	string1 = ("No Valid AI Set, state = " + string1);
	return string1;
}

void sub5() {
	talent talFeat;
	structGLOB_1.object1 = GetLastHostileTarget(OBJECT_SELF);
	structGLOB_1.int9 = GetIsDebilitated(structGLOB_1.object1);
	structGLOB_1.int1 = GetLastAttackAction(OBJECT_SELF);
	if ((structGLOB_1.int1 == 4)) {
		structGLOB_1.int3 = GetLastForcePowerUsed(OBJECT_SELF);
		structGLOB_1.int7 = GetWasForcePowerSuccessful(OBJECT_SELF);
		talFeat = TalentSpell(structGLOB_1.int3);
		structGLOB_1.int5 = GetCategoryFromTalent(talFeat);
	}
	else {
		if ((structGLOB_1.int1 == 3)) {
			structGLOB_1.int3 = GetLastCombatFeatUsed(OBJECT_SELF);
			structGLOB_1.int7 = GetLastAttackResult(OBJECT_SELF);
			talFeat = TalentFeat(structGLOB_1.int3);
			structGLOB_1.int5 = GetCategoryFromTalent(talFeat);
		}
	}
	structGLOB_1.int13 = GetLocalNumber(OBJECT_SELF, intGLOB_8);
	structGLOB_1.int15 = GetLocalNumber(OBJECT_SELF, intGLOB_7);
}

string sub4(object objectParam1) {
	string string1 = ((GetName(objectParam1) + "_") + ObjectToString(objectParam1));
	return string1;
}

void sub3(string stringParam1) {
	if ((!ShipBuild())) {
		PrintString(stringParam1);
	}
}

void sub2(object objectParam1) {
	sub3("");
	sub3(("GENERIC DEBUG *************** START DETERMINE COMBAT ROUND " + sub4(OBJECT_SELF)));
	sub5();
	{
		int nStyle = GetPartyAIStyle();
		int nNPCStyle = GetNPCAIStyle(OBJECT_SELF);
		sub3(("GENERIC DEBUG *************** AI STYLE = " + sub6(OBJECT_SELF)));
		if (((((!sub7(intGLOB_101)) && (!sub7(intGLOB_102))) && (!sub7(intGLOB_103))) && (!GetUserActionsPending()))) {
		if (((GetPartyMemberByIndex(0) != OBJECT_SELF) && (!GetPlayerRestrictMode(OBJECT_SELF)))) {
			if (((IsObjectPartyMember(OBJECT_SELF) && (!GetPlayerRestrictMode(OBJECT_SELF))) || (!IsObjectPartyMember(OBJECT_SELF)))) {
				if ((nNPCStyle == 2)) {
					if (GetIsObjectValid(objectParam1)) {
						ClearAllActions();
						ActionAttack(objectParam1, 0);
						return;
					}
					else {
						object oNearest = GetNearestCreature(3, 1, OBJECT_SELF, 1, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);
						if (GetIsObjectValid(oNearest)) {
							ClearAllActions();
							ActionAttack(oNearest, 0);
							return;
						}
					}
					return;
				}
				if ((sub8() == 1)) {
					sub3("GENERIC DEBUG *************** Terminating AI from Shields");
					return;
				}
				if ((sub11() == 1)) {
					return;
				}
				if ((sub7(intGLOB_111) == 1)) {
					if ((sub12() == 1)) {
						return;
					}
				}
				if ((sub7(intGLOB_105) == 1)) {
					if ((sub13(objectParam1) == 1)) {
						return;
					}
				}
				if ((nNPCStyle == 0)) {
					if ((sub32(objectParam1) == 1)) {
						return;
					}
				}
				else {
					if ((nNPCStyle == 4)) {
						if ((sub68(objectParam1) == 1)) {
							return;
						}
					}
					else {
						if ((nNPCStyle == 5)) {
							if ((sub69(objectParam1) == 1)) {
								return;
							}
						}
					}
				}
			}
		}
		}
		if (sub71()) {
			sub3("GENERIC DEBUG *************** DETERMINE COMBAT ROUND END");
		}
		sub3("GENERIC DEBUG *************** WARNING DETERMINE COMBAT ROUND FAILURE");
	}
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oSpeaker = GetPCSpeaker();
	ChangeToStandardFaction(OBJECT_SELF, 1);
	object object3 = GetItemPossessedBy(OBJECT_SELF, "G_w_VbrDblswd01");
	if (GetIsObjectValid(object3)) {
		ClearAllActions();
		ActionEquipItem(object3, 4, 0);
		sub1("Sword valid", 10, 10, 4.0);
	}
	else {
		sub1("Sword not valid", 10, 10, 4.0);
	}
	DelayCommand(0.5, sub2(oSpeaker));
	sub80(4);
	sub1("Shaardan Hostile", 8, 8, 10.0);
}
