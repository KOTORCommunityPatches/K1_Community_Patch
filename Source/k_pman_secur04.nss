//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man27_sithlieu.dlg in manm27aa (Manaan Sith Base).
	
	This script fires during the scene with the Sith lieutenant in the foyer. It
	commands the diplomat and his droids to walk into the room. This has been
	tweaked to set the facing of the droids and give them an animation. The
	diplomat has also had his UserDefine event changed, since he now has a
	properly formatted OUD script.
	
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, cp_man27_lieufce, k_pman_27_init01,
	k_pman_secur01, k_pman_secur09, k_pman_sith02.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oDip = GetObjectByTag("man27_sithdip", 0);
	object oDroidA = GetObjectByTag("pman_sithwara", 0);
	object oDroidB = GetObjectByTag("pman_sithwarb", 0);
	object oDroidC = GetObjectByTag("pman_sithwarc", 0);
	object oDroidD = GetObjectByTag("pman_sithward", 0);
	object oWPDrdA = GetObjectByTag("POST_pman_sithwara", 0);
	object oWPDrdB = GetObjectByTag("POST_pman_sithwarb", 0);
	object oWPDrdC = GetObjectByTag("POST_pman_sithwarc", 0);
	object oWPDrdD = GetObjectByTag("POST_pman_sithward", 0);
	
	ActionPauseConversation();
	
	ActionDoCommand(SignalEvent(oDip, EventUserDefined(27)));
	
	AssignCommand(oDroidA, ActionMoveToObject(oWPDrdA, FALSE, 0.5));
	AssignCommand(oDroidA, ActionDoCommand(SetFacing(DIRECTION_EAST)));
	AssignCommand(oDroidA, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 0.5));
	
	AssignCommand(oDroidB, ActionMoveToObject(oWPDrdB, FALSE, 0.5));
	AssignCommand(oDroidB, ActionDoCommand(SetFacing(DIRECTION_EAST)));
	AssignCommand(oDroidB, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 0.5));
	
	AssignCommand(oDroidC, ActionMoveToObject(oWPDrdC, FALSE, 0.5));
	AssignCommand(oDroidC, ActionDoCommand(SetFacing(DIRECTION_EAST)));
	AssignCommand(oDroidC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 0.5));
	
	AssignCommand(oDroidD, ActionMoveToObject(oWPDrdD, FALSE, 0.5));
	AssignCommand(oDroidD, ActionDoCommand(SetFacing(DIRECTION_EAST)));
	AssignCommand(oDroidD, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 0.5));
}
