////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_theone.dlg in unk_m43aa (Unknown World The One's Settlement).
	
	This script is fired after bringing back the Elder's sacred tome to The
	One. It's the first of two scripts that walk the party out and back in
	during a short interstitial scene where The One reads the tome. The original
	script lacked the ClearAllActions commands, which causes the party members
	to ignore their marching orders. This subsequently caused problems when the
	second script fired, causing pathfinding to flake out. In addition to fixing
	this, the timings have been tweaked, and the party has also been forcibly
	jumped after the fade to black to ensure they are in good positions when the
	subsequent script fires. 
	
	See also k_punk_theone07 and cp_unk_onepmwarp.
	
	Issue #170: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/170
	
	DP 2019-06-26                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oPM0Move = GetObjectByTag("priswp2", 0);
	object oPM1Move = GetObjectByTag("priswp21", 0);
	object oPM2Move = GetObjectByTag("priswp22", 0);
	location lPM0Jump = Location(Vector(44.0,136.794,40.683), 0.0);
	
	ActionPauseConversation();
	
	AssignCommand(oPM0, ClearAllActions());
	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	
	DelayCommand(0.1, AssignCommand(oPM0, ActionMoveToLocation(GetLocation(oPM0Move), FALSE)));
	DelayCommand(1.5, AssignCommand(oPM1, ActionMoveToLocation(GetLocation(oPM1Move), FALSE)));
	DelayCommand(1.5, AssignCommand(oPM2, ActionMoveToLocation(GetLocation(oPM2Move), FALSE)));
	
	SetGlobalFadeOut(3.0, 1.0);
	
	DelayCommand(4.3, AssignCommand(oPM0, ActionJumpToLocation(lPM0Jump)));
	DelayCommand(4.3, AssignCommand(oPM1, JumpToObject(oPM1Move)));
	DelayCommand(4.3, AssignCommand(oPM2, JumpToObject(oPM2Move)));
	
	DelayCommand(4.75, ActionResumeConversation());
}
