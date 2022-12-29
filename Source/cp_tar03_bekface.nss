//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	EndConversation for tar03_hidbekguar.dlg in tar_m03aa (Taris Lower City).
	
	This script fires at the end of a conversation with the guard outside the
	Hidden Bek Base. It reorients her, since she will turn to face the player
	when initiating a conversation.
	
	See also k_ptar_hblook_ud.
	
	Issue #498: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/498
	
	DP 2022-12-29																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oWP = GetObjectByTag("tar03_wpbekpost", 0);
	
	ActionDoCommand(SetFacing(GetFacing(oWP)));
	ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1);
}
