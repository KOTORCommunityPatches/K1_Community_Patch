//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_bast400.dlg in lev_m40aa (Leviathan Prison Block).
	
	This script forces Bastila, Carth, and the PC to reorient towards Canderous
	when talking to him.
	
	Originally part of DP's "All Hands on Deck for the Leviathan Prison Break" mod:
	https://deadlystream.com/files/file/2097-all-hands-on-deck-for-the-leviathan-prison-break
	
	Issue #145: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/145
	
	DP 2023-08-17																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oCarth = GetObjectByTag("carth", 0);
	
	AssignCommand(oBast, SetFacing(DIRECTION_NORTH));
	AssignCommand(oPC, SetFacing(DIRECTION_NORTH));
	AssignCommand(oCarth, SetFacing(DIRECTION_NORTH));
	AssignCommand(oBast, ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 0.5));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
	AssignCommand(oCarth, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0));
}
