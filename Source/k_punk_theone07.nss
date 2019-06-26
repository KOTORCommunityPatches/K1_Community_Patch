////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_theone.dlg in unk_m43aa (Unknown World The One's Settlement).
	
	This script is fired after bringing back the Elder's sacred tome to The
	One. It's the second of two scripts that walk the party out and back in
	during a short interstitial scene where The One reads the tome. The timings
	have been tweaked, and the party member destinations were also changed to
	reduce repositioning after the conversation finishes (party members are
	extremely finicky about their distance from the PC). 
	
	See also k_punk_theone06 and cp_unk_onepmwarp.
	
	DP 2019-06-26                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oPM0Move = GetObjectByTag("playermove", 0);
	location lPM1Move = Location(Vector(37.781,135.4,40.683), 0.0);
	location lPM2Move = Location(Vector(37.806,138.2,40.683), 0.0);
		
	ActionPauseConversation();
	
	AssignCommand(oPM0, ClearAllActions());
	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	
	DelayCommand(0.1, AssignCommand(oPM0, ActionMoveToLocation(GetLocation(oPM0Move), FALSE)));
	DelayCommand(1.1, AssignCommand(oPM1, ActionMoveToLocation(lPM1Move, FALSE)));
	DelayCommand(1.1, AssignCommand(oPM2, ActionMoveToLocation(lPM2Move, FALSE)));
	
	SetGlobalFadeIn(1.25, 1.0);
	DelayCommand(3.5, ActionResumeConversation());
}
