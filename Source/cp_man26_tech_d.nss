//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnUserDefine for man26_reptech.utc in manm26ae (Manaan East Central).
	
	This is the OUD for the tech in the Republic Embassy, in charge of slicing
	the passcards for the Sith Base. Once he finishes his introduction, he will
	move to the terminal in the corner and start running through the ambient
	animations in the OUD. If you talk to him, he will re-orient on the player
	and remain facing that direction once the conversation finishes. That will
	leave him typing in mid-air, which is not ideal. This modification simply
	checks his current orientation and, if needed, points him back in the right
	direction. Modified from the vanilla global OUD he used, k_pman_ambient01.
	
	See also k_pman_tech10.
	
	Issue #273: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/273
	
	DP 2019-10-03																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	if (GetFacing(OBJECT_SELF) != 45.0)SetFacing(45.0);
	
	ActionPlayAnimation(ANIMATION_FIREFORGET_USE_COMPUTER);
	
	if (Random(3) == 0)ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_SCRATCH_HEAD);
	if (Random(3) == 0)ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
	if (Random(3) == 0)ActionPlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_RIGHT);
	if (Random(3) == 0)ActionPlayAnimation(ANIMATION_FIREFORGET_PAUSE_BORED);

	ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(0)));
}
