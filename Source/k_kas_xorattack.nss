////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    Script edit by Kexikus.
	
    Fixed trigger. Prievously the conversation would only be started the first
	time you see Xor even if Juhani is not in the party. Coming back later with
	her in the party would no longer start the conversation, thus preventing any
	progress.

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
void sub2(object objectParam1, int intParam2);
int sub1(object objectParam1);

void sub2(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, intGLOB_11, intParam2);
		}
	}
}

int sub1(object objectParam1) {
	int nLocalBool;
	if (GetIsObjectValid(objectParam1)) {
		nLocalBool = GetLocalBoolean(objectParam1, intGLOB_11);
		if ((nLocalBool > 0)) {
			return 1;
		}
	}
	return 0;
}


void main() {
	location location1 = GetLocation(GetObjectByTag("kas_xor1_spawn", 0));
	location location3 = GetLocation(GetObjectByTag("kas_xor2_spawn", 0));
	location location5 = GetLocation(GetObjectByTag("kas_xor3_spawn", 0));
	int nGlobal = GetGlobalNumber("K_XOR_AMBUSH");

  if (nGlobal == 1) {
    if (sub1(OBJECT_SELF) == 0) {
      sub2(OBJECT_SELF, 1);
      CreateObject(1, "kas_xor1", location1, 0);
      CreateObject(1, "kas_xor2", location3, 0);
      CreateObject(1, "kas_xor3", location5, 0);
    }
    AssignCommand(GetObjectByTag("invis_xor_conv", 0), ActionStartConversation(OBJECT_SELF, "", 0, 0, 0, "", "", "", "", "", ""));
  }

}