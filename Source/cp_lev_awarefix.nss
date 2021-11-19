//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_carth.dlg in ebo_m40ad (Ebon Hawk Post-Leviathan)
	
	This is an added script that fires on the first reply node of the post-
	Leviathan escape conversation on the Ebon Hawk. We have not been able to
	discover/replicate the conditions for this to occur, but it appears that
	in a limited number of cases that the rescuer in the jail break sequence
	is not being de-stealthed when interacting with the computer to release
	the rest of the party, as should normally be the case. They remain in
	stealth in the post-escape sequence and the conversation can become stuck
	because Carth and/or the PC can't detect the NPC in question when they
	have to speak a line. Mission typically seems to be the one it happens
	with. This script provides a temporary buff that should allow the NPC to
	be detected and the conversation to proceed, although the NPC will remain
	stealthed throughout the conversation. Since Odyssey is just a reworked
	version of Aurora, it has many leftovers from Neverwinter Nights. One of
	them is the function that grants the effect of the 6th level Divination
	spell True Seeing, which in D&D allows the user to see through all types
	of magical invisibility. Apparently that includes stealth generators. The
	stealthed NPC appears to disappear from the ship post-conversation, but
	will be available again normally in the party selection upon the next
	disembarkation. 
	
	Issue #9: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/9
	
	DP 2021-11-19																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oCarth = GetObjectByTag("Carth", 0);
	
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTrueSeeing(), oPC, 120.0);
	ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTrueSeeing(), oCarth, 120.0);
}
