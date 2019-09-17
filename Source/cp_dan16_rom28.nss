////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan16_nurik.dlg on Entry 0
	
	This script is part of the constant, unceasing war against dialogue facing
	issues. This replaces the original k_pdan_romance28 fired when Rahasia
	first appears in order to reorient the party members off-screen. It simply
	adds the original setting of a global to the cp_dan16_ptyface script.
	
	DP 2019-02-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oRah = GetObjectByTag("dan16_rahasia", 0);
	
	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oPM1, ActionDoCommand(SetCommandable(TRUE, oPM1))));
	DelayCommand(0.1, AssignCommand(oPM2, ActionDoCommand(SetCommandable(TRUE, oPM2))));
	DelayCommand(0.2, AssignCommand(oPM1, SetFacingPoint(GetPosition(oRah))));
	DelayCommand(0.2, AssignCommand(oPM2, SetFacingPoint(GetPosition(oRah))));

    SetGlobalBoolean("DAN_MEET_DONE", TRUE);
}
