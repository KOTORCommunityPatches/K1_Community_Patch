////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor33_murderer.dlg in korr_m33aa (Dreshdae).
	
	Original script edit from The Comprehensive KOTOR Bug Fix Collection by blennus.
	
	This script is an addition to the cutscene that plays when entering Dreshdae.
	It stops some sound effects playing just prior to the PC entering the
	conversation.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main() {
	SoundObjectStop(GetObjectByTag("k33a_snd_vicscrm", 0));
	SoundObjectStop(GetObjectByTag("k33a_snd_drnvic", 0));
}
