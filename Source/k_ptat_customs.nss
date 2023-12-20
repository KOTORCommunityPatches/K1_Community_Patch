//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat17_customs.utt in tat_m17ab (Tatooine Docking Bay).
	
	This is the trigger OnEnter that fires the first time you leave the Ebon Hawk
	when arriving on Tatooine, playing the scene where the Czerka customs officer
	accosts you about the landing fee. The party was in its usual disarray on
	entering a module, and are all crowded in close to the Hawk. This version
	jumps them out a bit further in conjunction with an alteration to the script
	that walks the custom officer towards the party so he stops a bit shorter.
	
	Updated 2023-12-20 to toggle party member AI for the jump to ensure that they
	obey.
	
	See also cp_tat_custmove2, k_ptat_custmove, k_ptat_customwlk.
	
	Issue #308: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/308
	
	DP 2019-11-05 / DP 2023-12-20												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oCustOff = GetObjectByTag("tat17_01cust_01", 0);
	location lPC = Location(Vector(-4.8,-14.5,0.0), 270.0);
	location lPM1 = Location(Vector(-6.3,-12.5,0.0), 270.0);
	location lPM2 = Location(Vector(-3.3,-12.5,0.0), 270.0);
	
	if (GetIsPC(oEntering) && !UT_GetPlotBooleanFlag(oCustOff, SW_PLOT_BOOLEAN_01))
		{
			HoldWorldFadeInForDialog();
			
			NoClicksFor(1.0);
			
			CP_ToggleAI(oPM1);
			CP_ToggleAI(oPM2);
			DelayCommand(0.1, CP_PartyHerder(lPC, lPM1, lPM2));
			
			DelayCommand(0.5, AssignCommand(oCustOff, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
	
}
