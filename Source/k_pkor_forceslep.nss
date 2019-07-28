#include "k_inc_utility"

void main() {
	
	object oMekel = GetObjectByTag("kor38b_mekel", 0);
	
	UT_ActionPauseConversation(2.0);
	
	AssignCommand(GetFirstPC(), ClearAllActions());
	AssignCommand(GetFirstPC(), PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
	
	AssignCommand(oMekel, ClearAllActions());
	AssignCommand(oMekel, PlayAnimation(ANIMATION_LOOPING_SLEEP, 1.0, 999.0));
}
