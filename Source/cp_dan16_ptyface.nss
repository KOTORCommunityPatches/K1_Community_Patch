////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan16_nurik.dlg in danm16 (Dantooine Sandral Estate).
	
	This script is part of the constant, unceasing war against dialogue facing
	issues. After the Bastila and Carth back and forth in the Rahasia segment
	of conversation, they remain facing towards each other, which looks a bit
	weird. This gives them a little nudge in the right direction, as well as
	doing the same for any other companions that may be present.
	
	Updated 2019-05-02 to add a conditional check to allow for the option of
	also using it to face Nurik earlier in the conversation.
	
	DP 2019-02-06                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oRah = GetObjectByTag("dan16_rahasia", 0);
	object oNurik = GetObjectByTag("dan16_nurik", 0);
	object oTarget;

	if(GetIsObjectValid(oNurik))
		{
			oTarget = oNurik;
		}
	else
		{
			oTarget = oRah;
		}

	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	DelayCommand(0.1, AssignCommand(oPM1, ActionDoCommand(SetCommandable(TRUE, oPM1))));
	DelayCommand(0.1, AssignCommand(oPM2, ActionDoCommand(SetCommandable(TRUE, oPM2))));
	DelayCommand(0.2, AssignCommand(oPM1, SetFacingPoint(GetPosition(oTarget))));
	DelayCommand(0.2, AssignCommand(oPM2, SetFacingPoint(GetPosition(oTarget))));
}
