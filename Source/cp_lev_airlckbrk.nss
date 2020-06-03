//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_airlockin.utd in lev_m40ad (Leviathan Bridge).
	
	This is an added OnFailToOpen for the inner airlock doors at either end of the
	outer hull walkway. Since trying to go back through that route after defeating
	Admiral Karath can cause the player to be permanently stuck in the space suit,
	it is now permanently locked after passing through the first time. Technically
	only the forward door needs to be locked, but the same template is used for
	both, so each get the script.
	
	See also cp_lev_airlckcls.ncs.
	
	Issue #338: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/338
	
	DP 2020-06-03																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	// "This airlock is sealed from the other side."
	BarkString(OBJECT_SELF, 20505);
}
