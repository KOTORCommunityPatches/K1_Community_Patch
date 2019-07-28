void main() {
	
	object oPC = GetFirstPC();
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	
	ActionPauseConversation();
	
	AssignCommand(oPC, ClearAllActions());
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 30.0));
	
	if (GetIsObjectValid(oMekel))
		{
			AssignCommand(oMekel, ClearAllActions());
			AssignCommand(oMekel, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 30.0));
		}
	
	if (GetIsObjectValid(oPM1))
		{
			AssignCommand(oPM1, ClearAllActions());
			AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 30.0));
		}
	
	if (GetIsObjectValid(oPM2))
		{
			AssignCommand(oPM2, ClearAllActions());
			AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 30.0));
		}
	
	ActionResumeConversation();
}

