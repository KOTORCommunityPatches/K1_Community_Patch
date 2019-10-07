//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_messenger.dlg in tar_m02aa (Taris Upper City South Apartments).
	
	This script is fired on the first node of the DLG for the scene where the party
	is approached by a messenger from Canderous. It commands the messenger to run to
	the player. It has been tweaked to run him to a	set location now, in conjunction
	with herding the party before initiating the conversation. The static camera used
	for this node was also tweaked, raised up and angled down slightly to get a better
	view of everyone in their revised positions.
	
	See also k_ptar_rodiantrg.
	
	Issue #247: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/247
	
	DP 2019-10-07																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"

void main() {
	
	location lEnd = Location(Vector(97.263,133.424,0.0), -165.0);
	
	TAR_MarkForCleanup(OBJECT_SELF);
	
	ActionPauseConversation();
	
	ActionMoveToLocation(lEnd, TRUE);
	
	ActionResumeConversation();
}
