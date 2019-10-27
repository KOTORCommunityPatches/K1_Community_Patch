////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	k_pdan_elise_d
	
	OnUserDefinedEvent script for Elise and her droid. Fixed to correct their
	movement speeds on completion of the "Missing Companion" quest.
	
	Issue #153: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/153
	
	JC 2019-10-27                                                             */
////////////////////////////////////////////////////////////////////////////////
#include "k_inc_dan"
void main() {

int nEvent = GetUserDefinedEventNumber();
switch (nEvent) {
	case 10:
	   // PlotLeave("dan14aa_wp_elise",1,6,TRUE);
		if( GetTag(OBJECT_SELF) == "dan14_c8692" ){
			ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectMovementSpeedIncrease(30), OBJECT_SELF, 300.0);
			ActionWait(0.75);
			}
		ActionForceMoveToObject(GetObjectByTag("dan14aa_wp_elise6"), FALSE, 1.0, 60.0f);
		ActionDoCommand(DestroyObject(OBJECT_SELF));
		SetCommandable(FALSE);
	break;
	case 20:
		//PlotLeave("dan14aa_wp_elise",7,7,TRUE);
		ActionForceMoveToObject(GetObjectByTag("dan14aa_wp_elise7"), TRUE, 1.0, 10.0f);
		ActionDoCommand(DestroyObject(OBJECT_SELF));
		SetCommandable(FALSE);
	break;
	case 30:
		NoClicksFor(0.7);
		DelayCommand(0.5,ActionStartConversation(GetFirstPC(), "", FALSE, CONVERSATION_TYPE_CINEMATIC,TRUE));
	break;
	case 100:
		ActionMoveToObject(GetObjectByTag("k_exit"), FALSE);
		ActionDoCommand(DestroyObject(OBJECT_SELF));
		SetCommandable(FALSE);
	}

}

