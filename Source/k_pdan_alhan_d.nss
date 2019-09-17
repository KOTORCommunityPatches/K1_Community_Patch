////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Ahlan Matale's OnUserDefine in danm13 (Jedi Enclave).
	
	This an edit of Ahlan's OUD script to adjust his positioning during his
	post-Juhani Council debrief interjection. He was ending up floating in
	mid-air over the edge of the central circle in the Council chambers, so
	he was spawned in further back and made to walk towards his original
	position, but not so close to the edge. This element (Case 10) handles
	the initial spawn in. The walk and second location is handled by
	k_pdan_alhan07, which is fired by dan13_ahlan.dlg.
	
	Issue #55: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/55
	
	DP 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	int int1 = GetUserDefinedEventNumber();
	string string1 = "dan13_wp_ahlan";
	
	switch (int1) {
		case 0:
			ActionPlayAnimation(ANIMATION_LOOPING_PAUSE3, 1.0, 0.0);
			if ((Random(3) == 0)) {
				ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD, 1.0, 0.0);
			}
			if ((Random(3) == 0)) {
				ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.0);
			}
			if ((Random(2) == 0)) {
				ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 0.0);
			}
			if ((Random(3) == 0)) {
				ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 1.0, 0.0);
			}
			if ((Random(3) == 0)) {
				ActionPlayAnimation(ANIMATION_FIREFORGET_ACTIVATE, 1.0, 0.0);
			}
			ActionDoCommand(SignalEvent(OBJECT_SELF, EventUserDefined(0)));
			break;
		case 10:
			ClearAllActions();
			ActionJumpToLocation(Location(Vector(90.0,48.0,5.0), 0.0));
			break;
		case 20:
			ClearAllActions();
			ActionMoveToObject(GetObjectByTag("dan13_wp_ahlan2", 0), 0, 1.0);
			break;
		case 30:
			UT_SetPlotBooleanFlag(OBJECT_SELF, 4, TRUE);
			ActionStartConversation(GetFirstPC(), "", 0, 0, 1, "", "", "", "", "", "", 0);
	}
}
