//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_redelder.dlg in unk_m42aa (Unknown World Elder's Settlement).
	
	This script is one of two that control the council walking in and out during
	the scene where they deliberate on trusting the player after having rescued
	their scout from imprisonment in The One's compound. The vanilla version of
	this scene dragged out, with 15 seconds or so of a black screen. This was
	due to walking the council members to a waypoint and back again. Now once the
	fade-out happens, they are quickly jumped back to their original positions,
	which greatly speeds up proceedings.
	
	This script originally walked the council back to their starting waypoints.
	That has now been changed to a jump. The player is also given a facing
	command, since they could wind up facing off to the side because of the prior
	node.
	
	See also k_punk_elder01.
	
	Issue #169: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/169
	
	DP 2019-10-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oElderB = GetObjectByTag("unk42_redelder2", 0);
	object oElderC = GetObjectByTag("unk42_redelder3", 0);
	location lElderA_WP = GetLocation(GetObjectByTag("eld2", 0));
	location lElderB_WP = GetLocation(GetObjectByTag("eld1", 0));
	location lElderC_WP = GetLocation(GetObjectByTag("eld3", 0));
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ActionDoCommand(SetFacing(DIRECTION_NORTH)));
	
	ActionJumpToLocation(lElderA_WP);
	AssignCommand(oElderB, ActionJumpToLocation(lElderB_WP));
	AssignCommand(oElderC, ActionJumpToLocation(lElderC_WP));
	
	AssignCommand(oElderB, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
	AssignCommand(oElderC, ActionDoCommand(SetFacingPoint(GetPosition(oPC))));
	
	SetGlobalFadeIn(0.75, 2.0);
	
	ActionResumeConversation();
}
