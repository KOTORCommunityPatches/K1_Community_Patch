////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
    Script edit by Kexikus.
	
    Fixed trigger. Previously the conversation would only be started the first
	time you see Xor even if Juhani is not in the party. Coming back later with
	her in the party would no longer start the conversation, thus preventing any
	progress.

	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

// Prototypes
void sub2(object objectParam1, int intParam2);
int sub1(object objectParam1);

void sub2(object objectParam1, int intParam2) {
	if (GetIsObjectValid(objectParam1)) {
		if (((intParam2 == 1) || (intParam2 == 0))) {
			SetLocalBoolean(objectParam1, 10, intParam2);
		}
	}
}

int sub1(object objectParam1) {
	int nLocalBool;
	if (GetIsObjectValid(objectParam1)) {
		nLocalBool = GetLocalBoolean(objectParam1, 10);
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
