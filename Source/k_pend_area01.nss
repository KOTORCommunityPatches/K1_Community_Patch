////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pman_locked03
	
	OnEnter script for ebo_m01aa.
	Fixes an issue with the fade in not actually fading in at the right time,
	making the player visible before the game is meant to start.
	
	JC 2019-04-24                                                             */
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
	int intGLOB_89;
	int intGLOB_90;
	int intGLOB_91;
	object objectGLOB_1;
	int intGLOB_92;
	int intGLOB_93;
	int intGLOB_94;
	int intGLOB_95;
	int intGLOB_96;
	int intGLOB_97;
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
	string stringGLOB_1 = "end_trask";
	string stringGLOB_2 = "endwp_tarsk01";
	string stringGLOB_3 = "Carth";
	string stringGLOB_4 = "g_w_blstrrfl001";
	string stringGLOB_5 = "g_i_adrnaline003";
	string stringGLOB_6 = "";
	string stringGLOB_7 = "g_w_blstrpstl001";
	string stringGLOB_8 = "g_i_adrnaline002";
	string stringGLOB_9 = "g_i_implant101";
	string stringGLOB_10 = "g_w_blstrpstl001";
	string stringGLOB_11 = "g_i_secspike01";
	string stringGLOB_12 = "g_i_progspike01";
	int intGLOB_145 = 3;
	int intGLOB_146 = 4;
	int intGLOB_147 = 2;
	int intGLOB_148 = (-1);
	int intGLOB_149 = 0;
	int intGLOB_150 = 1;
	int intGLOB_151 = 2;
	int intGLOB_152 = 3;
	int intGLOB_153 = 4;
	int intGLOB_154 = 5;
	int intGLOB_155 = 6;
	int intGLOB_156 = 7;
	int intGLOB_157 = 8;
	int intGLOB_158 = 9;
	int intGLOB_159 = 10;
	int intGLOB_160 = 11;
	int intGLOB_161 = 12;
	int intGLOB_162 = 13;
	int intGLOB_163 = 14;
	int intGLOB_164 = 15;
	int intGLOB_165 = 16;
	int intGLOB_166 = 17;
	int intGLOB_167 = 18;
	int intGLOB_168 = 19;
	int intGLOB_169 = 20;
	int intGLOB_170 = 21;
	int intGLOB_171 = 22;
	int intGLOB_172 = 28;
	int intGLOB_173 = 29;
	int intGLOB_174 = 30;
	int intGLOB_175 = 31;
	string stringGLOB_13 = "end_locker01";
	string stringGLOB_14 = "g_i_belt010";

// Prototypes
object sub5();
void sub4();
void sub3(object objectParam1, int intParam2, int intParam3);
int sub2(object objectParam1, int intParam2);
int sub1();

object sub5() {
	return GetObjectByTag(stringGLOB_1, 0);
}

void sub4() {
	object object1 = GetObjectByTag(stringGLOB_13, 0);
	int int1 = GetClassByPosition(1, GetFirstPC());
	if ((int1 == 2)) {
		CreateItemOnObject(stringGLOB_10, object1, 1);
		CreateItemOnObject(stringGLOB_11, object1, 1);
		CreateItemOnObject(stringGLOB_12, object1, 1);
	}
	else {
		if ((int1 == 1)) {
			CreateItemOnObject(stringGLOB_7, object1, 1);
			CreateItemOnObject(stringGLOB_8, object1, 1);
			CreateItemOnObject(stringGLOB_9, object1, 1);
		}
		else {
			if ((int1 == 0)) {
				CreateItemOnObject(stringGLOB_4, object1, 1);
				CreateItemOnObject(stringGLOB_5, object1, 1);
				CreateItemOnObject(stringGLOB_6, object1, 1);
			}
		}
	}
	if (GetHasSkill(2, GetFirstPC())) {
		CreateItemOnObject(stringGLOB_14, object1, 1);
	}
}

void sub3(object objectParam1, int intParam2, int intParam3) {
	int nLevel = GetHitDice(GetFirstPC());
	if ((intParam3 == 1)) {
		if (((((intParam2 == intGLOB_12) || (intParam2 == intGLOB_17)) || (intParam2 == intGLOB_18)) || (intParam2 == intGLOB_19))) {
			GiveXPToCreature(GetFirstPC(), (nLevel * 15));
		}
		else {
			if ((((intParam2 == intGLOB_13) || (intParam2 == intGLOB_20)) || (intParam2 == intGLOB_16))) {
				GiveXPToCreature(GetFirstPC(), (nLevel * 20));
			}
			else {
				if (((intParam2 == intGLOB_14) || (intParam2 == intGLOB_15))) {
					GiveXPToCreature(GetFirstPC(), (nLevel * 10));
				}
			}
		}
	}
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		if (((intParam3 == 1) || (intParam3 == 0))) {
			SetLocalBoolean(objectParam1, intParam2, intParam3);
		}
	}
}

int sub2(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

int sub1() {
	int int1;
	if ((sub2(OBJECT_SELF, intGLOB_10) == 0)) {
		int1 = 1;
		sub3(OBJECT_SELF, intGLOB_10, 1);
	}
	return int1;
}

void main() {
	if (GetIsPC(GetEnteringObject())) {
		if (sub1()) {
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			PlayMovie("01A");
			SetReturnStrref(0, 32228, 0);
			SetGlobalNumber("K_CURRENT_PLANET", 5);
			sub4();
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			NoClicksFor(1.0);
			DelayCommand(0.1, SetGlobalFadeIn(0.9, 1.5, 0.0, 0.0, 0.0));
			DelayCommand(0.1, AssignCommand(sub5(), ActionStartConversation(GetFirstPC(), "m01aa_c01", 0, 0, 1, "", "", "", "", "", "", 0)));
			SetMinOneHP(GetFirstPC(), 1);
		}
	}
}