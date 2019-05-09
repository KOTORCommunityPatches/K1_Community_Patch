////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Jedi Enclave).

	This script is fired at the start of the second and third conversations
	with the Council, after the vision of Revan and Malak in the ruins and
	discovery the Star Map, respectively. It jumps the player to the entrance
	of the chamber, then runs them to the Council. The original script only
	directed the player, so this has been revised to also herd the party members
	into specific positions.

	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPCWP = GetObjectByTag("dan13_WP_council", 0);
	object oVandar = GetObjectByTag("dan13_vandar", 0);
	object oVrook = GetObjectByTag("dan13_vrook", 0);
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	object oDorak = GetObjectByTag("dan13_dorak", 0);
	location lPCStart = Location(Vector(94.105,43.66,4.487), -47.0);
	location lPM1Start = Location(Vector(91.188,43.953,4.732), -47.0);
	location lPM2Start = Location(Vector(93.762,46.542,4.732), -47.0);
	location lPC = Location(Vector(103.911,33.321,4.12), 0.0);
	location lPM1 = Location(Vector(101.8,33.55,4.08), 0.0);
	location lPM2 = Location(Vector(103.85,35.35,4.085), 0.0);
	
	ActionPauseConversation();
	
	//Jump the party into position for the initial shot
	CP_PartyHerder(lPCStart, lPM1Start, lPM2Start, TRUE, FALSE);
	
	//Make the Council members face the PC'S destination
	AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVandar, SetFacingPoint(GetPosition(oPCWP))));
	AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVrook, SetFacingPoint(GetPosition(oPCWP))));
	AssignCommand(oZhar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oZhar, SetFacingPoint(GetPosition(oPCWP))));
	AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oDorak, SetFacingPoint(GetPosition(oPCWP))));
	
	//Run the party to the Council
	DelayCommand(0.5, CP_DLGHerder(lPC, lPM1, lPM2, FALSE, TRUE));
	
	ActionWait(6.0);
	ActionResumeConversation();
	DelayCommand(2.0, SetDialogPlaceableCamera(37));
}