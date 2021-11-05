//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk44_evilbast.dlg in unk_m44ac (Lehon Temple Summit).
	
	This is a custom facing script that forces Jolee and Juhani to face Bastila
	during the opening nodes of the two conversations, since otherwise they tend
	to weirdly stare off straight ahead into space. A heal was also added since
	the vanilla one still leaves them injured if they died in the first fight.
	
	See also cp_unk44_pcfcbas, exitheart, k_punk_bast_ud2, k_punk_bastatt03,
	k_punk_bastatt05, k_punk_bastesc, k_punk_bastjoin2.
	
	Issue #484: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/484
	
	DP 2021-11-05																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oBastila = GetObjectByTag("Bastilae", 0);
	object oJolee = GetObjectByTag("jolee", 0);
	object oJuhani = GetObjectByTag("juhani", 0);
	
	// Add a heal primarily for Jolee and Juhani for the second conversation to make sure that they
	// aren't doing the injured animation. Also makes sure they aren't gimped for the DS route fight.
	UT_HealParty();
	
	AssignCommand(oJolee, SetFacingPoint(GetPosition(oBastila)));
	AssignCommand(oJolee, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
	
	AssignCommand(oJuhani, SetFacingPoint(GetPosition(oBastila)));
	AssignCommand(oJuhani, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
}
