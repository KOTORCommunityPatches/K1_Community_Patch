////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_davik081.dlg in tar_m08aa (Taris Davik's Estate).

	This script is fired during the initial conversation with Davik when first
	entering his estate. It fires after visiting the Ebon Hawk in the hangar
	to jump everyone to the final room for the end of the conversation. This
	is the usual attempt to pretty up the scene, wrangling the party into a
	decent lineup and addressing facing issues. Although this is actually one
	of the few conversations in the entire game where the vanilla scripts have
	preset waypoints for positioning all three party members. Although it is
	only used for the second and third scenes in this conversation, and during
	the	second the party is entirely off-screen.

	DP 2019-05-07                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oCalo = GetObjectByTag("calo081", 0);
	object oDavik = GetObjectByTag("Davik081", 0);
	object oDavikWP = GetObjectByTag("tar08_wpdavtour2", 0);
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oCand = GetObjectByTag("Cand", 0);
	location lPCStart = Location(Vector(80.902,111.067,0.0), 0.0);
	location lPCEnd = Location(Vector(80.902,110.074,0.0), 0.0);
	location lPM1Start = Location(Vector(77.497,112.415,0.0), 0.0);
	location lPM1End = Location(Vector(79.083,111.553,0.0), 0.0);
	location lCandStart = Location(Vector(83.656,113.538,0.0), 0.0);
	location lCandEnd = Location(Vector(82.885,111.553,0.0), 0.0);
	location lCaloStart = Location(Vector(78.951,106.223,0.0), 0.0);
	location lCaloEnd = Location(Vector(79.65,107.35,0.0), 0.0);
	
	UT_SetPlotBooleanFlag(OBJECT_SELF, 1, TRUE);
	
	ActionPauseConversation();
	
	SetGlobalFadeOut(0.0, 0.75);
	
	DelayCommand(0.5, CP_PartyJump(oCalo, lCaloStart));
	DelayCommand(1.0, AssignCommand(oCalo, ActionMoveToLocation(lCaloEnd, FALSE)));
	
	DelayCommand(0.8, CP_PartyJump(oPC, lPCStart));
	DelayCommand(1.0, AssignCommand(oPC, ActionMoveToLocation(lPCEnd, FALSE)));
	
	DelayCommand(0.8, CP_PartyJump(oCand, lCandStart));
	DelayCommand(1.0, AssignCommand(oCand, ActionMoveToLocation(lCandEnd, FALSE)));
	DelayCommand(2.55, AssignCommand(oCand, SetFacingPoint(GetPosition(oDavik))));
	
	if ((oPM1 != oCand))
		{
			DelayCommand(0.8, CP_PartyJump(oPM1, lPM1Start));
			DelayCommand(1.0, AssignCommand(oPM1, ActionMoveToLocation(lPM1End, FALSE)));
			DelayCommand(2.4, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(2.4, AssignCommand(oPM1, ActionDoCommand(SetCommandable(TRUE, oPM1))));
			DelayCommand(2.55, AssignCommand(oPM1, SetFacingPoint(GetPosition(oDavik))));
		}
	
	if ((GetIsObjectValid(oPM2) && (oPM2 != oCand)))
		{
			DelayCommand(0.8, CP_PartyJump(oPM2, lPM1Start));
			DelayCommand(1.0, AssignCommand(oPM2, ActionMoveToLocation(lPM1End, FALSE)));
			DelayCommand(2.4, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(2.4, AssignCommand(oPM2, ActionDoCommand(SetCommandable(TRUE, oPM2))));
			DelayCommand(2.55, AssignCommand(oPM2, SetFacingPoint(GetPosition(oDavik))));
		}
	
	ActionWait(2.5);
	
	ActionJumpToObject(oDavikWP, FALSE);
	
	ActionResumeConversation();
}