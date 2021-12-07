//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_saul402.dlg in lev_m40ad (Leviathan Bridge).
	
	This script fires on the exit node of the second Saul cutscene on the Leviathan's
	bridge. The original script (k_ptar_carthjoin) also spawned three Sith Troopers
	out in the hallway and then commanded them to run to the bridge, but it seems
	that the delay was causing the move commands to fail to execute. Those have now
	instead been pushed out to an OUD event. The script itself was also changed to
	a custom one in order to avoid potential name clashes with Taris scripts.
	
	See also cp_lev40_talkr_d.
	
	Issue #131: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/131
	
	DP 2021-12-07																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	AddPartyMember(NPC_CARTH, GetObjectByTag("Carth", 0));
	AddPartyMember(NPC_BASTILA, GetObjectByTag("Bastila", 0));
	
	SignalEvent(OBJECT_SELF, EventUserDefined(100));
	
	SoundObjectPlay(GetObjectByTag("lev40_alarm", 0));
}
