//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).

	This script is fired at the start of the second and third conversations
	with the Council, after the vision of Revan and Malak in the ruins and
	discovery the Star Map, respectively. It jumps the player to the entrance
	of the chamber, then runs them to the Council. The original script only
	directed the player, so this has been revised to also herd the party members
	into specific positions.
	
	Updated 2019-08-02 to adjust the party end locations to more closely match
	the vanilla positioning for improved static camera framing consistency and
	add a brief fade-in to mask the initial jump.
	
	Updated 2021-12-09 to strip Force Speed off the party, if applicable.
	
	Issue #104: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/104
	
	Issue #505: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/505

	DP 2019-05-02 / DP 2019-08-02 / DP 2021-12-09								*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oVandar = GetObjectByTag("dan13_vandar", 0);
	object oVrook = GetObjectByTag("dan13_vrook", 0);
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	object oDorak = GetObjectByTag("dan13_dorak", 0);
	location lPCStart = Location(Vector(94.105,43.66,4.487), -47.0);
	location lPM1Start = Location(Vector(91.188,43.953,4.732), -47.0);
	location lPM2Start = Location(Vector(93.762,46.542,4.732), -47.0);
	location lPC = Location(Vector(103.204,34.028,4.08), -47.0);
	location lPM1 = Location(Vector(101.164,34.08,4.04), -47.0);
	location lPM2 = Location(Vector(103.142,36.058,4.04), -47.0);
	vector vPC = GetPositionFromLocation(lPC);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.6, 0.5);
	
	// Clear off Force Speed, if applied.
	AssignCommand(oPM0, ClearAllEffects());
	AssignCommand(oPM1, ClearAllEffects());
	AssignCommand(oPM2, ClearAllEffects());
	
	//Jump the party into position for the initial shot
	CP_PartyHerder(lPCStart, lPM1Start, lPM2Start, TRUE, FALSE);
	
	//Make the Council members face the PC'S destination
	AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVandar, SetFacingPoint(vPC)));
	AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oVrook, SetFacingPoint(vPC)));
	AssignCommand(oZhar, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oZhar, SetFacingPoint(vPC)));
	AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
	DelayCommand(0.1, AssignCommand(oDorak, SetFacingPoint(vPC)));
	
	//Run the party to the Council
	DelayCommand(0.5, CP_DLGHerder(lPC, lPM1, lPM2, FALSE, TRUE));
	
	DelayCommand(2.0, SetDialogPlaceableCamera(37));
	
	DelayCommand(6.0, ActionResumeConversation());
}
