////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_13craw2_01.dlg in tat_m18a (Tatooine Dune Sea).
	
	This is an added script that fires at the end of the miner captain's
	dialogue tree to be checked against by the new OnEnter in order to
	remove the mining crew once they have both been talked to and the
	Sandpeople situation has been resolved.
	
	Issue #115: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/115
	
	DP 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	SetLocalBoolean(OBJECT_SELF, 53, TRUE);
}
