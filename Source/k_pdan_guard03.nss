////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan15_ancientdrd.dlg in danm15 (Dantooine Ruins).
	
	This script fires on one of the early nodes of the DLG the first time the
	party enters the ruins and triggers the conversation with the overseer droid.
	The positioning has been altered slightly from the vanilla waypoints, and the
	contents of k_pdan_bast01 has been directly incorporated. Additionally, both
	the player and Bastila have had their orientation locked to prevent some
	undesirable facing that was occurring.
	
	See also k_pdan_guard04.
	
	DP 2019-07-31                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oBot = GetObjectByTag("dan15_ancientdrd", 0);
	location lPC = Location(Vector(145.781,132.0,4.417), 90.0);
	location lBast = Location(Vector(148.181,132.0,4.417), 90.0);
	
	CP_PartyMove(oPC, lPC, FALSE);
	DelayCommand(0.5, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(GetPosition(oBot)))));
	DelayCommand(1.5, SetLockOrientationInDialog(oPC, TRUE));
	
	SetLocalBoolean(oBast, SW_FLAG_AI_OFF, TRUE);
	CP_PartyMove(oBast, lBast, FALSE);
	DelayCommand(0.5, AssignCommand(oBast, ActionDoCommand(SetFacingPoint(GetPosition(oBot)))));
	DelayCommand(1.5, SetLockOrientationInDialog(oBast, TRUE));
}
