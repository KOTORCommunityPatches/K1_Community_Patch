////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pdan_14a_area.ncs
	
	OnEnter script for danm14aa.
	Fixes an issue with Xor refusing to appear unless the rapid transit system
	was used. This fix is attached to every module adjacent to a spaceport, so
	when the player exits any spaceport the encounter will be set to begin when
	they return, via rapid transit or otherwise.
	
	JC 2019-04-13                                                             */
////////////////////////////////////////////////////////////////////////////////

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
	int intGLOB_62;
	int intGLOB_63;
	int intGLOB_64;
	object objectGLOB_1;
	int intGLOB_65;
	int intGLOB_66;
	int intGLOB_67;
	int intGLOB_68;
	int intGLOB_69;
	int intGLOB_70;
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
	int intGLOB_145 = 4;
	int intGLOB_146 = 1;
	int intGLOB_147 = 7;
	int intGLOB_148 = 1;
	int intGLOB_149 = 2;
	int intGLOB_150 = 3;
	int intGLOB_151 = 1;
	int intGLOB_152 = 2;
	int intGLOB_153 = 3;
	int intGLOB_154 = 4;
	int intGLOB_155 = 5;
	int intGLOB_156 = 6;
	string stringGLOB_1 = "bastila";
	string stringGLOB_2 = "carth";
	string stringGLOB_3 = "dan13_WP_council";
	string stringGLOB_4 = "g_w_lghtsbr01";
	string stringGLOB_5 = "g_w_lghtsbr03";
	string stringGLOB_6 = "g_w_lghtsbr04";
	string stringGLOB_7 = "dan_wanderhound";

// Prototypes
void sub6(int intParam1);
int sub5();
int sub4();
int sub3();
void sub2(string stringParam1, string stringParam2);
int sub1();

void sub6(int intParam1) {
	string string1 = (stringGLOB_7 + IntToString(intParam1));
	location location1 = GetLocation(GetObjectByTag((("WP_" + string1) + "_01"), 0));
	CreateObject(1, string1, location1, 0);
	(intParam1--);
	if ((intParam1 > 0)) {
		sub6(intParam1);
	}
}

int sub5() {
	return ((GetGlobalNumber("DAN_ELISE_PLOT") == intGLOB_154) || (GetGlobalNumber("DAN_ELISE_PLOT") == intGLOB_155));
}

int sub4() {
	return (GetGlobalNumber("DAN_ELISE_PLOT") >= intGLOB_156);
}

int sub3() {
	return GetGlobalBoolean("DAN_ELISE_COMPOUND");
}

void sub2(string stringParam1, string stringParam2) {
	if ((!GetIsObjectValid(GetObjectByTag(stringParam1, 0)))) {
		CreateObject(1, stringParam1, GetLocation(GetObjectByTag((("POST_" + stringParam1) + stringParam2), 0)), 0);
	}
}

int sub1() {
	int int1;
	int nLen = GetStringLength(stringGLOB_7);
	object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if ((GetStringLeft(GetTag(oAreaObject), nLen) == stringGLOB_7)) {
			(int1++);
		}
		oAreaObject = GetNextObjectInArea(OBJECT_INVALID, 1);
	}
	return int1;
}

void main() {
	if ((GetIsPC(GetEnteringObject()) && (GetLoadFromSaveGame() == 0))) {
		int int3 = (2 - sub1());
		if (((GetGlobalBoolean("DAN_GARL_DONE") == 0) && (GetGlobalNumber("DAN_MAND_STATE") < 5))) {
			sub2("dan14_settlerf", "");
			sub2("dan14_settlerm", "");
		}
		else {
			if (GetIsObjectValid(GetObjectByTag("dan14_settlerf", 0))) {
				DestroyObject(GetObjectByTag("dan14_settlerf", 0), 0.0, 0, 0.0);
			}
			if (GetIsObjectValid(GetObjectByTag("dan14_settlerm", 0))) {
				DestroyObject(GetObjectByTag("dan14_settlerm", 0), 0.0, 0, 0.0);
			}
		}
		if ((GetGlobalNumber("DAN_JEDI_PLOT") < intGLOB_147)) {
			sub2("dan14_nemo", "");
		}
		if (GetGlobalBoolean("DAN_RUINS_GONE")) {
			DestroyObject(GetObjectByTag("dan14_nemo", 0), 0.0, 0, 0.0);
			SetLocked(GetObjectByTag("man14aa_door04", 0), 0);
		}
		object oDan14_elise = GetObjectByTag("dan14_elise", 0);
		if ((sub3() || sub4())) {
			DestroyObject(oDan14_elise, 0.0, 0, 0.0);
			DestroyObject(GetObjectByTag("dan14aa_speeder", 0), 0.0, 0, 0.0);
		}
		else {
			if (sub5()) {
				sub2("dan14_c8692", "");
			}
		}
		if ((int3 > 0)) {
			sub6(int3);
		}
		if (GetGlobalBoolean("tat_SharinaPaidFull")) {
			sub2("dan13_zzshari", "");
		}
		if ((GetGlobalNumber("KOR_FINAL_TEST") == 7)) {
			sub2("dan13_yuthura", "");
		}
	}

// Added Xor fix ~JC
if( GetGlobalBoolean("K_MESS_JUHANI") == TRUE ) {
	if( GetGlobalNumber("K_XOR_AMBUSH") < 1 ) SetGlobalNumber("K_XOR_AMBUSH", 1);
	}

}