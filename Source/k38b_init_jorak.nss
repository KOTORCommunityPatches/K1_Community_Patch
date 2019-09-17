////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by k38b_init_jorak.utt in korr_m38ab (Korriban Tomb of Tulak Hord).
	
	This script fires when the party hits the trigger in Jorak Uln's trapped
	corridor. In order to make a nicer intro of the party actually walking
	in and getting gassed inside the corridor (rather than in the doorway),
	this script now just jumps the party into a starting position hidden by
	a fade out and initiates the DLG for the cutscene.
	
	See also cp_k38_jorakbow, cp_k38_slander, k_pkor_animstun, k_pkor_forceslep,
	k_pkor_gaschoke, k_pkor_gasfall, k_pkor_jorakmove, k_pkor_jorstunmu,
	k38b_init_jorak1, k38b_jor_gastrap, k38b_jor_givetab, k38b_jor_hostile,
	k38b_jor_riddlen, and k38b_jor_riddley.
	
	Issue #165: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/165
	
	DP 2019-07-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

int GetFlag() {
	return UT_GetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01);
}

void main() {
	
	object oPM0 = CP_GetPartyMember(0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oJorak = GetObjectByTag("kor38b_jorakuln", 0);
	location lPCStart = Location(Vector(101.0,75.0,0.75), 0.0);
	location lPM1Start = Location(Vector(97.0,73.5,0.75), 0.0);
	location lPM2Start = Location(Vector(97.0,76.5,0.75), 0.0);
	
	if (GetIsPC(GetEnteringObject()) && !GetFlag())
		{
			NoClicksFor(2.0);
			
			SetGlobalFadeOut();
			
			UT_SetPlotBooleanFlag(OBJECT_SELF, SW_PLOT_BOOLEAN_01, TRUE);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPCStart, lPM1Start, lPM2Start, TRUE, FALSE);
			
			DelayCommand(0.5, AssignCommand(oJorak, ActionStartConversation(oPM0, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
