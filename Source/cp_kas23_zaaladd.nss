//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_freyyr_01.dlg in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This added script fires after exiting the party selection GUI at the end of
	the Chieftain in Need quest and siding with Freyyr. If Zaalbar was added to
	the active party then he is jumped into the spot that the now destroyed
	stunt Zaalbar was standing in before doing a fade-in.
	
	See also k_pkas_givesword.
	
	Updated 2021-11-15 to prevent the party using Rapid Transit back to the
	Ebon Hawk after siding with Freyyr. Doing so results in the ending cutscenes
	triggering in the wrong order.
	
	See also k_pkas23aa_enter.
	
	Issue #460: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/460
	
	Issue #119: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/119
	
	DP 2021-01-12 / DP 2021-11-15												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oZaal = GetObjectByTag("Zaalbar", 0);
	location lZaal = Location(Vector(15.68,5.74,3.75), 101.25);
	
	// Prevent the party from using Rapid Transit so the Landing Pad cutscenes aren't screwed up.
	SetAreaUnescapable(TRUE);
	
	// If Zaalbar was added to the party, jump him into the spot stunt Zaalbar stood in
	// for the sake of visual consistency, rather than spawning him on top of the player.
	if (IsNPCPartyMember(NPC_ZAALBAR))
		{
			CP_PartyJump(oZaal, lZaal);
		}
	
	SetGlobalFadeIn(0.5, 2.0);
}
