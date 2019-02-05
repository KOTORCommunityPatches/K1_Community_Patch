////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan16_nurik.dlg on Entry 28
	
	This script is part of the constant, unceasing war against dialogue facing
	issues. After the Bastila and Carth back and forth in this conversation,
	they remain facing towards each other, which looks a bit weird. This gives
	them a little nudge in the right direction, as well as doing the same for
	any other companions that may be present.
	
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
}