//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k_hdustil_dialog.dlg in korr_m35aa (Korriban Sith Academy)
	
	This script has been added to Dustil's DLG to force Carth to face him while
	speaking his lines. Previously he would face the player. It also jumps the
	party into fixed positions, to try and cut down on the usual conversation
	screwiness and locks the PC to prevent them turning to face Carth on his lines.
	
	See also cp_k35_unlckdust.
	
	Updated 2019-11-10 to add a fade-out/in to mask the jump, and set Dustil's
	initial facing towards the player regardless of what angle the conversation
	was started from.
	
	Issue #162: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/162
	
	DP 2019-07-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oCarth = GetObjectByTag("Carth");
	object oDustil = GetObjectByTag("kor35_dustil");
	object oPC = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	location lPCJump = Location(Vector(77.0,33.942,0.15), 0.0);
	location lPM1Jump = Location(Vector(75.919,35.95,0.15), 0.0);
	location lCarthJump = Location(Vector(75.919,31.95,0.15), 0.0);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 0.5);
	
	SetFacing(DIRECTION_WEST);
	
	CP_PartyJump(oPC, lPCJump);
	DelayCommand(0.5, AssignCommand(oPC, SetFacingPoint(GetPosition(oDustil))));
	DelayCommand(1.5, SetLockOrientationInDialog(oPC, TRUE));
	
	CP_PartyJump(oCarth, lCarthJump);
	DelayCommand(0.5, AssignCommand(oCarth, SetFacingPoint(GetPosition(oDustil))));

	if (oPM1 != oCarth)
		{
			CP_PartyJump(oPM1, lPM1Jump);
			DelayCommand(0.1, AssignCommand(oPM1, SetFacingPoint(GetPosition(oDustil))));
		}
			
	if (GetIsObjectValid(oPM2) && oPM2 != oCarth)
		{
			CP_PartyJump(oPM2, lPM1Jump);
			DelayCommand(0.1, AssignCommand(oPM2, SetFacingPoint(GetPosition(oDustil))));
		}
}
