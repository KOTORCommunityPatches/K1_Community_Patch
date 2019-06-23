////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_eldspk.utt in unk_m42aa (Unknown World Elder's Settlement).
	
	This script is fired by one of the triggers at the entrance of the Elder's
	compound to initiate conversation the first time the party enters. Some
	tweaks have been made in order to wrangle the party, since by default the
	party members will remain hanging back in the entrance-way instead of falling
	in behind the PC at the start of the conversation. Additionally, the original
	attempt to forcibly set the PC to party leader did not work while inside
	the If statement, so it has been moved out so that it functions properly.
	Having a party member as party leader can cause the PC to freak out once the
	conversation ends.
	
	DP 2019-06-22                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPM1Start = Location(Vector(54.0,26.0,16.165), 90.0);
	location lPM2Start = Location(Vector(51.0,26.0,16.165), 90.0);
	location lPM1End = Location(Vector(54.5,34.0,16.165), 90.0);
	location lPM2End = Location(Vector(51.25,34.0,16.165), 90.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	if (((GetIsPC(oEntering) == TRUE) && (UT_GetTalkedToBooleanFlag(OBJECT_SELF) == FALSE)))
		{
			if (GetIsObjectValid(oPM1))
				{
					CP_PartyJump(oPM1, lPM1Start);
				}
			
			if (GetIsObjectValid(oPM2))
				{
					CP_PartyJump(oPM2, lPM2Start);
				}
			
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			if ((!GetGlobalBoolean("Unk_RedHostile")))
				{
					AssignCommand(GetObjectByTag("unk42_redelder", 0), ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, FALSE));
					
					if (GetIsObjectValid(oPM1))
						{
							DelayCommand(2.2, AssignCommand(oPM1, ActionMoveToLocation(lPM1End, FALSE)));
						}
			
					if (GetIsObjectValid(oPM2))
						{
							DelayCommand(2.2, AssignCommand(oPM2, ActionMoveToLocation(lPM2End, FALSE)));
						}
				}
		}
}
