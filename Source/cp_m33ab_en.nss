////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Vanilla OnEnter script for korr_m33ab (Sith Academy Entrance).
	
	See k33b_openacademy.nss for further details.
	
	2019-03-18                                                                */
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

// Prototypes
void sub6(int intParam1, string stringParam2, location locationParam3);
void sub5(object objectParam1, int intParam2, int intParam3);
void sub4(int intParam1);
int sub3(object objectParam1, int intParam2);
int sub2();
void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4);

void sub6(int intParam1, string stringParam2, location locationParam3) {
	object object1 = CreateObject(intParam1, stringParam2, locationParam3, 0);
}

void sub5(object objectParam1, int intParam2, int intParam3) {
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

void sub4(int intParam1) {
	sub5(OBJECT_SELF, intGLOB_1, intParam1);
}

int sub3(object objectParam1, int intParam2) {
	int nLocalBool;
	if ((((intParam2 >= 0) && (intParam2 <= 19)) && GetIsObjectValid(objectParam1))) {
		nLocalBool = GetLocalBoolean(objectParam1, intParam2);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}

int sub2() {
	return sub3(OBJECT_SELF, intGLOB_1);
}

void sub1(string stringParam1, int intParam2, int intParam3, float floatParam4) {
	if ((!ShipBuild())) {
		AurPostString(stringParam1, intParam2, intParam3, floatParam4);
	}
}

void main() {
	object oPC = GetFirstPC();
	if ((GetEnteringObject() == oPC)) {
		RevealMap([0.0,0.0,0.0], 0xFFFFFFFF);
		object oK33b_dor_academy = GetObjectByTag("k33b_dor_academy", 0);
		if ((GetGlobalNumber("KOR_SITHJOIN") > 0)) {
			if ((!GetGlobalBoolean("KOR_END_HOSTILE"))) {
				SetLocked(oK33b_dor_academy, 0);
			}
			object oKor33_mekel = GetObjectByTag("kor33_mekel", 0);
			object oKor33_mekfight1 = GetObjectByTag("kor33_mekfight1", 0);
			object oKor33_mekfight2 = GetObjectByTag("kor33_mekfight2", 0);
			object oKor33_mekfight3 = GetObjectByTag("kor33_mekfight3", 0);
			if (GetIsObjectValid(oKor33_mekel)) {
				DestroyObject(oKor33_mekel, 0.0, 1, 0.0);
			}
			if (GetIsObjectValid(oKor33_mekfight1)) {
				DestroyObject(oKor33_mekfight1, 0.0, 1, 0.0);
			}
			if (GetIsObjectValid(oKor33_mekfight2)) {
				DestroyObject(oKor33_mekfight2, 0.0, 1, 0.0);
			}
			if (GetIsObjectValid(oKor33_mekfight3)) {
				DestroyObject(oKor33_mekfight3, 0.0, 1, 0.0);
			}
		}
		if (GetGlobalBoolean("KOR_END_HOSTILE")) {
			object object14 = GetItemPossessedBy(oPC, "k33_itm_sithmdln");
			if (GetIsObjectValid(object14)) {
				DestroyObject(object14, 0.0, 0, 0.0);
			}
			AssignCommand(oK33b_dor_academy, ActionCloseDoor(oK33b_dor_academy));
			DelayCommand(0.5, SetLocked(oK33b_dor_academy, 1));
			object oK33_academyguard = GetObjectByTag("k33_academyguard", 0);
			SetPlotFlag(oK33_academyguard, 0);
			ChangeToStandardFaction(oK33_academyguard, 1);
		}
		if ((GetAreaUnescapable() && GetGlobalBoolean("KOR_MURDER_DEAD"))) {
			sub1("Area escapable", 10, 10, 5.0);
			SetAreaUnescapable(0);
		}
		if ((((!sub2()) && GetGlobalBoolean("DAN_BELAYA_DEFECT")) && (GetGlobalNumber("DAN_JUHANI_PLOT") == 2))) {
			sub4(1);
			object oK33b_way_belaya = GetObjectByTag("k33b_way_belaya", 0);
			location location1 = GetLocation(oK33b_way_belaya);
			DelayCommand(0.5, sub6(1, "kor33b_belaya", location1));
		}
	}
}