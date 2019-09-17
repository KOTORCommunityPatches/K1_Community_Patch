////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_theone.dlg in unk_m43aa (Unknown World The One's Settlement).
	
	This script has been added to preemptively position the party prior to the
	wide shot of them walking out and back in, masked by the addition of a new
	static camera.
	
	See also k_punk_theone06 and k_punk_theone07.
	
	Issue #170: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/170
	
	DP 2019-06-26                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oTheOne = GetObjectByTag("unk43_theone", 0);
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oPM0Move = GetObjectByTag("playermove", 0);
	object oPM1Move = GetObjectByTag("pm1wp2", 0);
	object oPM2Move = GetObjectByTag("pm2wp2", 0);
	
	AssignCommand(oTheOne, SetFacingPoint(GetPosition(oPM0Move)));
	
	AssignCommand(oPM0, ClearAllActions());
	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	
	DelayCommand(0.1, AssignCommand(oPM0, JumpToObject(oPM0Move)));
	DelayCommand(0.1, AssignCommand(oPM1, JumpToObject(oPM1Move)));
	DelayCommand(0.1, AssignCommand(oPM2, JumpToObject(oPM2Move)));
}
