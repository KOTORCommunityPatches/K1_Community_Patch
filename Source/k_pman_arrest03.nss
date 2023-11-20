////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_selarrest.dlg in manm26ab (Manaan Ahto East).
	
	This script fires during the arrest scene when the player exits the Manaan
	Sith Base. The original script had one of the droids start walking towards
	the exit, then signalled the PC to execute another script (k_pman_player30)
	to also start walking. This was so the PC's action stack could be used to
	time the resumption of the scene. Since the PC has now been jumped back so
	that they start out of shot in widescreen resolutions, the scene has had to
	be extended, necessitating removing the in-DLG fade and adding a scripted one.
	As such, the PC's commands have been rolled into this script. Additionally,
	now the entire Selkath arrest party gets moved to escort the PC out. In the
	original version all of them bar the one droid would stand around while the
	PC wandered off.
	
	Issue #136: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/136
	
	DP 2023-11-20																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	string sDroid = "man26_drdcut";
	location lPCJmp = Location(Vector(41.66,10.67,57.50), 249.00);
	location lWalk = Location(Vector(23.09,4.43,57.50), 180.00);
	
	ActionPauseConversation();
	
	NoClicksFor(8.0);
	
	AssignCommand(oPC, JumpToLocation(lPCJmp));
	AssignCommand(oPC, ActionMoveToObject(GetObjectByTag("arrest_player_02", 0)));
	AssignCommand(oPC, ActionMoveToLocation(lWalk));
	
	SetGlobalFadeOut(5.75, 2.0);
	
	CP_RemoveForceSpeed(oPC);
	
	AssignCommand(GetObjectByTag("man26_selcut03", 0), DelayCommand(3.0, ActionMoveToLocation(lWalk)));
	AssignCommand(GetObjectByTag(sDroid + "01", 0), DelayCommand(4.0, ActionMoveToLocation(lWalk)));
	AssignCommand(GetObjectByTag(sDroid + "03", 0), DelayCommand(5.0, ActionMoveToLocation(lWalk)));
	AssignCommand(GetObjectByTag(sDroid + "05", 0), DelayCommand(6.0, ActionMoveToLocation(lWalk)));
	AssignCommand(GetObjectByTag(sDroid + "04", 0), DelayCommand(6.5, ActionMoveToLocation(lWalk)));
	AssignCommand(GetObjectByTag(sDroid + "02", 0), DelayCommand(7.0, ActionMoveToLocation(lWalk)));
	
	DelayCommand(8.0, ActionResumeConversation());
}
