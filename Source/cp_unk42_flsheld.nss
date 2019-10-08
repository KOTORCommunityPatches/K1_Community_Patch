//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_redelder.dlg in unk_m42aa (Unknown World Elder's Settlement).
	
	This is an added EndConversation script to address some freezing issues that
	could happen with the Elder. It forces an animation to make sure he isn't
	stuck once the conversation is over.
	
	Issue #169: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/169
	
	DP 2019-10-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ClearAllActions();
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 2.0);
}
