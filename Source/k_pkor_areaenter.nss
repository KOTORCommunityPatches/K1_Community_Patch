////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Module OnEnter for korr_m39aa (Korriban Tomb of Naga Sadow)
	
	This is the OnEnter which has been edited to cure the really annoying
	momentary fade-in that happens between the module loading and the
	initial cutscene starting when first entering with Uthar and Yuthura.
	
	Issue #167: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/167
	
	DP 2019-08-23                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int GetFlag() {
	
	return UT_GetPlotBooleanFlag(GetModule(), SW_PLOT_BOOLEAN_06);
}

void PLCAnim() {
	
	object oPillarBase1 = GetObjectByTag("k39_plc_base1", 0);
	object oPillarBase2 = GetObjectByTag("k39_plc_base2", 0);
	object oPillarBase3 = GetObjectByTag("k39_plc_base3", 0);
	object oPillarLower1 = GetObjectByTag("k39_plc_lower1", 0);
	object oPillarLower2 = GetObjectByTag("k39_plc_lower2", 0);
	object oPillarLower3 = GetObjectByTag("k39_plc_lower3", 0);
	object oPillarUpper1 = GetObjectByTag("k39_plc_upper1", 0);
	object oPillarUpper2 = GetObjectByTag("k39_plc_upper2", 0);
	object oPillarUpper3 = GetObjectByTag("k39_plc_upper3", 0);
	object oPillarTop1 = GetObjectByTag("k39_plc_top1", 0);
	object oPillarTop2 = GetObjectByTag("k39_plc_top2", 0);
	object oPillarTop3 = GetObjectByTag("k39_plc_top3", 0);
	
	AssignCommand(oPillarBase2, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarBase3, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarLower2, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarLower3, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarUpper2, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarUpper3, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarTop2, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarTop3, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
	AssignCommand(oPillarBase1, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
	AssignCommand(oPillarLower1, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
	AssignCommand(oPillarUpper1, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
	AssignCommand(oPillarTop1, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
}

void main() {
	
	object oHanoi = GetObjectByTag("k39_plc_pillcomp", 0);
	
	if ((!GetLoadFromSaveGame()) && (!GetFlag()))
		{
			HoldWorldFadeInForDialog();
			UT_SetPlotBooleanFlag(GetModule(), SW_PLOT_BOOLEAN_06, TRUE);
		}
	
	if ((!UT_GetTalkedToBooleanFlag(oHanoi)))
		{
			PLCAnim();
		}
}
