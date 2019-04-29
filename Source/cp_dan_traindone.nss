////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	cp_dan_traindone

	Fired when the player goes to speak to the Council after completing their
	training.
	
	Revised by DP, replacing most of JC's original script with the guts of
	k_pdan_trig1303, which is the vanilla script used in the post-Revan/Malak
	ruins exploration dream conversation with the Council (no need to reinvent
	the wheel, right?).
	
	JC 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////

// Prototypes
void CP_PartyHeal();
void CP_PartyJump(string sNPCTag, string sDialogResRef, object oJumpPoint);

void CP_PartyHeal() {
	int int1 = 0;
	object oNPC = GetPartyMemberByIndex(int1);
	while (GetIsObjectValid(oNPC))
		{
			if ((GetCurrentHitPoints(oNPC) < 1))
				{
					ApplyEffectToObject(0, EffectResurrection(), oNPC, 0.0);
					ApplyEffectToObject(0, EffectHeal(1), oNPC, 0.0);
				}
			(int1++);
			oNPC = GetPartyMemberByIndex(int1);
		}
}

void CP_PartyJump(string sNPCTag, string sDialogResRef, object oJumpPoint) {
	
	object oSpeaker = GetObjectByTag(sNPCTag, 0);
	object oPC = GetFirstPC();
	
	CP_PartyHeal();
	
	if ((GetIsObjectValid(oSpeaker) == 1))
		{
			if ((oPC == GetPartyMemberByIndex(0)))
				{
					AssignCommand(oPC, ClearAllActions());
					AssignCommand(oSpeaker, ClearAllActions());
					CancelCombat(oPC);
					AssignCommand(oSpeaker, ActionStartConversation(oPC, sDialogResRef, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "", "", "", "", "", "", FALSE));
				}

			else
				{
					object oPM1 = GetPartyMemberByIndex(1);
					object oPM2 = GetPartyMemberByIndex(2);
					
					SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
					SetPartyLeader(0xFFFFFFFF);
					NoClicksFor(0.7);
					AssignCommand(oPC, ClearAllActions());
					AssignCommand(oSpeaker, ClearAllActions());
					CancelCombat(oPC);

			if ((GetIsObjectValid(oJumpPoint) == TRUE))
				{
					AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oJumpPoint, 1)));
					AssignCommand(oPC, DelayCommand(0.4, SetFacingPoint(GetPosition(oSpeaker))));
				}

			else
				{
					AssignCommand(oPC, DelayCommand(0.2, JumpToObject(oSpeaker, 1)));
				}
			
			AssignCommand(oPM1, DelayCommand(0.5, JumpToObject(oPC, 1)));
			AssignCommand(oPM2, DelayCommand(0.5, JumpToObject(oPC, 1)));
			AssignCommand(oSpeaker, ActionDoCommand(SetGlobalFadeIn(0.5, 2.0, 0.0, 0.0, 0.0)));
			AssignCommand(oSpeaker, ActionStartConversation(oPC, sDialogResRef, FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "", "", "", "", "", "", FALSE));
		}
	}
}


void main() {

    if(GetIsPC(GetEnteringObject()) && GetGlobalNumber("DAN_JEDI_PLOT") == 7)
		{
			CP_PartyJump("dan13_vandar", "", OBJECT_INVALID);
			DelayCommand(7.0, DestroyObject(OBJECT_SELF, 0.0, FALSE, 0.0));
		}
}