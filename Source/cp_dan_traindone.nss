////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by cp_dan_traindone.utt in danm13 (Dantooine Jedi Enclave).

	Fired when the player goes to speak to the Council after completing their
	training.
	
	JC 2019-04-28
	
////////////////////////////////////////////////////////////////////////////////
	
	Replaced JC's original script, merging in the contents of the one previously
	added to dan13_vandar.dlg, with the new CP include function equivalents.
	
	Updated 2019-07-30 to adjust the party end locations to more closely match
	the vanilla positioning for improved static camera framing consistency. 
	
	See also cp_dan_vandgrove.
	
	Issue #151: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/151
	
	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
    
	object oEntering = GetEnteringObject();
	location lPCStart = Location(Vector(95.209,42.27,4.445), 0.0);
	location lPM1Start = Location(Vector(93.0,43.0,4.55), 0.0);
	location lPM2Start = Location(Vector(94.5,44.5,4.55), 0.0);
	location lPC = Location(Vector(103.911,33.321,4.12), 0.0);
	location lPM1 = Location(Vector(101.8,33.55,4.08), 0.0);
	location lPM2 = Location(Vector(103.85,35.35,4.085), 0.0);
	
	if(GetIsPC(oEntering) && GetGlobalNumber("DAN_JEDI_PLOT") == 7)
		{
			SetGlobalFadeOut();
			
			// Since the trigger location puts the starting point of the party very
			// close to the Council, jump them back a bit to allow time for an approach
			CP_PartyHerder(lPCStart, lPM1Start, lPM2Start, TRUE, FALSE);
			
			CP_DLGSetup("dan13_vandar");
			CP_DLGHerder(lPC, lPM1, lPM2, FALSE, TRUE);
			CP_DLGInit("dan13_vandar", "", FALSE, 1.0, 1.5);
			
			DelayCommand(7.0, DestroyObject(OBJECT_SELF, 0.0, FALSE, 0.0));
		}
}
