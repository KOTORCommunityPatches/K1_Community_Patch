////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by ebo_bast_vision.dlg on Reply 35 in ebo_m12aa (Ebon Hawk).
	
	This an edit of the script that fires at the end of the post-Taris escape
	conversation with Bastila and Carth. It removes playing the Dantooine
	arrival movie as part of reshuffling the order of this sequence. The movie
	is now played before the conversation, since it is heavily implied that
	the conversation is taking place after having already landed on Dantooine.
	
	DP 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////

// Prototypes
void sub1();

void sub1() {
	SetGlobalNumber("K_CURRENT_PLANET", 15);
	StartNewModule("danm13", "", "", "", "", "", "", "");
}

void main() {
	SetGlobalBoolean("k_vis_Dantooine", 1);
	sub1();
}