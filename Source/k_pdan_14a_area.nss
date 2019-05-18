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

// Prototypes
void sub6(int intParam1);
int sub5();
int sub4();
int sub3();
void sub2(string stringParam1, string stringParam2);
int sub1();

void sub6(int intParam1) {
	string string1 = ("dan_wanderhound" + IntToString(intParam1));
	location location1 = GetLocation(GetObjectByTag((("WP_" + string1) + "_01"), 0));
	CreateObject(1, string1, location1, 0);
	(intParam1--);
	if ((intParam1 > 0)) {
		sub6(intParam1);
	}
}

int sub5() {
	return ((GetGlobalNumber("DAN_ELISE_PLOT") == 4) || (GetGlobalNumber("DAN_ELISE_PLOT") == 5));
}

int sub4() {
	return (GetGlobalNumber("DAN_ELISE_PLOT") >= 6);
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
	int nLen = GetStringLength("dan_wanderhound");
	object oAreaObject = GetFirstObjectInArea(OBJECT_INVALID, 1);
	while (GetIsObjectValid(oAreaObject)) {
		if ((GetStringLeft(GetTag(oAreaObject), nLen) == "dan_wanderhound")) {
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
		if ((GetGlobalNumber("DAN_JEDI_PLOT") < 7)) {
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