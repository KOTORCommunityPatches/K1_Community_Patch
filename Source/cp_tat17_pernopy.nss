//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_01cust_01.dlg in tat_m17ab (Tatooine Docking Bay).
	
	This script replaces the vanilla script on E18 (k_ptat_docknopay) when the
	player successfully Force persuades the customs officer that they don't need
	to pay the docking fee. In addition to setting a plot flag to denote that the
	fee issue is resolved, the script now also has the player use the persuade
	animation rather than forcing it through the DlG itself, in order for it to
	properly appear in frame. This had to be split out to its own script since
	the vanilla script is also used for the regular persuade success line.
	
	Issue #308: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/308
	
	DP 2023-01-04																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tat"

void main() {
	
	object oPC = GetFirstPC();
	
	SetDockingPaidLocal(TRUE, OBJECT_SELF);
	
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_PERSUADE));
}
