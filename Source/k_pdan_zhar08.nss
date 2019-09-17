////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg in danm13 (Dantooine Jedi Enclave).
	
	This script fires when the player enters the Council chambers for the
	first time after arriving on Dantooine post-Taris. Additions were made
	in order to get the Council to properly face the player, and the switch
	from the overhead camera to the Zhar closeup was done sooner.
	
	Issue #151: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/151
	
	DP 2019-07-29                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oVandar = GetObjectByTag("dan13_vandar", 0);
	object oVrook = GetObjectByTag("dan13_vrook", 0);
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	object oDorak = GetObjectByTag("dan13_dorak", 0);
	object WP_Start = GetObjectByTag("wp_pc_start", 0);
	location lWP_End = Location(Vector(103.204,34.028,4.1), -45.0);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionJumpToObject(WP_Start));
	AssignCommand(oPC, ActionMoveToLocation(lWP_End, TRUE));
	
	AssignCommand(oZhar, SetCommandable(TRUE, OBJECT_SELF));
	AssignCommand(oZhar, ClearAllActions());
	AssignCommand(oZhar, SetFacingPoint(GetPositionFromLocation(lWP_End)));	
	AssignCommand(oDorak, SetCommandable(TRUE, OBJECT_SELF));
	AssignCommand(oDorak, ClearAllActions());
	AssignCommand(oDorak, SetFacingPoint(GetPositionFromLocation(lWP_End)));
	AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
	AssignCommand(oVandar, ClearAllActions());
	AssignCommand(oVandar, SetFacingPoint(GetPositionFromLocation(lWP_End)));
	AssignCommand(oVrook, SetCommandable(TRUE, OBJECT_SELF));
	AssignCommand(oVrook, ClearAllActions());
	AssignCommand(oVrook, SetFacingPoint(GetPositionFromLocation(lWP_End)));
	
	DelayCommand(2.0, SetDialogPlaceableCamera(37));
	
	DelayCommand(3.5, SetDialogPlaceableCamera(2));
	
	DelayCommand(12.0, ActionResumeConversation());
}
