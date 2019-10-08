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
	
	This script controls the initial walking to the waypoint. The timings have been
	tweaked and everyone is given a ClearAllActions once the fade-out has happened.
	
	See also k_punk_elder02.
	
	Issue #169: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/169
	
	DP 2019-10-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oElderB = GetObjectByTag("unk42_redelder2", 0);
	object oElderC = GetObjectByTag("unk42_redelder3", 0);
	location lWP = GetLocation(GetObjectByTag("rakspawn1", 0));
	
	ActionPauseConversation();
	
	NoClicksFor(5.5);
	
	ActionMoveToLocation(lWP);
	AssignCommand(oElderB, ActionMoveToLocation(lWP));
	AssignCommand(oElderC, ActionMoveToLocation(lWP));
	
	DelayCommand(3.5, ClearAllActions());
	DelayCommand(3.5, AssignCommand(oElderB, ClearAllActions()));
	DelayCommand(3.5, AssignCommand(oElderC, ClearAllActions()));
	
	SetGlobalFadeOut(1.5, 1.5);
	
	DelayCommand(5.0, ActionResumeConversation());
}
