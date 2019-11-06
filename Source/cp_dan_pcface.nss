//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg in danm13 (Dantooine Jedi Enclave).
	
	This is an added script to reface the player off-screen during one of Bastila's
	lines in the first conversation with the Council.
	
	Issue #151: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/151
	
	DP 2019-11-07																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	object oZhar = GetObjectByTag("dan13_zhar", 0);
	
	NoClicksFor(1.5);
	
	DelayCommand(1.0, AssignCommand(oPC, SetFacingPoint(GetPosition(oZhar))));
	DelayCommand(1.2, AssignCommand(oPC, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT)));
}
