////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_cutscene.dlg on Entry 165 (danm14ad - Sandral Grounds)
	
	This script is part of the constant, unceasing war against dialogue facing
	issues. Wrangling the party at the start of the final Feud cutscene is a
	real pain in the ass. This is a last-ditch effort to get these jokers in
	line.
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oRah = GetObjectByTag("dan14_rahasia", 0);
	
	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oPM1, ActionDoCommand(SetCommandable(TRUE, oPM1))));
	DelayCommand(0.1, AssignCommand(oPM2, ActionDoCommand(SetCommandable(TRUE, oPM2))));
	DelayCommand(0.2, AssignCommand(oPM1, SetFacingPoint(GetPosition(oRah))));
	DelayCommand(0.2, AssignCommand(oPM2, SetFacingPoint(GetPosition(oRah))));
}
