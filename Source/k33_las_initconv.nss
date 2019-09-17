////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by k33_las_initconv.utt in korr_m33aa (Korriban Dreshdae)
	
	This script triggers the conversation with Lashowe and her mooks. It
	has been changed to forcibly jump the party into position, in combination
	with a GIT position tweak for Lashowe and friends. The vanilla version
	could be triggered from multiple angles, leading to a real mess, not
	least because on one side a wandering NPC could cause party members
	to constantly freak out due to pathing issues.
	
	See also k_pkor_lashturn1, k_pkor_lashturn2, cp_kor33_fcelash, and k_pkor_lashleave.
	
	Issue #160: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/160
	
	DP 2019-08-09                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

int GetFlag() {
	
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

void ToggleAI(int nState) {
	
	SetLocalBoolean(OBJECT_SELF, SW_FLAG_AI_OFF, nState);
}

void FaceLash(object oNPC) {
	
	object oLash = GetObjectByTag("kor33_lashowe", 0);
	
	AssignCommand(oNPC, ClearAllActions());
	AssignCommand(oNPC, ActionDoCommand(SetCommandable(TRUE, oNPC)));
	AssignCommand(oNPC, SetFacingPoint(GetPosition(oLash)));
}

void main() {
	
	object oEntering = GetEnteringObject();
	
	if ((GetIsPC(oEntering)) && (GetFlag() == FALSE))
		{
			
			object oMook1 = GetObjectByTag("kor33_lasfriend1", 0);
			object oMook2 = GetObjectByTag("kor33_lasfriend2", 0);
			location lPC = Location(Vector(179.366,197.427,5.31), 60.0);
			location lPM1 = Location(Vector(177.187,196.877,5.31), 60.0);
			location lPM2 = Location(Vector(179.937,195.268,5.31), 60.0);
			
			NoClicksFor(0.4);
			
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			SetGlobalFadeOut();
			
			AssignCommand(oMook1, ToggleAI(TRUE));
			AssignCommand(oMook2, ToggleAI(TRUE));
			
			DelayCommand(0.2, FaceLash(oMook1));
			DelayCommand(0.2, FaceLash(oMook2));
			
			DelayCommand(0.4, CP_DLGSetup("kor33_lashowe"));
			DelayCommand(0.4, CP_DLGHerder(lPC, lPM1, lPM2));
			DelayCommand(0.4, CP_DLGInit("kor33_lashowe", "", FALSE, 0.5, 1.5));
		}
}
