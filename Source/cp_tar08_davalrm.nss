////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k_ptar_davalarm in tar_m08aa (Taris Davik's Estate).

	This is the original script that fired when certain guest conversations
	end with the subject going hostile. An intermediary script was added
	to equip the first weapon in their inventory if unarmed before firing
	this script to prevent the attacking with fists AI problem. See also
	k_ptar_davalarm.

	DP 2019-05-09                                                             */
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
	int intGLOB_28 = 1;
	int intGLOB_29 = 2;
	int intGLOB_30 = 3;
	int intGLOB_31 = 4;
	int intGLOB_32 = 5;
	int intGLOB_33 = 6;
	int intGLOB_34 = 3;
	int intGLOB_35 = 4;
	int intGLOB_36 = 5;
	int intGLOB_37 = 6;
	int intGLOB_38 = 7;
	int intGLOB_39 = 1;
	int intGLOB_40 = 2;
	int intGLOB_41 = 3;
	int intGLOB_42 = 4;
	int intGLOB_43 = 5;
	int intGLOB_44 = 6;
	int intGLOB_45 = 7;
	int intGLOB_46 = 8;
	int intGLOB_47 = 9;
	int intGLOB_48 = 10;
	int intGLOB_49 = 11;
	int intGLOB_50 = 12;
	int intGLOB_51 = 13;
	int intGLOB_52 = 14;
	int intGLOB_53 = 15;
	int intGLOB_54 = 16;
	int intGLOB_55 = 17;
	int intGLOB_56 = 18;
	int intGLOB_57 = 19;
	int intGLOB_58 = 20;
	int intGLOB_59 = 21;
	int intGLOB_60 = 22;
	int intGLOB_61 = 23;
	int intGLOB_62 = 24;
	int intGLOB_63 = 25;
	int intGLOB_64 = 26;
	int intGLOB_65 = 27;
	int intGLOB_66 = 28;
	int intGLOB_67 = 29;
	int intGLOB_68 = 30;
	int intGLOB_69 = 59;
	int intGLOB_70 = 0;
	int intGLOB_71 = 1;
	int intGLOB_72 = 2;
	int intGLOB_73 = 29;
	int intGLOB_74 = 30;
	int intGLOB_75 = 34;
	int intGLOB_76 = 35;
	int intGLOB_77 = 36;
	int intGLOB_78 = 37;
	int intGLOB_79 = 38;
	int intGLOB_80 = 39;
	int intGLOB_81 = 41;
	int intGLOB_82 = 42;
	int intGLOB_83 = 46;
	int intGLOB_84 = 47;
	int intGLOB_85 = 15;
	int intGLOB_86 = 10;
	int intGLOB_87 = 5;
	int intGLOB_88 = 2;
	struct structtype1 structGLOB_1;
	int intGLOB_98 = 1;
	int intGLOB_99 = 2;
	int intGLOB_100 = 3;
	int intGLOB_101 = 20;
	int intGLOB_102 = 21;
	int intGLOB_103 = 22;
	int intGLOB_104 = 23;
	int intGLOB_105 = 24;
	int intGLOB_106 = 25;
	int intGLOB_107 = 26;
	int intGLOB_108 = 27;
	int intGLOB_109 = 28;
	int intGLOB_110 = 31;
	int intGLOB_111 = 32;
	int intGLOB_112 = 33;
	int intGLOB_113 = 40;
	int intGLOB_114 = 43;
	int intGLOB_115 = 44;
	int intGLOB_116 = 45;
	int intGLOB_117 = 48;
	int intGLOB_118 = 49;
	int intGLOB_119 = 50;
	int intGLOB_120 = 51;
	int intGLOB_121 = 52;
	int intGLOB_122 = 53;
	int intGLOB_123 = 54;
	int intGLOB_124 = 55;
	int intGLOB_125 = 56;
	int intGLOB_126 = 57;
	int intGLOB_127 = 58;
	int intGLOB_128 = 60;
	int intGLOB_129 = 61;
	int intGLOB_130 = 62;
	int intGLOB_131 = 63;
	int intGLOB_132 = 64;
	int intGLOB_133 = 65;
	int intGLOB_134 = 66;
	int intGLOB_135 = 67;
	int intGLOB_136 = 68;
	int intGLOB_137 = 69;
	int intGLOB_138 = 70;
	int intGLOB_139 = 71;
	int intGLOB_140 = 72;
	int intGLOB_141 = 1;
	int intGLOB_142 = 2;
	int intGLOB_143 = 3;
	int intGLOB_144 = 4;

// Prototypes
void sub80(string stringParam1, int intParam2, int intParam3, float floatParam4);
void sub79();
int sub78(int intParam1, int intParam2);
void sub77();
void sub76(string stringParam1);
int sub75(object objectParam1);
void sub74();
int sub73();
int sub72();
object sub71(object objectParam1);
int sub70(object objectParam1);
int sub69(object objectParam1);
talent sub68(object objectParam1, talent talentParam2);
int sub67(int intParam1);
int sub66(int intParam1);
int sub65();
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
talent sub52(int intParam1);
string sub51(int intParam1);
int sub50();
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
int sub37(int intParam1);
int sub36(int intParam1);
talent sub35(int intParam1);
object sub34();
int sub33(object objectParam1);
talent sub32(object objectParam1, talent talentParam2);
talent sub31(object objectParam1, talent talentParam2);
int sub30();
object sub29();
int sub28();
talent sub27(int intParam1);
talent sub26(int intParam1);
talent sub25(int intParam1);
talent sub24(int intParam1, int intParam2);
int sub23(object objectParam1, float floatParam2);
int sub22(object objectParam1, float floatParam2);
object sub21();
int sub20();
int sub19(object objectParam1);
int sub18();
object sub17(int intParam1);
int sub16(int intParam1, object objectParam2);
object sub15();
int sub14(object objectParam1);
int sub13();
int sub12();
void sub11(int intParam1, int intParam2);
string sub10(int intParam1);
int sub9();
int sub8(int intParam1);
string sub7(object objectParam1);
void sub6();
string sub5(object objectParam1);
void sub4(string stringParam1);
void sub3(object objectParam1);
void sub2();
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub80(string stringParam1, int intParam2, int intParam3, float floatParam4) {
}

void sub79() {
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
						sub11(intGLOB_73, 0);
						ActionPlayAnimation(24, 1.0, 20.4);
						ActionDoCommand(sub11(intGLOB_73, 1));
					}
					else {
						if ((GetGender(OBJECT_SELF) == 1)) {
							sub11(intGLOB_73, 0);
							ActionPlayAnimation(24, 1.0, 13.3);
							ActionDoCommand(sub11(intGLOB_73, 1));
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
								sub11(intGLOB_73, 0);
								ActionPlayAnimation(1, 1.0, 5.0);
								ActionDoCommand(sub11(intGLOB_73, 1));
							}
						}
					}
				}
			}
		}
	}
}

