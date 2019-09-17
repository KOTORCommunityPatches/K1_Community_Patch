////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_lashowe.dlg in korr_m36aa (Korriban Valley of Dark Lords).

	This script is fired at the start of the conversation with Lashowe if you
	agreed to help her kill a Tukata mother to get a holocron. It spawns the
	three Tukata off-screen while Lashowe is talking. The vanilla positioning
	was ok, but because of the AI idle routines they tended to turn in-place
	and face each other. In order to whip them into shape, their AI is briefly
	disabled and they spawned further back and then made to walk forwards so
	that they are facing the camera for their reveal shot.
	
	See also k_pkor_lashqueen and k36_las_tukatasp.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-04                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"
#include "k_inc_generic"

void ToggleAI(int nIndex, int nState) {
	SetLocalBoolean(OBJECT_SELF, nIndex, nState);
}

void TukMove() {
	
	object oTukQueen = GetObjectByTag("kor36_tukataquee", 0);
	object oTukMook1 = GetObjectByTag("kor36_tukatahen1", 0);
	object oTukMook2 = GetObjectByTag("kor36_tukatahen2", 0);
	location lQueenEnd = Location(Vector(108.2,248.0,1.66), 180.0);
	location lMook1End = Location(Vector(111.5,250.0,2.23), 180.0);
	location lMook2End = Location(Vector(111.5,246.0,2.04), 180.0);
	
	AssignCommand(oTukQueen, ToggleAI(SW_FLAG_AI_OFF, TRUE));
	AssignCommand(oTukMook1, ToggleAI(SW_FLAG_AI_OFF, TRUE));
	AssignCommand(oTukMook2, ToggleAI(SW_FLAG_AI_OFF, TRUE));
	
	DelayCommand(0.5, AssignCommand(oTukQueen, ActionMoveToLocation(lQueenEnd, TRUE)));
	DelayCommand(1.0, AssignCommand(oTukMook1, ActionMoveToLocation(lMook1End, TRUE)));
	DelayCommand(1.0, AssignCommand(oTukMook2, ActionMoveToLocation(lMook2End, TRUE)));
}

void main() {
	
	UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
	
	if (!GetGlobalBoolean("KOR_LASHOWE_TUK"))
		{
			location lQueenSp = Location(Vector(115.0,248.0,2.83), 180.0);
			location lMook1Sp = Location(Vector(118.0,250.0,3.3), 180.0);
			location lMook2Sp = Location(Vector(118.0,246.0,3.3), 180.0);
			
			CreateObject(OBJECT_TYPE_CREATURE, "kor36_tukataquee", lQueenSp);
			CreateObject(OBJECT_TYPE_CREATURE, "kor36_tukatahen1", lMook1Sp);
			CreateObject(OBJECT_TYPE_CREATURE, "kor36_tukatahen2", lMook2Sp);
			
			DelayCommand(1.0, TukMove());
			
			SetGlobalBoolean("KOR_LASHOWE_TUK", TRUE);
		}
}
