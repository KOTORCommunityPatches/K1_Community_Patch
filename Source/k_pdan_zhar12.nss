////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg on Entry 102 in danm13 (Jedi Enclave).
	
	Originally this script handled some of the post-training montage scene
	setup, but that has now all been folded into k_pdan_cut04. This script
	is instead now used to ensure the party's facing is correct post-jump.
	Forcing the companions to walk forwards a meter from their starting
	positions was the most expedient way to get them to co-operate.
	
	Issue #83: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/83
	
	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
    
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	location lPM1 = Location(Vector(76.44,48.0,4.925), -90.0);
	location lPM2 = Location(Vector(76.44,44.65,4.925), -90.0);
	
	DelayCommand(0.2, AssignCommand(oPC, SetFacingPoint(GetPosition(oZhar))));
	DelayCommand(0.1, AssignCommand(oPM1, ClearAllActions()));
	DelayCommand(0.1, AssignCommand(oPM2, ClearAllActions()));
	DelayCommand(0.2, AssignCommand(oPM1, ActionMoveToLocation(lPM1, FALSE)));
	DelayCommand(0.2, AssignCommand(oPM2, ActionMoveToLocation(lPM2, FALSE)));
}
