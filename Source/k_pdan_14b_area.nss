////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_14b_area
	
	OnEnter for danm14ab
	
	Added some new conditions regarding Casus and his diary to fix some issues
	with the quest. The quest now plays out like this:
	
	- Casus' body and diary spawn once the player has received the Sandral-Matale
	  Feud quest.
	- If the player finds the diary and returns it to Nurik Sandral, Casus' body
	  is deleted.
	- If the player finishes the Sandral-Matale Feud before finding the diary,
	  the diary will still spawn so long as the families are still alive. The
	  player may return the diary to the Sandral droid outside the estate.
	- If the Sandrals & Matales kill each other before the player finds the
	  diary, it is removed and the player never gets the Dead Settler quest.
	  Casus' body and the rest of his inventory remain.
	
	JC 2019-02-05                                                             */
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
void sub5(object objectParam1, int intParam2, int intParam3);
int sub4(object objectParam1, int intParam2);
int sub3();
void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4);
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

void sub5(object objectParam1, int intParam2, int intParam3) {
	int nLevel = GetHitDice(GetFirstPC());
	if ((intParam3 == 1)) {
		if (((((intParam2 == intGLOB_129) || (intParam2 == intGLOB_134)) || (intParam2 == intGLOB_135)) || (intParam2 == intGLOB_136))) {
			GiveXPToCreature(GetFirstPC(), (nLevel * 15));
		}
		else {
			if ((((intParam2 == intGLOB_130) || (intParam2 == intGLOB_137)) || (intParam2 == intGLOB_133))) {
				GiveXPToCreature(GetFirstPC(), (nLevel * 20));
			}
			else {
				if (((intParam2 == intGLOB_131) || (intParam2 == intGLOB_132))) {
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

int sub4(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

int sub3() {
	int int1;
	if ((sub4(OBJECT_SELF, intGLOB_118) == 0)) {
		int1 = 1;
		sub5(OBJECT_SELF, intGLOB_118, 1);
	}
	return int1;
}

void sub2(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
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
	int int1;
	int int2 = 3;
	int int3 = (2 - sub1());
	int nGlobal = GetGlobalNumber("DAN_ROMANCE_PLOT");
	string string1 = "dan14aa_casus";
	string string2 = "dan14_hound";
	object oEntering = GetEnteringObject();
	if ((GetIsPC(oEntering) && (GetLoadFromSaveGame() == 0))) {
		object oDan14_mdroid = GetObjectByTag("dan14_mdroid", 0);
		if (((GetGlobalNumber("DAN_ROMANCE_PLOT") == 7) && GetIsObjectValid(oDan14_mdroid))) {
			DestroyObject(oDan14_mdroid, 0.0, 0, 0.0);
		}
		object oZuulanspeeder;
		if ((GetGlobalNumber("K_Geno_Zuulan") == 1)) {
			sub2("Spawn Speeders", 5, 5, 1.0);
			CreateObject(64, "zuulanspeeder", GetLocation(GetObjectByTag("wp_ZuulanSpeeder", 0)), 0);
			CreateObject(64, "cut_bike", GetLocation(GetObjectByTag("wp_ZuulanBike", 0)), 0);
			object oDan_alarm_wp = GetObjectByTag("dan_alarm_wp", 0);
			vector vPosition = GetPosition(oDan_alarm_wp);
			vector struct4 = Vector(vPosition.x, vPosition.y, (vPosition.z + 0.65000004));
			location location3 = Location(struct4, GetFacing(oDan_alarm_wp));
			CreateObject(64, "dan_alarm", location3, 0);
		}
		if ((GetGlobalNumber("K_Geno_Zuulan") >= 2)) {
			sub2("Destroy Speeder", 5, 5, 1.0);
			oZuulanspeeder = GetObjectByTag("zuulanspeeder", 0);
			if (GetIsObjectValid(oZuulanspeeder)) {
				DestroyObject(oZuulanspeeder, 0.0, 1, 0.0);
			}
		}
		// Added different conditions regarding Casus and his diary ~JC
		string sDiary = "dan14_diary";
		string sCasusPLC = "dan14aa_casus";
		string sCasusBody = "cp_dan_casus";
		string sCasusBones = "plc_hmnskel";
		string sKathHound = "dan14_hound";
		location lCasusPLC = GetLocation(GetObjectByTag(("wp_" + sCasusPLC), 0));
		location lCasusBody = Location(GetPosition(GetObjectByTag("wp_" + sCasusPLC, 0)) + Vector(-0.5, 0.0, 0.0), 0.0);
		location lCasusBones = Location(GetPosition(GetObjectByTag(("wp_" + sCasusPLC), 0)) + Vector(-0.1, 0.0, 0.0), -35.0);
		// Spawn Casus and kath hounds if the Sandral-Matale Feud has started
		if ( GetGlobalNumber("DAN_ROMANCE_PLOT") > 0 && GetGlobalNumber("DAN_CASUS_PLOT") < 1 && sub3() ) {
			SetGlobalNumber("DAN_CASUS_PLOT", 1);
			CreateObject(OBJECT_TYPE_PLACEABLE, sCasusPLC, lCasusPLC, FALSE);			
			CreateObject(OBJECT_TYPE_CREATURE, sCasusBody, lCasusBody, FALSE);
			int1 = 1;
			while ((int1 <= int2)) {
				CreateObject(1, sKathHound, GetLocation(GetObjectByTag((("wp_" + sKathHound) + IntToString(int1)), 0)), 0);
				(int1++);
				}
			}
		// If the diary was returned, remove Casus
		if( GetGlobalNumber("DAN_CASUS_PLOT") >= 3 ){
			SetGlobalBoolean("DAN_DIARY_DONE", TRUE);
			if( GetIsObjectValid(GetObjectByTag(sCasusPLC, 0)) ) DestroyObject(GetObjectByTag(sCasusPLC, 0), 0.0, 0, 0.0);
			if( GetIsObjectValid(GetObjectByTag(sCasusBody, 0)) ) {
				AssignCommand(GetObjectByTag(sCasusBody, 0), SetIsDestroyable(TRUE));
				DestroyObject(GetObjectByTag(sCasusBody, 0), 0.0, 0, 0.0);
				}
			}
		// Make sure the player can't find the diary if the quest is over
		if( GetGlobalBoolean("DAN_DIARY_DONE") == TRUE ) {
			if( GetIsObjectValid(GetItemPossessedBy(GetObjectByTag(sCasusPLC, 0), sDiary)) ) {
				DestroyObject(GetItemPossessedBy(GetObjectByTag(sCasusPLC, 0), sDiary), 0.0, 0, 0.0);
				}
			}
		// If the Sandrals & Matales are dead, the diary quest has failed
		if( GetGlobalNumber("DAN_ROMANCE_PLOT") == 7 && GetIsObjectValid(GetObjectByTag(sCasusBody, 0)) ) {
			AssignCommand(GetObjectByTag(sCasusBody, 0), SetIsDestroyable(TRUE));
			DestroyObject(GetObjectByTag(sCasusBody, 0), 0.0, 0, 0.0);
			CreateObject(OBJECT_TYPE_PLACEABLE, sCasusBones, lCasusBones, FALSE);
			}
		if ((int3 > 0)) {
			sub6(int3);
			}
		}

}

