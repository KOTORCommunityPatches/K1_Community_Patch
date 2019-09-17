////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor36_kor39.utd in korr_m36aa (Korriban Valley of Dark Lords).

	This script is the OnFailToOpen for the door to the Tomb of Naga Sadow.
	By default this door can be opened, allowing the player to enter into
	the entryway of the Tomb module. Although there is a locked door inside
	that cannot be bypassed until the final sequence, it makes little sense
	to allow the player in at all. It seems more appropriate to lock the
	exterior Valley door, which requires a DLG to be triggered with the
	message regarding it not being able to be opened at this time.

	Issue #163: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/163

	DP 2019-08-03                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	
	ActionStartConversation(oPC);
}
