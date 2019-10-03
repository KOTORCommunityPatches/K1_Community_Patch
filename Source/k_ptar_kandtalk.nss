//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for ptar_secdoor001.utd in tar_m10ac (Taris Black Vulkar Base Garage).
	
	This is the OnOpen script for the door to the room holding the stolen swoop
	accelerator in the Vulkar base. The party ended up strung out in a line behind
	tables and crates, and Kandon's girlfriend spent the entire	first line staring
	longingly at him. The vanilla script also have a bizarre delay function, which
	seems like it is broken in practice, but it's safer to get rid of it. The party
	is jumped to some new positions out from behind the various crap in the way, and
	Kandon's girlfriend is forced to look at the party.
	
	See also cp_tar11_kangfai.
	
	Issue #241: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/241
	
	DP 2019-10-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oDLGHelper = GetObjectByTag("tar10_kandtalker", 0);
	
	if (!UT_GetTalkedToBooleanFlag(oDLGHelper))
		{
			object oKandGF = GetObjectByTag("KandonArk102", 0);
			location lPC = Location(Vector(104.736,51.87,0.792), 45.0);
			location lPM1 = Location(Vector(104.632,49.845,0.792), 45.0);
			location lPM2 = Location(Vector(102.79,51.684,0.792), 45.0);
			
			NoClicksFor(2.5);
			
			// Delay all commands by a second in order to see the door open first
			
			SetGlobalFadeOut(1.0, 0.0);
			
			// Since unnamed girlfriend can't keep her eyes off Kandon for five seconds,
			// switch off her AI and forcibly face her until the opening line is done.
			DelayCommand(1.0, AssignCommand(oKandGF, CP_DisableAI(TRUE)));
			DelayCommand(1.0, AssignCommand(oKandGF, ActionDoCommand(SetFacing(225.0))));
			
			DelayCommand(1.0, CP_DLGSetup("KandonArk101"));
			DelayCommand(1.0, CP_DLGHerder(lPC, lPM1, lPM2));
			DelayCommand(1.0, CP_DLGInit("KandonArk101", "tar10_kandon01", FALSE, 1.0, 2.0));
		}
}