int sub78(int intParam1, int intParam2) {
	int int1;
	int int2 = sub8(intGLOB_81);
	if (((intParam1 == intParam2) && (int2 == 0))) {
		int1 = (-1);
		sub11(intGLOB_81, 1);
	}
	else {
		if (((intParam2 == 1) && (int2 == 1))) {
			int1 = 1;
			sub11(intGLOB_81, 0);
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

void sub77() {
	if ((!sub8(intGLOB_82))) {
		string string1 = "POST_";
		string string2 = "WP_";
		string string3;
		int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_70);
		int int4 = GetLocalNumber(OBJECT_SELF, intGLOB_71);
		int int6 = GetLocalNumber(OBJECT_SELF, intGLOB_72);
		if (((nLocal < 10) && (nLocal > 0))) {
			string3 = ("0" + IntToString(nLocal));
		}
		else {
			if ((nLocal == 0)) {
				if (sub8(intGLOB_79)) {
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
		int int14 = sub8(intGLOB_80);
		if ((GetDistanceToObject2D(object3) <= 2.5)) {
			int int16;
			if (sub8(intGLOB_79)) {
				nLocal = (Random(int4) + 1);
			}
			else {
				if (((nLocal < int4) && (!sub8(intGLOB_79)))) {
					int16 = sub78(int4, nLocal);
					nLocal = (nLocal + int16);
				}
				else {
					if ((nLocal == int4)) {
						int16 = sub78(int4, nLocal);
						if (sub8(intGLOB_75)) {
							sub11(intGLOB_82, 1);
						}
						else {
							if (sub8(intGLOB_76)) {
								nLocal = 1;
								sub11(intGLOB_81, 0);
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
			if (sub8(intGLOB_78)) {
				nRandom = d3(1);
			}
			else {
				if (sub8(intGLOB_83)) {
					nRandom = (d6(1) + 6);
				}
				else {
					if (sub8(intGLOB_84)) {
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
			ActionForceMoveToObject(object3, sub8(intGLOB_80), 2.5, float3);
			if (sub8(intGLOB_73)) {
				ActionDoCommand(sub79());
			}
			SetLocalNumber(OBJECT_SELF, intGLOB_70, nLocal);
			if ((string2 != "UNKNOWN")) {
				ActionDoCommand(sub77());
			}
		}
	}
}

void sub76(string stringParam1) {
	if ((!ShipBuild())) {
		PrintString(stringParam1);
	}
}

int sub75(object objectParam1) {
	string string1 = (("WP_" + GetTag(objectParam1)) + "_01");
	string string3 = ("POST_" + GetTag(objectParam1));
	int nLocal = GetLocalNumber(objectParam1, intGLOB_72);
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
	sub76(("Walk Initiate for " + GetTag(objectParam1)));
	sub76(("TAG WAY FOUND = " + IntToString(GetIsObjectValid(oWP))));
	sub76(("WAY POINT NAME = " + GetTag(oWP)));
	sub76(("SERIES INT = " + IntToString(nLocal)));
	sub76(("SERIES WAY FOUND = " + IntToString(GetIsObjectValid(object3))));
	sub76(("SERIES Series Tag = " + string8));
	sub76("");
	if (((GetIsObjectValid(oWP) || GetIsObjectValid(object3)) || GetIsObjectValid(object5))) {
		return 1;
	}
	return 0;
}

void sub74() {
	int int1 = sub72();
}

int sub73() {
	sub4("GENERIC DEBUG *************** Start Commoner AI");
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
		sub4("GENERIC DEBUG *************** Clear 2710");
		ClearAllActions();
		ActionMoveAwayFromObject(oNearest, 1, 20.0);
		DelayCommand(0.2, ActionDoCommand(sub74()));
		return 1;
	}
	else {
		if (GetIsObjectValid(object3)) {
			sub4(("GENERIC DEBUG *************** Object Flee = " + sub5(object3)));
			sub4("GENERIC DEBUG *************** Clear 2720");
			ClearAllActions();
			ActionMoveAwayFromObject(object3, 1, 20.0);
			DelayCommand(0.2, ActionDoCommand(sub74()));
			return 1;
		}
	}
	return 0;
}

int sub72() {
	sub4(("GENERIC DEBUG *************** Post DCR Checks for " + sub5(OBJECT_SELF)));
	if ((sub8(intGLOB_128) && (!sub8(intGLOB_129)))) {
		if (sub73()) {
			return 1;
		}
	}
	else {
		if (sub8(intGLOB_129)) {
			sub4("GENERIC DEBUG *************** Clear 1000");
			ClearAllActions();
			return 1;
		}
	}
	if (((!IsObjectPartyMember(OBJECT_SELF)) && (sub75(OBJECT_SELF) == 1))) {
		sub4("GENERIC DEBUG *************** Clear 1100");
		ClearAllActions();
		DelayCommand(1.0, sub77());
		return 1;
	}
	else {
		if ((((GetPartyMemberByIndex(0) != OBJECT_SELF) && (!GetIsObjectValid(GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF)))) && IsObjectPartyMember(OBJECT_SELF))) {
			if ((!GetSoloMode())) {
				sub80("NO TARGET: FOLLOW LEADER", 10, 10, 4.0);
				CancelCombat(OBJECT_SELF);
				sub4("GENERIC DEBUG *************** Clear 1200");
				ClearAllActions();
				ActionFollowLeader();
			}
			return 1;
		}
	}
	return 0;
}

object sub71(object objectParam1) {
	sub4("GENERIC DEBUG *************** Starting: Determine Attack Target");
	int nStyle = GetPartyAIStyle();
	int nNPCStyle = GetNPCAIStyle(OBJECT_SELF);
	object object1;
	object oLastTarget = GetLastHostileTarget(OBJECT_SELF);
	sub4(((("GENERIC DEBUG *************** Intruder = " + IntToString(GetIsObjectValid(objectParam1))) + " Last Target = ") + IntToString(GetIsObjectValid(oLastTarget))));
	if (((GetIsObjectValid(objectParam1) && (!GetIsDead(objectParam1))) && (!GetIsDebilitated(objectParam1)))) {
		sub4(("GENERIC DEBUG *************** Intruder Target Returned = " + ObjectToString(objectParam1)));
		return objectParam1;
	}
	else {
		if (((GetIsObjectValid(oLastTarget) && (!GetIsDead(oLastTarget))) && (!GetIsDebilitated(oLastTarget)))) {
			sub4(("GENERIC DEBUG *************** Last Target Returned = " + ObjectToString(objectParam1)));
			return oLastTarget;
		}
		else {
			if ((nStyle == 0)) {
				int int13 = 1;
				sub4("GENERIC DEBUG *************** Getting nearest target - 249");
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
						sub4("GENERIC DEBUG *************** Getting nearest target - 262");
						object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
					}
					else {
						oLastActor = GetLastHostileTarget(GetPartyMemberByIndex(0));
						if (GetIsObjectValid(oLastActor)) {
							sub4("GENERIC DEBUG *************** Getting nearest target - 269");
							object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
						}
					}
				}
				else {
					if ((nStyle != 2)) {
						sub4("GENERIC DEBUG *************** Getting nearest target - 275");
						object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
					}
					else {
						sub4("GENERIC DEBUG *************** Getting nearest target - 279");
						object1 = GetNearestCreature(3, 1, OBJECT_SELF, 1, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
					}
				}
			}
		}
	}
	if (GetIsObjectValid(object1)) {
		sub4(("GENERIC DEBUG *************** Attack Target From Determine Attack Target = " + sub5(object1)));
		return object1;
	}
	sub4("GENERIC DEBUG *************** No Attack Targets Found");
	return OBJECT_INVALID;
}

int sub70(object objectParam1) {
	object object1 = sub34();
	talent talent1;
	object object3;
	if ((GetRacialType(OBJECT_SELF) == 5)) {
		return sub33(OBJECT_INVALID);
	}
	if (sub16(intGLOB_144, OBJECT_SELF)) {
		return 1;
	}
	if (GetIsObjectValid(object1)) {
		if (sub16(intGLOB_142, object1)) {
			return 1;
		}
	}
	object object4 = sub15();
	if (GetIsObjectValid(object4)) {
		if (sub16(intGLOB_143, object4)) {
			return 1;
		}
	}
	object3 = sub29();
	sub4(("GENERIC DEBUG *************** Jedi Support AI: AOE Target = " + sub10(GetIsObjectValid(object3))));
	if (GetIsObjectValid(object3)) {
		if ((GetRacialType(object3) == 5)) {
			talent1 = sub24(intGLOB_29, 1);
		}
		else {
			talent1 = sub24(intGLOB_29, 0);
		}
	}
	else {
		sub4("GENERIC DEBUG *************** Jedi Support AI: Inside the Party AI Section");
		object3 = sub71(OBJECT_INVALID);
		sub4(("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + sub5(object3)));
		if (GetIsObjectValid(object3)) {
			sub4(("GENERIC DEBUG *************** Jedi Support AI: Valid oTarget Set As = " + sub5(object3)));
			if ((GetRacialType(object3) == 5)) {
				talent1 = sub24(intGLOB_30, 1);
			}
			else {
				talent1 = sub24(intGLOB_30, 0);
			}
		}
	}
	talent1 = sub31(object3, talent1);
	talent1 = sub32(object3, talent1);
	if ((GetIsObjectValid(object3) && GetIsTalentValid(talent1))) {
		sub4("GENERIC DEBUG *************** Clear 1450");
		ClearAllActions();
		ActionUseTalentOnObject(talent1, object3);
		return 1;
	}
	sub4("GENERIC DEBUG *************** Jedi Support AI: Fall Through");
	return sub33(OBJECT_INVALID);
}

int sub69(object objectParam1) {
	if ((IsObjectPartyMember(OBJECT_SELF) || (d100(1) > 50))) {
		int int3 = 0;
		talent talent1;
		object object1 = sub21();
		if ((GetRacialType(object1) == 5)) {
			int3 = 1;
		}
		talent1 = sub25(int3);
		if (((GetIsObjectValid(object1) && GetIsTalentValid(talent1)) && GetCreatureHasTalent(talent1, OBJECT_SELF))) {
			sub4("GENERIC DEBUG *************** Clear 1400");
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			return 1;
		}
		sub4("GENERIC DEBUG *************** Grenade AI Failure");
		return sub33(objectParam1);
	}
	return 0;
}

talent sub68(object objectParam1, talent talentParam2) {
	int int1;
	sub4("GENERIC DEBUG *************** Starting Droid Talent Double Check");
	if ((GetTypeFromTalent(talentParam2) == 0)) {
		sub4("GENERIC DEBUG *************** Droid Talent is a Spell");
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

int sub67(int intParam1) {
	int int1;
	int nRandom = d4(1);
	if ((sub19(OBJECT_SELF) != 0)) {
		while ((int1 == 0)) {
			if ((sub19(OBJECT_SELF) == 1)) {
				if ((nRandom == 1)) {
					nRandom = intGLOB_44;
				}
				else {
					if ((nRandom == 2)) {
						nRandom = intGLOB_46;
					}
					else {
						if ((nRandom == 3)) {
							nRandom = intGLOB_45;
						}
						else {
							if ((nRandom == 4)) {
								nRandom = intGLOB_43;
							}
						}
					}
				}
			}
			else {
				if ((sub19(OBJECT_SELF) == 2)) {
					if ((nRandom == 1)) {
						nRandom = intGLOB_40;
					}
					else {
						if ((nRandom == 2)) {
							nRandom = intGLOB_42;
						}
						else {
							if ((nRandom == 3)) {
								nRandom = intGLOB_41;
							}
							else {
								if ((nRandom == 4)) {
									nRandom = intGLOB_39;
								}
							}
						}
					}
				}
			}
			int1 = sub37(nRandom);
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

int sub66(int intParam1) {
	int int1 = 0;
	int nRandom = d6(1);
	while ((int1 == 0)) {
		if ((nRandom == 1)) {
			nRandom = intGLOB_40;
		}
		else {
			if ((nRandom == 2)) {
				nRandom = intGLOB_42;
			}
			else {
				if ((nRandom == 3)) {
					nRandom = intGLOB_41;
				}
				else {
					if ((nRandom == 4)) {
						nRandom = intGLOB_39;
					}
					else {
						if (((nRandom == 5) || (nRandom == 6))) {
							if (((IsObjectPartyMember(OBJECT_SELF) && (GetNPCAIStyle(OBJECT_SELF) == 5)) || (!IsObjectPartyMember(OBJECT_SELF)))) {
								if ((nRandom == 5)) {
									nRandom = intGLOB_66;
								}
								else {
									if ((nRandom == 6)) {
										nRandom = intGLOB_67;
									}
								}
							}
							else {
								nRandom = intGLOB_68;
							}
						}
					}
				}
			}
		}
		int1 = sub37(nRandom);
		if ((int1 == 0)) {
			nRandom = d6(1);
		}
	}
	return nRandom;
}

int sub65() {
	talent talBest = GetCreatureTalentBest(4481, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
	if ((GetIsTalentValid(talBest) && GetCreatureHasTalent(talBest, OBJECT_SELF))) {
		int nTalent = GetIdFromTalent(talBest);
		return nTalent;
	}
	return (-1);
}

int sub64() {
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

int sub63() {
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

int sub62() {
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

int sub61() {
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

int sub60() {
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

int sub59() {
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

int sub58() {
	talent talBest = GetCreatureTalentBest(4356, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
	if ((GetIsTalentValid(talBest) && GetCreatureHasTalent(talBest, OBJECT_SELF))) {
		int nTalent = GetIdFromTalent(talBest);
		return nTalent;
	}
	return (-1);
}

int sub57() {
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

int sub56() {
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

int sub55() {
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

int sub54() {
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

int sub53() {
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

talent sub52(int intParam1) {
	SetLocalBoolean(OBJECT_SELF, intGLOB_69, 0);
	int nLocal = GetLocalNumber(OBJECT_SELF, intGLOB_35);
	talent talFeat;
	talent talent2;
	int nTalent = (-1);
	int int4 = 0;
	int int5 = 0;
	if ((intParam1 == intGLOB_52)) {
		if ((nLocal == 1)) {
			nTalent = sub53();
		}
		else {
			if ((nLocal == 2)) {
				nTalent = sub54();
			}
			else {
				nTalent = sub55();
			}
		}
	}
	else {
		if ((intParam1 == intGLOB_53)) {
			if ((nLocal == 1)) {
				nTalent = sub56();
				int5 = 1;
			}
			else {
				if ((nLocal == 2)) {
					nTalent = sub57();
					int5 = 1;
				}
				else {
					nTalent = sub58();
					int4 = 1;
				}
			}
		}
		else {
			if ((intParam1 == intGLOB_54)) {
				if ((nLocal == 1)) {
					nTalent = sub59();
				}
				else {
					if ((nLocal == 2)) {
						nTalent = sub58();
						int4 = 1;
					}
					else {
						nTalent = sub58();
						int4 = 1;
					}
				}
			}
			else {
				if ((intParam1 == intGLOB_55)) {
					if ((nLocal == 1)) {
						nTalent = sub60();
					}
					else {
						if ((nLocal == 2)) {
							nTalent = sub58();
							int4 = 1;
						}
						else {
							nTalent = sub58();
							int4 = 1;
						}
					}
				}
				else {
					if ((intParam1 == intGLOB_56)) {
						if ((nLocal == 1)) {
							nTalent = sub53();
						}
						else {
							if ((nLocal == 2)) {
								nTalent = sub61();
							}
							else {
								nTalent = sub58();
								int4 = 1;
							}
						}
					}
					else {
						if ((intParam1 == intGLOB_57)) {
							if ((nLocal == 1)) {
								nTalent = sub61();
							}
							else {
								if ((nLocal == 2)) {
									nTalent = sub54();
								}
								else {
									nTalent = sub62();
								}
							}
						}
						else {
							if ((intParam1 == intGLOB_58)) {
								if ((nLocal == 1)) {
									nTalent = sub59();
								}
								else {
									if ((nLocal == 2)) {
										nTalent = sub54();
									}
									else {
										nTalent = sub55();
									}
								}
							}
							else {
								if ((intParam1 == intGLOB_59)) {
									if ((nLocal == 1)) {
										nTalent = sub60();
									}
									else {
										if ((nLocal == 2)) {
											nTalent = sub54();
										}
										else {
											nTalent = sub55();
										}
									}
								}
								else {
									if ((intParam1 == intGLOB_60)) {
										if ((nLocal == 1)) {
											nTalent = sub53();
										}
										else {
											if ((nLocal == 2)) {
												nTalent = sub63();
											}
											else {
												nTalent = sub54();
											}
										}
									}
									else {
										if ((intParam1 == intGLOB_61)) {
											if ((nLocal == 1)) {
												nTalent = sub58();
												int4 = 1;
											}
											else {
												if ((nLocal == 2)) {
													nTalent = sub63();
												}
												else {
													nTalent = sub58();
													int4 = 1;
												}
											}
										}
										else {
											if ((intParam1 == intGLOB_62)) {
												if ((nLocal == 1)) {
													nTalent = sub63();
												}
												else {
													if ((nLocal == 2)) {
														nTalent = sub54();
													}
													else {
														nTalent = sub62();
													}
												}
											}
											else {
												if ((intParam1 == intGLOB_63)) {
													if ((nLocal == 1)) {
														nTalent = sub58();
														int4 = 1;
													}
													else {
														if ((nLocal == 2)) {
															nTalent = sub58();
															int4 = 1;
														}
														else {
															nTalent = sub54();
														}
													}
												}
												else {
													if ((intParam1 == intGLOB_64)) {
														if ((nLocal == 1)) {
															nTalent = sub61();
														}
														else {
															if ((nLocal == 2)) {
																nTalent = sub58();
																int4 = 1;
															}
															else {
																nTalent = sub54();
															}
														}
													}
													else {
														if ((intParam1 == intGLOB_65)) {
															if ((nLocal == 1)) {
																nTalent = sub63();
															}
															else {
																if ((nLocal == 2)) {
																	nTalent = sub64();
																}
																else {
																	nTalent = sub58();
																	int4 = 1;
																}
															}
														}
														else {
															if ((intParam1 == intGLOB_43)) {
																nTalent = sub58();
																int4 = 1;
															}
															else {
																if ((intParam1 == intGLOB_44)) {
																	if (((nLocal == 1) || (nLocal == 2))) {
																		nTalent = sub58();
																		int4 = 1;
																	}
																}
																else {
																	if ((intParam1 == intGLOB_45)) {
																		if (((nLocal == 1) || (nLocal == 2))) {
																			nTalent = sub58();
																			int4 = 1;
																		}
																	}
																	else {
																		if (((intParam1 == intGLOB_46) || (intParam1 == intGLOB_42))) {
																			sub4("GENERIC DEBUG *************** Melee/Ranged Breather");
																		}
																		else {
																			if ((intParam1 == intGLOB_39)) {
																				nTalent = sub65();
																				int4 = 1;
																			}
																			else {
																				if ((intParam1 == intGLOB_40)) {
																					if (((nLocal == 1) || (nLocal == 2))) {
																						nTalent = sub65();
																						int4 = 1;
																					}
																				}
																				else {
																					if ((intParam1 == intGLOB_41)) {
																						if (((nLocal == 1) || (nLocal == 2))) {
																							nTalent = sub65();
																							int4 = 1;
																						}
																					}
																					else {
																						if ((intParam1 == intGLOB_47)) {
																							talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																						}
																						else {
																							if ((intParam1 == intGLOB_48)) {
																								if ((nLocal == 1)) {
																									talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																								}
																								else {
																									talFeat = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
																								}
																							}
																							else {
																								if ((intParam1 == intGLOB_49)) {
																									if ((nLocal == 1)) {
																										talFeat = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
																									}
																									else {
																										talFeat = GetCreatureTalentRandom(61951, OBJECT_SELF, 0);
																									}
																								}
																								else {
																									if ((intParam1 == intGLOB_50)) {
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
																										if ((intParam1 == intGLOB_51)) {
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
																											if ((intParam1 == intGLOB_66)) {
																												if ((nLocal == 1)) {
																													nTalent = sub65();
																													int4 = 1;
																												}
																												if ((nLocal == 2)) {
																													nTalent = sub65();
																													int4 = 1;
																												}
																												if ((nLocal == 3)) {
																													talFeat = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
																												}
																											}
																											else {
																												if ((intParam1 == intGLOB_67)) {
																													if ((nLocal == 1)) {
																														talFeat = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
																													}
																													if ((nLocal == 2)) {
																														nTalent = sub65();
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
	SetLocalNumber(OBJECT_SELF, intGLOB_35, nLocal);
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

string sub51(int intParam1) {
	if ((intParam1 == intGLOB_39)) {
		return "SW_COMBO_RANGED_FEROCIOUS";
	}
	else {
		if ((intParam1 == intGLOB_40)) {
			return "SW_COMBO_RANGED_AGGRESSIVE";
		}
		else {
			if ((intParam1 == intGLOB_41)) {
				return "SW_COMBO_RANGED_DISCIPLINED";
			}
			else {
				if ((intParam1 == intGLOB_42)) {
					return "SW_COMBO_RANGED_CAUTIOUS";
				}
				else {
					if ((intParam1 == intGLOB_43)) {
						return "SW_COMBO_MELEE_FEROCIOUS";
					}
					else {
						if ((intParam1 == intGLOB_44)) {
							return "SW_COMBO_MELEE_AGGRESSIVE";
						}
						else {
							if ((intParam1 == intGLOB_45)) {
								return "SW_COMBO_MELEE_DISCIPLINED";
							}
							else {
								if ((intParam1 == intGLOB_46)) {
									return "SW_COMBO_MELEE_CAUTIOUS";
								}
								else {
									if ((intParam1 == intGLOB_47)) {
										return "SW_COMBO_BUFF_PARTY";
									}
									else {
										if ((intParam1 == intGLOB_48)) {
											return "SW_COMBO_BUFF_DEBILITATE";
										}
										else {
											if ((intParam1 == intGLOB_49)) {
												return "SW_COMBO_BUFF_DAMAGE";
											}
											else {
												if ((intParam1 == intGLOB_50)) {
													return "SW_COMBO_BUFF_DEBILITATE_DESTROY";
												}
												else {
													if ((intParam1 == intGLOB_51)) {
														return "SW_COMBO_SUPRESS_DEBILITATE_DESTROY";
													}
													else {
														if ((intParam1 == intGLOB_52)) {
															return "SW_COMBO_SITH_ATTACK";
														}
														else {
															if ((intParam1 == intGLOB_53)) {
																return "SW_COMBO_BUFF_ATTACK";
															}
															else {
																if ((intParam1 == intGLOB_54)) {
																	return "SW_COMBO_SITH_CONFOUND";
																}
																else {
																	if ((intParam1 == intGLOB_55)) {
																		return "SW_COMBO_JEDI_SMITE";
																	}
																	else {
																		if ((intParam1 == intGLOB_56)) {
																			return "SW_COMBO_SITH_TAUNT";
																		}
																		else {
																			if ((intParam1 == intGLOB_57)) {
																				return "SW_COMBO_SITH_BLADE";
																			}
																			else {
																				if ((intParam1 == intGLOB_58)) {
																					return "SW_COMBO_SITH_CRUSH";
																				}
																				else {
																					if ((intParam1 == intGLOB_59)) {
																						return "SW_COMBO_JEDI_CRUSH";
																					}
																					else {
																						if ((intParam1 == intGLOB_60)) {
																							return "SW_COMBO_SITH_BRUTALIZE";
																						}
																						else {
																							if ((intParam1 == intGLOB_61)) {
																								return "SW_COMBO_SITH_DRAIN";
																							}
																							else {
																								if ((intParam1 == intGLOB_62)) {
																									return "SW_COMBO_SITH_ESCAPE";
																								}
																								else {
																									if ((intParam1 == intGLOB_63)) {
																										return "SW_COMBO_JEDI_BLITZ";
																									}
																									else {
																										if ((intParam1 == intGLOB_64)) {
																											return "SW_COMBO_SITH_SPIKE";
																										}
																										else {
																											if ((intParam1 == intGLOB_65)) {
																												return "SW_COMBO_SITH_SCYTHE";
																											}
																											else {
																												if ((intParam1 == intGLOB_66)) {
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

int sub50() {
	talent talRandom = GetCreatureTalentRandom(32768, OBJECT_SELF, 0);
	if (GetIsTalentValid(talRandom)) {
		return 1;
	}
	return 0;
}

int sub49() {
	if ((GetHasSpell(48, OBJECT_SELF) || GetHasSpell(19, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub48() {
	if ((GetHasSpell(15, OBJECT_SELF) || GetHasSpell(11, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub47() {
	if ((GetHasSpell(49, OBJECT_SELF) || GetHasSpell(4, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub46() {
	if (((GetHasSpell(45, OBJECT_SELF) || GetHasSpell(7, OBJECT_SELF)) || GetHasSpell(38, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub45() {
	if (((GetHasSpell(46, OBJECT_SELF) || GetHasSpell(29, OBJECT_SELF)) || GetHasSpell(44, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub44() {
	if (((GetHasSpell(43, OBJECT_SELF) || GetHasSpell(35, OBJECT_SELF)) || GetHasSpell(25, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub43() {
	if (((GetHasSpell(8, OBJECT_SELF) || GetHasSpell(37, OBJECT_SELF)) || GetHasSpell(34, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub42() {
	if (((GetHasSpell(17, OBJECT_SELF) || GetHasSpell(24, OBJECT_SELF)) || GetHasSpell(18, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub41() {
	if ((GetHasSpell(21, OBJECT_SELF) || GetHasSpell(3, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub40() {
	if (((GetHasSpell(9, OBJECT_SELF) || GetHasSpell(50, OBJECT_SELF)) || GetHasSpell(32, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub39() {
	if (((GetHasSpell(23, OBJECT_SELF) || GetHasSpell(27, OBJECT_SELF)) || GetHasSpell(26, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub38() {
	if (((((((((((((((GetHasSpell(9, OBJECT_SELF) || GetHasSpell(11, OBJECT_SELF)) || GetHasSpell(15, OBJECT_SELF)) || GetHasSpell(13, OBJECT_SELF)) || GetHasSpell(12, OBJECT_SELF)) || GetHasSpell(23, OBJECT_SELF)) || GetHasSpell(25, OBJECT_SELF)) || GetHasSpell(26, OBJECT_SELF)) || GetHasSpell(27, OBJECT_SELF)) || GetHasSpell(32, OBJECT_SELF)) || GetHasSpell(49, OBJECT_SELF)) || GetHasSpell(4, OBJECT_SELF)) || GetHasSpell(35, OBJECT_SELF)) || GetHasSpell(43, OBJECT_SELF)) || GetHasSpell(50, OBJECT_SELF))) {
		return 1;
	}
	return 0;
}

int sub37(int intParam1) {
	if ((intParam1 == intGLOB_68)) {
		return 0;
	}
	talent talRandom;
	talent talent2;
	if ((((intParam1 == intGLOB_43) || (intParam1 == intGLOB_44)) || (intParam1 == intGLOB_45))) {
		talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
		if ((GetIsTalentValid(talRandom) && GetCreatureHasTalent(talRandom, OBJECT_SELF))) {
			return 1;
		}
	}
	else {
		if ((intParam1 == intGLOB_42)) {
			return 1;
		}
		else {
			if ((((intParam1 == intGLOB_39) || (intParam1 == intGLOB_40)) || (intParam1 == intGLOB_41))) {
				if (((((((((GetHasFeat(31, OBJECT_SELF) || GetHasFeat(20, OBJECT_SELF)) || GetHasFeat(77, OBJECT_SELF)) || GetHasFeat(29, OBJECT_SELF)) || GetHasFeat(18, OBJECT_SELF)) || GetHasFeat(82, OBJECT_SELF)) || GetHasFeat(30, OBJECT_SELF)) || GetHasFeat(26, OBJECT_SELF)) || GetHasFeat(92, OBJECT_SELF))) {
					return 1;
				}
			}
			else {
				if ((intParam1 == intGLOB_46)) {
					return 1;
				}
				else {
					if ((intParam1 == intGLOB_47)) {
						talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
						if ((GetIsTalentValid(talRandom) && GetCreatureHasTalent(talRandom, OBJECT_SELF))) {
							return 1;
						}
					}
					else {
						if ((intParam1 == intGLOB_48)) {
							talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
							talent2 = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
							if ((((GetIsTalentValid(talRandom) && GetIsTalentValid(talent2)) && GetCreatureHasTalent(talRandom, OBJECT_SELF)) && GetCreatureHasTalent(talent2, OBJECT_SELF))) {
								return 1;
							}
						}
						else {
							if ((intParam1 == intGLOB_49)) {
								talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
								if ((GetIsTalentValid(talRandom) && sub38())) {
									return 1;
								}
							}
							else {
								if ((intParam1 == intGLOB_50)) {
									talRandom = GetCreatureTalentRandom(63743, OBJECT_SELF, 0);
									talent2 = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
									if (((GetIsTalentValid(talRandom) && GetIsTalentValid(talent2)) && sub38())) {
										return 1;
									}
								}
								else {
									if ((intParam1 == intGLOB_51)) {
										talRandom = GetCreatureTalentRandom(65327, OBJECT_SELF, 0);
										talent2 = GetCreatureTalentRandom(62207, OBJECT_SELF, 0);
										if (((GetIsTalentValid(talRandom) && GetIsTalentValid(talent2)) && sub38())) {
											return 1;
										}
									}
									else {
										if ((intParam1 == intGLOB_52)) {
											if (((sub39() && sub40()) && sub41())) {
												return 1;
											}
										}
										else {
											if ((intParam1 == intGLOB_53)) {
												talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
												if (((sub42() && sub43()) && GetIsTalentValid(talRandom))) {
													return 1;
												}
											}
											else {
												if ((intParam1 == intGLOB_54)) {
													talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
													if ((sub44() && GetIsTalentValid(talRandom))) {
														return 1;
													}
												}
												else {
													if ((intParam1 == intGLOB_55)) {
														talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
														if ((sub45() && GetIsTalentValid(talRandom))) {
															return 1;
														}
													}
													else {
														if ((intParam1 == intGLOB_56)) {
															talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
															if (((sub40() && sub46()) && GetIsTalentValid(talRandom))) {
																return 1;
															}
														}
														else {
															if ((intParam1 == intGLOB_57)) {
																if (((sub46() && sub39()) && sub47())) {
																	return 1;
																}
															}
															else {
																if ((intParam1 == intGLOB_58)) {
																	if (((sub44() && sub39()) && sub41())) {
																		return 1;
																	}
																}
																else {
																	if ((intParam1 == intGLOB_59)) {
																		if (((sub45() && sub39()) && sub41())) {
																			return 1;
																		}
																	}
																	else {
																		if ((intParam1 == intGLOB_59)) {
																			if (((sub40() && sub48()) && sub39())) {
																				return 1;
																			}
																		}
																		else {
																			if ((intParam1 == intGLOB_61)) {
																				talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																				if ((sub48() && GetIsTalentValid(talRandom))) {
																					return 1;
																				}
																			}
																			else {
																				if ((intParam1 == intGLOB_62)) {
																					if (((sub48() && sub39()) && sub47())) {
																						return 1;
																					}
																				}
																				else {
																					if ((intParam1 == intGLOB_63)) {
																						talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																						if ((sub39() && GetIsTalentValid(talRandom))) {
																							return 1;
																						}
																					}
																					else {
																						if ((intParam1 == intGLOB_64)) {
																							talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																							if (((sub39() && sub46()) && GetIsTalentValid(talRandom))) {
																								return 1;
																							}
																						}
																						else {
																							if ((intParam1 == intGLOB_65)) {
																								talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
																								if (((sub48() && sub49()) && GetIsTalentValid(talRandom))) {
																									return 1;
																								}
																							}
																							else {
																								if (((intParam1 == intGLOB_66) || (intParam1 == intGLOB_67))) {
																									object oLArmItem = GetItemInSlot(7, OBJECT_SELF);
																									object oRArmItem = GetItemInSlot(8, OBJECT_SELF);
																									sub4(((("GENERIC DEBUG *************** Droid Items = " + sub5(oLArmItem)) + " / ") + sub5(oRArmItem)));
																									if (sub50()) {
																										sub4("GENERIC DEBUG *************** Droid Utility Check is TRUE");
																										return 1;
																									}
																									sub4("GENERIC DEBUG *************** Droid Utility Check is FALSE");
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

int sub36(int intParam1) {
	int int1;
	int nRandom;
	while ((int1 == 0)) {
		if ((intParam1 == 0)) {
			nRandom = (Random(23) + 1);
			if (((nRandom == 1) || (nRandom == 2))) {
				return intGLOB_43;
			}
			else {
				if (((nRandom == 3) || (nRandom == 4))) {
					return intGLOB_44;
				}
				else {
					if (((nRandom == 5) || (nRandom == 6))) {
						return intGLOB_45;
					}
					else {
						if ((((nRandom == 7) || (nRandom == 8)) || (nRandom == 9))) {
							return intGLOB_46;
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
		int1 = sub37(nRandom);
	}
	return nRandom;
}

talent sub35(int intParam1) {
	int nRandom;
	int int2;
	talent talent1;
	int nNPCStyle = GetNPCAIStyle(OBJECT_SELF);
	sub4("GENERIC DEBUG *************** Starting GetComboMove");
	if (((structGLOB_1.int13 == 4) || (structGLOB_1.int13 == 0))) {
		SetLocalNumber(OBJECT_SELF, intGLOB_35, 0);
		SetLocalNumber(OBJECT_SELF, intGLOB_34, 0);
		nRandom = d6(1);
		if ((nRandom > 0)) {
			if ((((GetLevelByClass(4, OBJECT_SELF) > 0) || (GetLevelByClass(3, OBJECT_SELF) > 0)) || (GetLevelByClass(5, OBJECT_SELF) > 0))) {
				int2 = sub36(intParam1);
				sub4(("GENERIC DEBUG *************** Starting Jedi Combo " + sub51(int2)));
				SetLocalNumber(OBJECT_SELF, intGLOB_35, 1);
				SetLocalNumber(OBJECT_SELF, intGLOB_34, int2);
				return sub52(int2);
			}
			else {
				if (((GetLevelByClass(6, OBJECT_SELF) > 0) || (GetLevelByClass(7, OBJECT_SELF) > 0))) {
					int2 = sub66(intParam1);
					sub4(("GENERIC DEBUG *************** Starting Droid Combo " + sub51(int2)));
					SetLocalNumber(OBJECT_SELF, intGLOB_35, 1);
					SetLocalNumber(OBJECT_SELF, intGLOB_34, int2);
					return sub52(int2);
				}
				else {
					int2 = sub67(intParam1);
					sub4(("GENERIC DEBUG *************** Starting NPC Combo " + sub51(int2)));
					SetLocalNumber(OBJECT_SELF, intGLOB_35, 1);
					SetLocalNumber(OBJECT_SELF, intGLOB_34, int2);
					return sub52(int2);
				}
			}
		}
		else {
			return talent1;
		}
	}
	else {
		sub4(("GENERIC DEBUG *************** Continuing Combo " + sub51(structGLOB_1.int15)));
		return sub52(structGLOB_1.int15);
	}
	return talent1;
}

object sub34() {
	sub4("GENERIC DEBUG *************** Starting Poison Check");
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
	sub4("GENERIC DEBUG ***************  Returning Invalid Poison Object");
	return OBJECT_INVALID;
}

int sub33(object objectParam1) {
	object oNPC;
	object oNearest;
	int int1;
	talent talent1;
	oNPC = sub34();
	if (GetIsObjectValid(oNPC)) {
		if (sub16(intGLOB_142, oNPC)) {
			return 1;
		}
	}
	oNPC = sub15();
	if (GetIsObjectValid(oNPC)) {
		if (sub16(intGLOB_143, oNPC)) {
			return 1;
		}
	}
	talent1 = sub35(0);
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, intGLOB_69);
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
		sub4("GENERIC DEBUG *************** Default AI Debug Start *************************");
		sub4(("GENERIC DEBUG *************** Intruder    = " + sub5(objectParam1)));
		sub4(("GENERIC DEBUG *************** Last Target = " + sub5(oNPC)));
		sub4(("GENERIC DEBUG *************** Closest     = " + sub5(oNearest)));
		if ((((IsObjectPartyMember(OBJECT_SELF) && GetIsObjectValid(oNPC)) && (!GetIsDead(oNPC))) && GetObjectSeen(oNPC, OBJECT_SELF))) {
			oNPC = oNPC;
		}
		else {
			if ((GetIsObjectValid(objectParam1) && GetObjectSeen(objectParam1, OBJECT_SELF))) {
				sub4("GENERIC DEBUG *************** Intruder becomes Target");
				oNPC = objectParam1;
			}
			else {
				if ((GetIsObjectValid(oNearest) && GetObjectSeen(oNearest, OBJECT_SELF))) {
					if (((((!GetIsObjectValid(oNPC)) || (!GetIsEnemy(oNPC, OBJECT_SELF))) || GetIsDead(oNPC)) || (GetCurrentHitPoints(oNPC) < GetCurrentHitPoints(oNearest)))) {
						sub4("GENERIC DEBUG *************** Closest becomes Target");
						oNPC = oNearest;
					}
				}
			}
		}
	}
	if ((GetRacialType(OBJECT_SELF) == 5)) {
		talent1 = sub68(oNPC, talent1);
	}
	talent1 = sub31(oNPC, talent1);
	talent1 = sub32(oNPC, talent1);
	sub4("GENERIC DEBUG *************** Default AI Debug End ***************************");
	sub4(((("GENERIC DEBUG *************** Target = " + sub5(oNPC)) + " is Enemy: ") + IntToString(GetIsEnemy(oNPC, OBJECT_SELF))));
	if (GetIsObjectValid(oNPC)) {
		sub4("GENERIC DEBUG *************** Clear 1300");
		ClearAllActions();
		if (sub18()) {
			sub4("GENERIC DEBUG *************** Switching Weapons");
		}
		if ((GetIsTalentValid(talent1) && GetIsEnemy(oNPC, OBJECT_SELF))) {
			sub4("GENERIC DEBUG *************** Using Talent on Target");
			ActionUseTalentOnObject(talent1, oNPC);
			return 1;
		}
		else {
			if (GetIsEnemy(oNPC, OBJECT_SELF)) {
				sub4("GENERIC DEBUG *************** Action Attack by Default");
				ActionAttack(oNPC, 0);
				return 1;
			}
		}
	}
	sub4("GENERIC DEBUG *************** Default AI has failed to do an action");
	return 0;
}

talent sub32(object objectParam1, talent talentParam2) {
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

talent sub31(object objectParam1, talent talentParam2) {
	int int1 = 0;
	if ((GetTypeFromTalent(talentParam2) == 0)) {
		if (((GetIdFromTalent(talentParam2) == 49) || (GetIdFromTalent(talentParam2) == 4))) {
			sub4(("GENERIC DEBUG *************** Lightsaber Throw Check = " + FloatToString(GetDistanceBetween(OBJECT_SELF, objectParam1), 4, 2)));
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

int sub30() {
	sub4("GENERIC DEBUG *************** Boss AI: Start Targeted Action Routine");
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
	sub4((("GENERIC DEBUG *************** Boss AI: Get the #" + sub10(nRandom)) + " target"));
	object oNearest = GetNearestCreature(3, 1, OBJECT_SELF, int4, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
	sub4(("GENERIC DEBUG *************** Boss AI: Initial oFind Search = " + sub5(oNearest)));
	while ((GetIsObjectValid(oNearest) && (int4 <= nRandom))) {
		sub4(((("GENERIC DEBUG *************** Boss AI: Valid oFind = " + sub5(oNearest)) + " nCnt = ") + sub10(int4)));
		if (GetIsObjectValid(oNearest)) {
			sub4(("GENERIC DEBUG *************** Boss AI: Valid oTarget Set As = " + sub5(oNearest)));
			object1 = oNearest;
		}
		(int4++);
		oNearest = GetNearestCreature(3, 1, OBJECT_SELF, int4, 7, 7, 0xFFFFFFFF, 0xFFFFFFFF);
	}
	int int7 = 1;
	if ((int7 == 1)) {
		if (GetIsTalentValid(talent1)) {
			if ((GetTypeFromTalent(talent1) == 1)) {
				sub4(("GENERIC DEBUG *************** Boss AI: Talent Feat = " + sub10(GetIdFromTalent(talent1))));
			}
			else {
				if ((GetTypeFromTalent(talent1) == 0)) {
					sub4(("GENERIC DEBUG *************** Boss AI: Talent Power = " + sub10(GetIdFromTalent(talent1))));
				}
			}
		}
	}
	if (GetIsObjectValid(object1)) {
		if ((GetRacialType(object1) == 5)) {
			sub4("GENERIC DEBUG *************** Boss AI: Get Boss Combat Move AI Droid");
			int1 = 1;
		}
		talent1 = sub24(intGLOB_30, int1);
		talent1 = sub31(object1, talent1);
		talent1 = sub32(object1, talent1);
		sub4(("GENERIC DEBUG *************** Boss AI: Target = " + sub10(GetIsObjectValid(object1))));
		sub4(("GENERIC DEBUG *************** Boss AI: Talent = " + sub10(GetIsTalentValid(talent1))));
		if ((GetIsTalentValid(talent1) && GetIsObjectValid(object1))) {
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			sub4("GENERIC DEBUG *************** Boss AI: Targeted Power Success");
			return 1;
		}
	}
	sub4("GENERIC DEBUG *************** Boss AI: Targeted Failure");
	return 0;
}

object sub29() {
	int int1 = 0;
	int int2 = 0;
	object object1;
	object oShapeObject = GetFirstObjectInShape(4, 30.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	while (GetIsObjectValid(oShapeObject)) {
		int1 = sub23(oShapeObject, 4.0);
		if (((int1 > 2) && (int2 < int1))) {
			object1 = oShapeObject;
			int2 = int1;
		}
		oShapeObject = GetNextObjectInShape(4, 30.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	}
	return object1;
}

int sub28() {
	sub4("GENERIC DEBUG *************** Boss AI: AOE Function Starting");
	talent talent1;
	object object1 = sub29();
	sub4(("GENERIC DEBUG *************** Boss AI: AOE Target = " + sub10(GetIsObjectValid(object1))));
	int int2;
	if (GetIsObjectValid(object1)) {
		if ((GetRacialType(object1) == 5)) {
			(int2 == 1);
		}
		talent1 = sub24(intGLOB_29, int2);
		if (GetIsTalentValid(talent1)) {
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			sub4("GENERIC DEBUG *************** Boss AI: AOE Success");
			return 1;
		}
	}
	sub4("GENERIC DEBUG *************** Boss AI: AOE Failure");
	return 0;
}

talent sub27(int intParam1) {
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

talent sub26(int intParam1) {
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
	sub4(("GENERIC DEBUG *************** Last Force Power Used = " + sub10(nLastForce)));
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
	sub4(("GENERIC DEBUG *************** Force Power Returned = " + sub10(GetIdFromTalent(talent1))));
	return talent1;
}

talent sub25(int intParam1) {
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
	sub4("GENERIC DEBUG *************** Grenade Selection Failure");
	talent talent11;
	return talent11;
	return talent11;
}

talent sub24(int intParam1, int intParam2) {
	talent talent1;
	talent talRandom;
	int int1 = 0;
	if (((intParam1 == intGLOB_28) || (intParam1 == intGLOB_32))) {
		talRandom = sub25(intParam2);
		if (GetIsTalentValid(talRandom)) {
			sub4("GENERIC DEBUG *************** Boss AI: Grenade Talent Chosen");
			return talRandom;
		}
	}
	if (((intParam1 == intGLOB_29) || (intParam1 == intGLOB_32))) {
		talRandom = sub26(intParam2);
		if (GetIsTalentValid(talRandom)) {
			sub4("GENERIC DEBUG *************** Boss AI: AOE Force Power Talent Chosen");
			return talRandom;
		}
	}
	if (((intParam1 == intGLOB_30) || (intParam1 == intGLOB_32))) {
		if ((d100(1) > 50)) {
			talRandom = sub27(intParam2);
			if (GetIsTalentValid(talRandom)) {
				sub4("GENERIC DEBUG *************** Boss AI: Targeted Force Power Talent Chosen");
				return talRandom;
			}
			talRandom = sub26(intParam2);
			if (GetIsTalentValid(talRandom)) {
				sub4("GENERIC DEBUG *************** Boss AI: AOE Force Power Talent Chosen");
				return talRandom;
			}
		}
		if ((sub19(OBJECT_SELF) == 1)) {
			sub4("GENERIC DEBUG *************** Boss AI: Melee Feat Talent Chosen");
			talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
		}
		else {
			sub4("GENERIC DEBUG *************** Boss AI: Range Feat Talent Chosen");
			talRandom = GetCreatureTalentRandom(4369, OBJECT_SELF, 0);
		}
		if (GetIsTalentValid(talRandom)) {
			return talRandom;
		}
	}
	else {
		if (((intParam1 == intGLOB_31) || (intParam1 == intGLOB_32))) {
			if ((d100(1) > 70)) {
				talRandom = sub27(intParam2);
				if (GetIsTalentValid(talRandom)) {
					return talRandom;
				}
				talRandom = sub26(intParam2);
				if (GetIsTalentValid(talRandom)) {
					return talRandom;
				}
			}
			talRandom = GetCreatureTalentRandom(4356, OBJECT_SELF, 0);
			if (GetIsTalentValid(talRandom)) {
				return talRandom;
			}
			sub4("GENERIC DEBUG *************** Boss AI: No Feats Available");
		}
	}
	return talRandom;
}

int sub23(object objectParam1, float floatParam2) {
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

int sub22(object objectParam1, float floatParam2) {
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

object sub21() {
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
			int3 = sub22(oShapeObject, 4.0);
			int4 = sub23(oShapeObject, 4.0);
			if ((((int4 > int1) && (int3 == 0)) && (int5 < int4))) {
				object1 = oShapeObject;
				int5 = int4;
			}
		}
		oShapeObject = GetNextObjectInShape(4, 40.0, GetLocation(OBJECT_SELF), 0, 1, [0.0,0.0,0.0]);
	}
	return object1;
}

int sub20() {
	sub4("GENERIC DEBUG *************** Boss AI: Grenade Function Starting");
	talent talent1;
	object object1 = sub21();
	sub4(("GENERIC DEBUG *************** Boss AI: Grenade Target = " + sub10(GetIsObjectValid(object1))));
	int int2;
	if (GetIsObjectValid(object1)) {
		if ((GetRacialType(object1) == 5)) {
			(int2 == 1);
		}
		talent1 = sub24(intGLOB_28, int2);
		if (GetIsTalentValid(talent1)) {
			sub4("GENERIC DEBUG *************** Clear 1460");
			ClearAllActions();
			ActionUseTalentOnObject(talent1, object1);
			sub4("GENERIC DEBUG *************** Boss AI: AOE Success");
			return 1;
		}
	}
	sub4("GENERIC DEBUG *************** Boss AI: AOE Failure");
	return 0;
}

int sub19(object objectParam1) {
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
	sub4("GENERIC DEBUG *************** Return No Weapon Type");
	return 0;
}

int sub18() {
	object oInvItem;
	if (((((GetIsObjectValid(GetAttackTarget(OBJECT_SELF)) && (GetDistanceBetween(GetAttackTarget(OBJECT_SELF), OBJECT_SELF) <= 3.0)) && (sub19(OBJECT_SELF) != 1)) && (GetRacialType(OBJECT_SELF) == 6)) && (!IsObjectPartyMember(OBJECT_SELF)))) {
		oInvItem = GetFirstItemInInventory(OBJECT_SELF);
		while (GetIsObjectValid(oInvItem)) {
			sub4("GENERIC DEBUG *************** Checking Melee Weapon");
			if (((((((((((((((GetBaseItemType(oInvItem) == 9) || (GetBaseItemType(oInvItem) == 6)) || (GetBaseItemType(oInvItem) == 80)) || (GetBaseItemType(oInvItem) == 78)) || (GetBaseItemType(oInvItem) == 8)) || (GetBaseItemType(oInvItem) == 2)) || (GetBaseItemType(oInvItem) == 0)) || (GetBaseItemType(oInvItem) == 10)) || (GetBaseItemType(oInvItem) == 4)) || (GetBaseItemType(oInvItem) == 1)) || (GetBaseItemType(oInvItem) == 5)) || (GetBaseItemType(oInvItem) == 7)) || (GetBaseItemType(oInvItem) == 3)) || (GetBaseItemType(oInvItem) == 79))) {
				sub4("GENERIC DEBUG *************** Equipping Melee Weapon");
				ActionEquipMostDamagingMelee(OBJECT_INVALID, 0);
				return 1;
			}
			else {
				oInvItem = GetNextItemInInventory(OBJECT_SELF);
			}
		}
	}
	else {
		if (((((((sub19(OBJECT_SELF) != 2) && (GetLevelByClass(4, OBJECT_SELF) == 0)) && (GetLevelByClass(3, OBJECT_SELF) == 0)) && (GetLevelByClass(5, OBJECT_SELF) == 0)) && (GetDistanceBetween(GetAttemptedAttackTarget(), OBJECT_SELF) > 3.0)) && (!IsObjectPartyMember(OBJECT_SELF)))) {
			oInvItem = GetFirstItemInInventory(OBJECT_SELF);
			while (GetIsObjectValid(oInvItem)) {
				sub4("GENERIC DEBUG *************** Checking Ranged Weapon");
				if ((((((((((((((((GetBaseItemType(oInvItem) == 20) || (GetBaseItemType(oInvItem) == 12)) || (GetBaseItemType(oInvItem) == 77)) || (GetBaseItemType(oInvItem) == 19)) || (GetBaseItemType(oInvItem) == 16)) || (GetBaseItemType(oInvItem) == 21)) || (GetBaseItemType(oInvItem) == 13)) || (GetBaseItemType(oInvItem) == 24)) || (GetBaseItemType(oInvItem) == 14)) || (GetBaseItemType(oInvItem) == 15)) || (GetBaseItemType(oInvItem) == 18)) || (GetBaseItemType(oInvItem) == 23)) || (GetBaseItemType(oInvItem) == 17)) || (GetBaseItemType(oInvItem) == 22)) || (GetBaseItemType(oInvItem) == 17))) {
					sub4("GENERIC DEBUG *************** Equipping Ranged Weapon");
					ActionEquipMostDamagingRanged(OBJECT_INVALID);
					return 1;
				}
				else {
					oInvItem = GetNextItemInInventory(OBJECT_SELF);
				}
			}
		}
	}
	sub4("GENERIC DEBUG *************** Should not currently change weapons");
	return 0;
}

object sub17(int intParam1) {
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
		sub4("GENERIC DEBUG *************** Searching for Alternate Target");
		oNearest = GetNearestCreature(3, 1, OBJECT_SELF, 1, 0, 6, 0xFFFFFFFF, 0xFFFFFFFF);
		sub4(("GENERIC DEBUG *************** Alternate Target = " + sub5(oNearest)));
	}
	sub4(("GENERIC DEBUG *************** Heal Drain Target = " + sub10(intParam1)));
	sub4(("GENERIC DEBUG *************** Get Active Party Member: " + sub5(oNearest)));
	return oNearest;
}

int sub16(int intParam1, object objectParam2) {
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
		if ((intParam1 == intGLOB_141)) {
			int2 = 61473;
		}
		else {
			if ((intParam1 == intGLOB_142)) {
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
				if ((intParam1 == intGLOB_143)) {
					sub4(("GENERIC DEBUG *************** Starting Heal Talent Checks " + sub5(OBJECT_SELF)));
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
						sub4("GENERIC DEBUG *************** I have Heal or Cure");
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
									sub4("GENERIC DEBUG *************** I have Death Field");
									int3 = 1;
									int4 = 1;
									talent8 = talent7;
								}
								else {
									if ((GetCreatureHasTalent(talent6, OBJECT_SELF) && (!IsObjectPartyMember(OBJECT_SELF)))) {
										sub4("GENERIC DEBUG *************** I have Drain Life");
										int3 = 1;
										int4 = 1;
										talent8 = talent6;
									}
									else {
										sub4("GENERIC DEBUG *************** I have a Med Pack");
										int3 = 1;
										talent8 = talBest;
									}
								}
							}
						}
					}
				}
				else {
					if ((intParam1 == intGLOB_144)) {
						talSpell = TalentSpell(36);
						talent2 = TalentSpell(33);
						talent3 = TalentSpell(22);
						if (GetCreatureHasTalent(talSpell, OBJECT_SELF)) {
							int3 = 1;
							talent8 = talSpell;
						}
						else {
							if (GetCreatureHasTalent(talent2, OBJECT_SELF)) {
								int3 = 1;
								talent8 = talent2;
							}
							else {
								if (GetCreatureHasTalent(talent3, OBJECT_SELF)) {
									int3 = 1;
									talent8 = talent3;
								}
							}
						}
						if (((((!GetHasSpellEffect(36, OBJECT_SELF)) && (!GetHasSpellEffect(33, OBJECT_SELF))) && (!GetHasSpellEffect(22, OBJECT_SELF))) && (int3 == 1))) {
							sub4("GENERIC DEBUG *************** I do have VALOR");
							int3 = 1;
						}
						else {
							sub4("GENERIC DEBUG *************** I do not have VALOR");
							int3 = 0;
						}
					}
				}
			}
		}
		if (((int3 == 1) && (int4 == 0))) {
			sub4("GENERIC DEBUG *************** Clear 2300");
			int nTalent = GetIdFromTalent(talent8);
			sub4(("GENERIC DEBUG *************** Spells.2DA ID = " + sub10(nTalent)));
			ClearAllActions();
			ActionUseTalentOnObject(talent8, OBJECT_SELF);
			return 1;
		}
		else {
			if (((int3 == 1) && (int4 == 1))) {
				objectParam2 = sub17(1);
				if (GetIsObjectValid(objectParam2)) {
					sub4(("GENERIC DEBUG *************** Hostile Heal Targeted On: " + sub5(objectParam2)));
					sub4("GENERIC DEBUG *************** Clear 2400");
					ClearAllActions();
					ActionUseTalentOnObject(talent8, objectParam2);
					return 1;
				}
			}
		}
		talent talent23 = GetCreatureTalentBest(int2, 20, OBJECT_SELF, 0, 0xFFFFFFFF, 0xFFFFFFFF);
		if ((GetIsTalentValid(talent8) && (!GetHasSpellEffect(GetIdFromTalent(talent8), OBJECT_SELF)))) {
			if (GetIsObjectValid(objectParam2)) {
				sub4("GENERIC DEBUG *************** Clear 2500");
				ClearAllActions();
				sub4(((("GENERIC DEBUG *************** Target = " + GetName(objectParam2)) + " Talent Code = ") + IntToString(int2)));
				ActionUseTalentOnObject(talent8, OBJECT_SELF);
				return 1;
			}
		}
	}
	sub4(((((("GENERIC DEBUG *************** " + sub5(OBJECT_SELF)) + " VP = ") + sub10(GetCurrentHitPoints(OBJECT_SELF))) + "/") + sub10(GetMaxHitPoints(OBJECT_SELF))));
	sub4("GENERIC DEBUG *************** Healing Not Used");
	return 0;
}

object sub15() {
	sub4("GENERIC DEBUG ***************  Starting Injury Check Function");
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
			sub4("GENERIC DEBUG ***************  Return oP0");
			return oNPC;
		}
		else {
			if (((GetIsObjectValid(object3) && (!GetIsDead(object3))) && ((float1 < 0.5) && (float1 > 0.0)))) {
				sub4("GENERIC DEBUG ***************  Return oP1");
				return object3;
			}
			else {
				if (((GetIsObjectValid(object5) && (!GetIsDead(object5))) && ((float1 < 0.5) && (float1 > 0.0)))) {
					sub4("GENERIC DEBUG ***************  Return oP2");
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

int sub14(object objectParam1) {
	sub4("GENERIC DEBUG *************** Boss AI Start");
	object object1 = sub15();
	if (GetIsObjectValid(object1)) {
		if (sub16(intGLOB_143, object1)) {
			return 1;
		}
	}
	if (sub18()) {
		sub4("GENERIC DEBUG *************** Switching Weapons");
	}
	if ((sub20() == 1)) {
		return 1;
	}
	else {
		if ((sub28() == 1)) {
			return 1;
		}
		else {
			if ((sub30() == 1)) {
				return 1;
			}
		}
	}
	sub4("GENERIC DEBUG *************** Boss AI: Fall Through");
	return sub33(OBJECT_INVALID);
}

int sub13() {
	sub4("GENERIC DEBUG *************** Malak AI Start");
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
	sub4(("GENERIC DEBUG *************** Malak Distance to PC = " + FloatToString(GetDistanceBetween(OBJECT_SELF, oPC), 4, 4)));
	if ((fDistance > 10.0)) {
		int6 = 1;
	}
	if ((int6 == 1)) {
		sub4("GENERIC DEBUG *************** Clear 1480");
		ClearAllActions();
		if (((GetHasSpellEffect(8, oPC) || GetHasSpellEffect(34, oPC)) || GetHasSpellEffect(37, oPC))) {
			talent talSpell = TalentSpell(19);
			if (GetIsTalentValid(talSpell)) {
				sub4("GENERIC DEBUG *************** Using Breach");
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
						sub4("GENERIC DEBUG *************** Malak Using Force Power");
						ActionUseTalentOnObject(talent3, oPC);
						return 1;
					}
				}
			}
			int7 = 1;
		}
	}
	if ((int7 == 1)) {
		sub4("GENERIC DEBUG *************** Malak Attacking");
		ActionAttack(oPC, 0);
		return 1;
	}
	sub4("GENERIC DEBUG *************** Malak AI Drop Out");
	return 0;
}

int sub12() {
	int int1 = 0;
	if (((sub8(intGLOB_135) == 0) && (!IsObjectPartyMember(OBJECT_SELF)))) {
		if (((GetHitDice(GetFirstPC()) >= 15) || sub8(intGLOB_132))) {
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
				sub4("GENERIC DEBUG *************** Clear 1710");
				ClearAllActions();
				ActionUseTalentOnObject(talent5, OBJECT_SELF);
			}
			sub11(intGLOB_135, 1);
		}
	}
	return int1;
}

void sub11(int intParam1, int intParam2) {
	SetLocalBoolean(OBJECT_SELF, intParam1, intParam2);
}

string sub10(int intParam1) {
	return IntToString(intParam1);
}

int sub9() {
	sub4("GENERIC DEBUG *************** Starting Forcefield Search");
	sub4(((("GENERIC DEBUG *************** Shield Boolean (" + sub10(intGLOB_133)) + ") = ") + sub10(sub8(intGLOB_133))));
	if (((sub8(intGLOB_133) == 0) && (!IsObjectPartyMember(OBJECT_SELF)))) {
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
			sub4("GENERIC DEBUG *************** Clear 1700");
			ClearAllActions();
			ActionUseTalentOnObject(talSpell, OBJECT_SELF);
			sub11(intGLOB_133, 1);
			return 1;
		}
		else {
			sub11(intGLOB_133, 1);
			return 0;
		}
	}
	return 0;
}

int sub8(int intParam1) {
	int nLocalBool = GetLocalBoolean(OBJECT_SELF, intParam1);
	if ((nLocalBool > 0)) {
		return 1;
	}
	return 0;
}

string sub7(object objectParam1) {
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

void sub6() {
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
	structGLOB_1.int13 = GetLocalNumber(OBJECT_SELF, intGLOB_35);
	structGLOB_1.int15 = GetLocalNumber(OBJECT_SELF, intGLOB_34);
}

string sub5(object objectParam1) {
	string string1 = ((GetName(objectParam1) + "_") + ObjectToString(objectParam1));
	return string1;
}

void sub4(string stringParam1) {
	if ((!ShipBuild())) {
		PrintString(stringParam1);
	}
}

void sub3(object objectParam1) {
	sub4("");
	sub4(("GENERIC DEBUG *************** START DETERMINE COMBAT ROUND " + sub5(OBJECT_SELF)));
	sub6();
	{
		int nStyle = GetPartyAIStyle();
		int nNPCStyle = GetNPCAIStyle(OBJECT_SELF);
		sub4(("GENERIC DEBUG *************** AI STYLE = " + sub7(OBJECT_SELF)));
		if (((((!sub8(intGLOB_128)) && (!sub8(intGLOB_129))) && (!sub8(intGLOB_130))) && (!GetUserActionsPending()))) {
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
				if ((sub9() == 1)) {
					return;
				}
				if ((sub12() == 1)) {
					return;
				}
				if ((sub8(intGLOB_138) == 1)) {
					if ((sub13() == 1)) {
						return;
					}
				}
				if ((sub8(intGLOB_132) == 1)) {
					if ((sub14(objectParam1) == 1)) {
						return;
					}
				}
				if ((nNPCStyle == 0)) {
					if ((sub33(objectParam1) == 1)) {
						return;
					}
				}
				else {
					if ((nNPCStyle == 4)) {
						if ((sub69(objectParam1) == 1)) {
							return;
						}
					}
					else {
						if ((nNPCStyle == 5)) {
							if ((sub70(objectParam1) == 1)) {
								return;
							}
						}
					}
				}
			}
		}
		}
		if (sub72()) {
			sub4("GENERIC DEBUG *************** DETERMINE COMBAT ROUND END");
		}
		sub4("GENERIC DEBUG *************** WARNING DETERMINE COMBAT ROUND FAILURE");
	}
}

void sub2() {
	ClearAllActions();
	ActionMoveToObject(GetFirstPC(), 1, 1.0);
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oNearestDavikguard02;
	object oPtar_thronedoor = GetObjectByTag("ptar_thronedoor", 0);
	AssignCommand(oPtar_thronedoor, ActionOpenDoor(oPtar_thronedoor));
	if (GetIsObjectValid(oNearestDavikguard02 = GetNearestObjectByTag("davikguard02", OBJECT_SELF, 1))) {
		sub1("GUARD1 SUMMONED", 5, 5, 5.0);
		AssignCommand(oNearestDavikguard02, sub2());
	}
	if (GetIsObjectValid(oNearestDavikguard02 = GetNearestObjectByTag("davikguard02", OBJECT_SELF, 2))) {
		sub1("GUARD2 SUMMONED", 5, 6, 5.0);
		AssignCommand(oNearestDavikguard02, sub2());
	}
	ChangeToStandardFaction(OBJECT_SELF, 1);
	sub3(OBJECT_INVALID);
}

