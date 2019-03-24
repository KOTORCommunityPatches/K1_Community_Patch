////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tat17_sharintrig.utt in tat_m17aa (Anchorhead).
	
	This script is fired by a trigger directly in front of the Hunting Lodge
	in Anchorhead. For some reason, the vanilla script does not initiate the
	conversation with Sharina when the player passes through, as was intended.
	The vanilla script is not able to be decompiled, but a new script was
	constructed by examining the byte code and using similar dialogue trigger
	scripts as a reference.
	
	DP 2019-03-24                                                             */
////////////////////////////////////////////////////////////////////////////////


// Globals
int intGLOB_11 = 10;

// Prototypes
int subTalkedTo(object oNPCSpeaker);
void subHealParty();
void subJump(string oSpeakerTag, string sConvo, object oPCWP);

int subTalkedTo(object oNPCSpeaker) {
	int iTalkedBool;
	
	if (GetIsObjectValid(oNPCSpeaker)) {
		iTalkedBool = GetLocalBoolean(oNPCSpeaker, intGLOB_11);
		if ((iTalkedBool > 0)) {
			return TRUE;
		}
	}
    return FALSE;
}

void subHealParty() {
	int int1 = 0;
	object oParty = GetPartyMemberByIndex(int1);
	
	while (GetIsObjectValid(oParty)) {
		if ((GetCurrentHitPoints(oParty) < 1)) {
			ApplyEffectToObject(0, EffectResurrection(), oParty, 0.0);
			ApplyEffectToObject(0, EffectHeal(1), oParty, 0.0);
		}
		(int1++);
		oParty = GetPartyMemberByIndex(int1);
	}
}

void subJump(string oSpeakerTag, string sConvo, object oPCWP) {
	object oSpeaker = GetObjectByTag(oSpeakerTag, 0);
	object oPC = GetFirstPC();
	
	subHealParty();
	if ((GetIsObjectValid(oSpeaker) == 1)) {
		if ((oPC == GetPartyMemberByIndex(0))) {
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oSpeaker, ClearAllActions());
			CancelCombat(oPC);
			AssignCommand(oSpeaker, ActionStartConversation(oPC, sConvo, 0, 0, 1, "", "", "", "", "", ""));
		}
		else {
			SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
			SetPartyLeader(0xFFFFFFFF);
			object oPM1 = GetPartyMemberByIndex(1);
			object oPM2 = GetPartyMemberByIndex(2);
			NoClicksFor(0.7);
			AssignCommand(oPC, ClearAllActions());
			AssignCommand(oSpeaker, ClearAllActions());
			CancelCombat(oPC);
			if ((GetIsObjectValid(oPCWP) == 1)) {
				AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oPCWP, 1)));
				AssignCommand(oPC, DelayCommand(0.4, SetFacingPoint(GetPosition(oSpeaker))));
			}
			else {
				AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oSpeaker, 1)));
			}
			AssignCommand(oPM1, DelayCommand(0.5, JumpToObject(oPC, 1)));
			AssignCommand(oPM2, DelayCommand(0.5, JumpToObject(oPC, 1)));
			AssignCommand(oSpeaker, ActionDoCommand(SetGlobalFadeIn(0.5, 2.0, 0.0, 0.0, 0.0)));
			AssignCommand(oSpeaker, ActionStartConversation(oPC, sConvo, 0, 0, 1, "", "", "", "", "", ""));
		}
	}
}

void main() {
	object oEntering = GetEnteringObject();
	object oSharina = GetObjectByTag("tat17_03shari_01", 0);
	
	if ((GetIsPC(oEntering) && (!subTalkedTo(oSharina)))) {
		subJump("tat17_03shari_01", "", OBJECT_INVALID);
	}
}