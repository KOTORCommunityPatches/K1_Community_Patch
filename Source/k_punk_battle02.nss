//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk43_battle.dlg in unk_m43aa (Lehon The One's Settlement).
	
	This is one of the scripts used in the cutscene with The One when taking the
	Light Side route on the Unknown World and siding with the Elders. The scene
	fires as soon as you enter the amphitheatre and has The One run to the lever
	that controls the gates to the Rancor pens. There were a few issues in this
	scene due to timings and camera angles, so those have been changed. Here,
	he is given a command to run to the level, since in the vanilla version he
	just got the command to activate it, which caused him to slide along the
	ground.
	
	See also k_punk_battle05.
	
	Issue #287: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/287
	
	DP 2019-10-01																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oLever = GetObjectByTag("unk43_ranclever", 0);
	object oTheOne = GetObjectByTag("unk43_theone", 0);
	
	ActionPauseConversation();
	
	ActionForceMoveToObject(oLever, TRUE, 0.75);
	
	SetLockOrientationInDialog(oTheOne, TRUE);
	
	ActionResumeConversation();
}
