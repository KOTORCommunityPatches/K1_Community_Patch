////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Jedi Enclave).

	This script, in conjunction with cp_dan_traindone, adds a cutscene intro
	when approaching the Council after having told Zhar you dealt with Juhani.
	It is a heavily modified version of the vanilla setup used for the into
	of the post-Revan/Malak ruins exploration dream conversation with the
	Council (no need to reinvent the wheel, right?). 
	
	This was done to alleviate the endless stream of facing issues conversations
	have. Given that the conversations with the Council are arguably some of the
	most important in the game, it didn't seem right to have characters facing
	in the wrong direction, the PC standing in a weird spot, etc.

	DP 2019-04-29                                                             */
////////////////////////////////////////////////////////////////////////////////


// Prototypes
void CP_PartyMove(object oNPC, location lJumpTo, location lRunTo, object oSpeaker);

void CP_PartyMove(object oNPC, location lJumpTo, location lRunTo, object oSpeaker) {

	AssignCommand(oNPC, ClearAllActions());
	AssignCommand(oNPC, ActionJumpToLocation(lJumpTo));
	AssignCommand(oNPC, ActionMoveToLocation(lRunTo, TRUE));
	AssignCommand(oNPC, SetFacingPoint(GetPosition(oSpeaker)));
}

void main() {

	object oVandar = GetObjectByTag("dan13_vandar", 0);
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	location lPCStart = Location(Vector(95.209,42.27,4.445), 0.0);
	location lPM1Start = Location(Vector(94.5,44.5,4.55), 0.0);
	location lPM2Start = Location(Vector(93.0,43.0,4.55), 0.0);
	location lCounWP = GetLocation(GetObjectByTag("dan13_WP_council", 0));
	location lPM1End = Location(Vector(103.85,35.35,4.085), 0.0);
	location lPM2End = Location(Vector(101.8,33.55,4.08), 0.0);
	

    if(GetLocalBoolean(oVandar, 53) == FALSE && GetGlobalNumber("DAN_JEDI_PLOT") == 7)
    {
		SetLocalBoolean(oVandar, 53, TRUE);
		ActionPauseConversation();
		CP_PartyMove(oPC, lPCStart, lCounWP, oVandar);
		if (GetIsObjectValid(oPM1))
			{
				CP_PartyMove(oPM1, lPM1Start, lPM1End, oVandar);
			}
        if (GetIsObjectValid(oPM2))
			{
				CP_PartyMove(oPM2, lPM2Start, lPM2End, oVandar);
			}
		ActionWait(6.0);
		ActionResumeConversation();
		DelayCommand(2.0, SetDialogPlaceableCamera(37));
	}
}