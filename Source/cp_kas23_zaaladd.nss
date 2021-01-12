//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas23_freyyr_01.dlg in kas_m23ad (Kashyyyk Chieftain's Hall).
	
	This added script fires after exiting the party selection GUI at the end of
	the Chieftain in Need quest and siding with Freyyr. If Zaalbar was added to
	the active party then he is jumped into the spot that the now destroyed
	stunt Zaalbar was standing in before doing a fade-in.
	
	See also k_pkas_givesword.
	
	Issue #460: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/460
	
	DP 2021-01-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oZaal = GetObjectByTag("Zaalbar", 0);
	location lZaal = Location(Vector(15.68,5.74,3.75), 101.25);
	
	// If Zaalbar was added to the party, jump him into the spot stunt Zaalbar stood in
	// for the sake of visual consistency, rather than spawning him on top of the player.
	if (IsNPCPartyMember(NPC_ZAALBAR))
		{
			CP_PartyJump(oZaal, lZaal);
		}
	
	SetGlobalFadeIn(0.5, 2.0);
}
