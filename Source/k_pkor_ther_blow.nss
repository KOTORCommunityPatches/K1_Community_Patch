////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kor37_firescene.dlg in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This script fires on the first node of the scene where the Therangen Obelisk
	blocking the bridge in the Tomb of Ajunta Pall is blown up. In the vanilla
	script, all party members are commanded to run to a single waypoint, which
	causes pathfinding issues as they bump into other. This has been changed to
	only run party member 0 (usually the player) to the waypoint (actually just
	a bit past it), and the other two party members back further to two separate
	locations at the start of the bridge. The party members are also jumped into
	fixed starting points at the beginning of the scene, assuming solo mode isn't
	on, to improve the aesthetics of the scene.
	
	See also k_pkor_therangen and k_pkor_droidhost.
	
	Issue #164: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/164
	
	DP 2019-07-12                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void AIToggle(int nIndex, int nState) {
	SetLocalBoolean(OBJECT_SELF, nIndex, nState);
}

void main() {
	
	object oArea = GetArea(OBJECT_SELF);
	object oTherObel = GetObjectByTag("kor37_therangen", 0);
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	location lPM0 = Location(Vector(72.5,24.0,3.807), 0.0);
	location lPM1A = Location(Vector(81.5,23.0,3.807), 0.0);
	location lPM2A = Location(Vector(81.5,25.0,3.807), 0.0);
	location lPM1B = Location(Vector(70.75,23.0,3.807), 0.0);
	location lPM2B = Location(Vector(70.75,25.0,3.807), 0.0);
	
	MusicBackgroundStop(oArea);
	DelayCommand(0.1, MusicBattlePlay(oArea));
	
	SetPlotFlag(oTherObel, FALSE);
	
	ActionPauseConversation();
	
	DelayCommand(1.5, AssignCommand(oPM0, ActionMoveToLocation(lPM0, TRUE)));
	DelayCommand(3.5, AssignCommand(oPM0, SetFacing(DIRECTION_EAST)));
	
	if (((!GetSoloMode()) && GetIsObjectValid(oPM1)))
		{
			AssignCommand(oPM1, ClearAllActions());
			DelayCommand(0.1, AssignCommand(oPM1,ActionJumpToLocation(lPM1A)));
			DelayCommand(0.15, AssignCommand(oPM1, AIToggle(SW_FLAG_AI_OFF, TRUE)));
			DelayCommand(0.15, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(0.5, AssignCommand(oPM1, ActionMoveToLocation(lPM1B, TRUE)));
			DelayCommand(3.3, AssignCommand(oPM1, ClearAllActions()));
			DelayCommand(3.5, AssignCommand(oPM1, SetFacingPoint(GetPosition(oPM0))));
		}
	
	if (((!GetSoloMode()) && GetIsObjectValid(oPM2)))
		{
			AssignCommand(oPM2, ClearAllActions());
			DelayCommand(0.1, AssignCommand(oPM2,ActionJumpToLocation(lPM2A)));
			DelayCommand(0.15, AssignCommand(oPM2, AIToggle(SW_FLAG_AI_OFF, TRUE)));
			DelayCommand(0.15, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(0.5, AssignCommand(oPM2, ActionMoveToLocation(lPM2B, TRUE)));
			DelayCommand(3.3, AssignCommand(oPM2, ClearAllActions()));
			DelayCommand(3.5, AssignCommand(oPM2, SetFacingPoint(GetPosition(oPM0))));
		}
	
	DelayCommand(3.5, ActionResumeConversation());
}
