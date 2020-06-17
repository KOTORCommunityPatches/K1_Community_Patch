//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_base_dlg.dlg in tar_m02ab (Taris Upper City North).
	
	This is script fires on the opening node of the DLG for the cutscene of T3
	opening the Taris Sith Base door. The original script was configured on the
	assumption that T3 would already be sitting directly in front of the door,
	so that is changed to first move him to the door, since the trigger now jumps
	the whole party before the scene starts.
	
	See also k_ptar_openbase.
	
	Issue #400: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/400
	
	DP 2020-06-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oT3 = GetObjectByTag("t3m4", 0);
	object oHelper = GetObjectByTag("tar02_drdtalker", 0);
	object oDoor = GetObjectByTag("tar02_sithdoor", 0);
	object oSFX = GetObjectByTag("weldingdroid", 0);
	location lT3 = Location(Vector(112.52,226.517,0.0), 90.0);
	
	NoClicksFor(8.0);
	
	SetGlobalFadeIn(0.0, 1.0);
	
	ActionPauseConversation();
	
	CP_PartyMove(oT3, lT3, FALSE);
	AssignCommand(oT3, DelayCommand(2.5, ActionPlayAnimation(ANIMATION_LOOPING_WELD, 1.0, 3.0)));
	AssignCommand(oT3, DelayCommand(3.5, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
	
	DelayCommand(2.5, SoundObjectPlay(oSFX));
	DelayCommand(5.5, SoundObjectStop(oSFX));
	
	DelayCommand(5.5, AssignCommand(oDoor, ActionUnlockObject(oDoor)));
	DelayCommand(5.5, AssignCommand(oDoor, ActionOpenDoor(oDoor)));
	
	DelayCommand(8.0, ActionResumeConversation());
}
