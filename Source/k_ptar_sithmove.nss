//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar04_sithpatrol.dlg in tar_m04aa (Taris Undercity).
	
	This script fires on the first node of the scene with the Sith patrol in the
	Taris Undercity. The original walked the Troopers to the player, but despite
	the command to stay a few meters back, they all got right up in the PC's face.
	Since the party is now jumped into position by the trigger that fires the DLG,
	all three are instead directed to preset locations. The party members need to
	be given facing commands since the trigger can fire from a wide area, possibly
	resulting in the party members facing the wrong direction.
	
	See also k_ptar_sithptl0.
	
	Issue #499: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/499
	
	DP 2021/12/10																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oLeader = GetObjectByTag("tar04_sithcomm0", 0);
	object oTrooper1 = GetObjectByTag("tar04_sithtrooper0", 0);
	object oTrooper2 = GetObjectByTag("tar04_sithtrooper0", 1);
	location lLeader = Location(Vector(292.79,178.77,3.00), 155.93);
	location lTrooper1 = Location(Vector(294.43,175.46,3.00), 145.93);
	location lTrooper2 = Location(Vector(296.30,179.67,3.00), 165.93);
	
	ActionPauseConversation();
	
	NoClicksFor(3.0);
	
	ActionMoveToLocation(lLeader, FALSE);
	ActionDoCommand(SetFacing(155.93));
	
	CP_PartyMove(oTrooper1, lTrooper1);
	DelayCommand(1.0, CP_PartyMove(oTrooper2, lTrooper2));
	
	DelayCommand(2.0, AssignCommand(oTrooper1, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
	DelayCommand(3.0, AssignCommand(oTrooper2, ActionDoCommand(SetFacingPoint(GetPosition(oPC)))));
	
	AssignCommand(oPM1, ClearAllActions());
	AssignCommand(oPM2, ClearAllActions());
	
	DelayCommand(0.1, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(GetPosition(oLeader)))));
	DelayCommand(0.1, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(GetPosition(oLeader)))));
	
	AssignCommand(oPC, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
	DelayCommand(0.2, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	DelayCommand(0.2, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	
	ActionResumeConversation();
}
