//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_zal.dlg in ebo_m12aa (Ebon Hawk).
	
	This script fires on the exit node of the scene where Zaalbar informs the
	player about someone tampering with the Ebon Hawk's food supplies. The
	vanilla script (k_pebo_zalmove) was used on this node and the exit node
	of the branch when Zaalbar tells the player Sasha has left the ship (before
	the quest was resolved). As such, it removed the ebo_supplies journal entry
	which inadvertently affected the former node, which adds the first entry
	of that quest. This has now been switched to a separate script that omits
	the journal entry removal command.
	
	Issue #633: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/633
	
	DP 2022-06-22																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	ActionForceMoveToObject(GetObjectByTag("pebn_zaalbar", 0), FALSE, 1.0, 6.0);
}
