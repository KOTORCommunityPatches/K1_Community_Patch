////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik081.dlg in tar_m08aa (Taris Davik's Estate).

	This script is fired on Davik's opening line in the introductory scene on
	first entering his estate. The original script opens the door to the room
	in the guest wing the conversation ends in. The additions are part of the
	ongoing attempt to resolve the ever-present facing issues that pervade all
	of KOTOR's conversations. Sets the party in predefined positions for better
	and more consistent framing in conjunction with some added static cameras.

	DP 2019-05-05                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oCand = GetObjectByTag("Cand", 0);
	object oCalo = GetObjectByTag("calo081", 0);
	object oDavik = GetObjectByTag("Davik081", 0);
	object oDavWP = GetObjectByTag("tar08_wpdavtour2", 0);
	object oDoor = GetNearestObjectByTag("ptar_davdoor", oDavWP, 1);
	location lPCStart = Location(Vector(57.872,99.915,0.0), 0.0);
	location lPM1Start = Location(Vector(59.121,97.456,0.0), 0.0);
	location lCandStart = Location(Vector(55.297,100.963,0.0), 0.0);
	location lPCEnd = Location(Vector(59.4,101.0,0.0), 0.0);
	location lPM1End = Location(Vector(60.0,99.0,0.0), 0.0);
	location lCandEnd = Location(Vector(57.5,101.75,0.0), 0.0);
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	
	AssignCommand(oDoor, ActionOpenDoor(oDoor));
	
	AssignCommand(oCalo, ActionDoCommand(SetFacingPoint(GetPosition(oCand))));
	
	CP_PartyJump(oPC, lPCStart);
	DelayCommand(0.4, AssignCommand(oPC, ActionMoveToLocation(lPCEnd, FALSE)));
	DelayCommand(1.0, AssignCommand(oPC, SetFacingPoint(GetPosition(oDavik))));

	CP_PartyJump(oCand, lCandStart);
	DelayCommand(0.4, AssignCommand(oCand, ActionMoveToLocation(lCandEnd, FALSE)));
	DelayCommand(1.0, AssignCommand(oCand, SetFacingPoint(GetPosition(oCalo))));

	if ((oPM1 != oCand))
		{
			CP_PartyJump(oPM1, lPM1Start);
			DelayCommand(0.4, AssignCommand(oPM1, ActionMoveToLocation(lPM1End, FALSE)));
			DelayCommand(1.0, AssignCommand(oPM1, SetFacingPoint(GetPosition(oDavik))));
		}
			
	if ((GetIsObjectValid(oPM2) && (oPM2 != oCand)))
		{
			CP_PartyJump(oPM2, lPM1Start);
			DelayCommand(0.4, AssignCommand(oPM2, ActionMoveToLocation(lPM1End, FALSE)));
			DelayCommand(1.0, AssignCommand(oPM2, SetFacingPoint(GetPosition(oDavik))));
		}
}