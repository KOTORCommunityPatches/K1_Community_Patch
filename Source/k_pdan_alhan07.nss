////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_ahlan.dlg on Entry 1 in danm13 (Jedi Enclave).
	
	This is the second part of an adjustment to Ahlan Matale's positioning
	during his post-Juhani Council debrief interjection. He was ending up
	floating in mid-air over the edge of the central circle in the Council
	chambers, so he was spawned in further back and made to walk towards his
	original position, but not so close to the edge. This element handles
	the walk and second location. The initial spawn in is handled by his
	OnUserDefine script (k_pdan_alhan_d).
	
	DP 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {
	
	location lAhlan = Location(Vector(95.209,42.27,4.445), 0.0);
	
	SetCommandable(1, GetPCSpeaker());
	ActionMoveToLocation(lAhlan);
}