//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by missdoor_dlg.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script is fired on the first node of a slightly rejigged DLG for the scene
	of Mission springing Zaalbar from a makeshift Gamorrean jail. It walks her to
	the locked door, followed by the player and second party member.
	
	Updated 2021-12-06 to tweak the party facings.
	
	See also k_ptar_addzaal, k_ptar_destzaal, k_ptar_misunlock, k_ptar_trigdoor,
	k_ptar_zaalrun.
	
	Issue #65: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/65
	
	DP 2020-06-08 / DP 2021-12-06												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oMission = GetObjectByTag("mission", 0);
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oTalker = GetObjectByTag("tar05_celltalker", 0);
	location lMissEnd = Location(Vector(236.516,190.2,29.88), 180.0);
	location lPCEnd = Location(Vector(239.00,192.00,29.70), 208.0);
	location lPM2End = Location(Vector(239.00,188.40,29.48), 153.0);
	
	SetLocalBoolean(oTalker, SW_PLOT_HAS_TALKED_TO, TRUE);
	
	NoClicksFor(10.0);

	// Since the player is the DLG owner, Mission insists on turning to face them, so point her back
	// towards the door under the fade-out and play an animation to force the facing to take effect.
	DelayCommand(0.2, AssignCommand(oMission, SetFacing(153.0)));
	DelayCommand(0.3, AssignCommand(oMission, PlayAnimation(ANIMATION_LOOPING_TALK_NORMAL, 1.0, 1.0)));
	
	DelayCommand(4.0, CP_PartyMove(oMission, lMissEnd, FALSE));
	DelayCommand(6.0, CP_PartyMove(oPC, lPCEnd, FALSE));
	
	// Have the player turn to face Mission in their new position and play an animation to force the facing to take effect.
	DelayCommand(7.0, AssignCommand(oPC, ActionDoCommand(SetFacing(208.0))));
	DelayCommand(7.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
	
	// Establish which slot the remaining party member (presumably Carth) is in, give them an initial facing adjustment
	// just like Mission, then walk them to their destination position.
	if (GetIsObjectValid(oPM1) && oPM1 != oMission)
		{
			AssignCommand(oPM1, SetFacing(153.0));
			DelayCommand(0.1, AssignCommand(oPM1, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
			
			DelayCommand(8.0, CP_PartyMove(oPM1, lPM2End, FALSE));
			DelayCommand(9.0, AssignCommand(oPM1, ActionDoCommand(SetFacing(153.0))));
			DelayCommand(9.1, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
		}
	
	if (GetIsObjectValid(oPM2) && oPM2 != oMission)
		{
			AssignCommand(oPM2, SetFacing(153.0));
			DelayCommand(0.1, AssignCommand(oPM2, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
			
			DelayCommand(8.0, CP_PartyMove(oPM2, lPM2End, FALSE));
			DelayCommand(9.0, AssignCommand(oPM2, ActionDoCommand(SetFacing(153.0))));
			DelayCommand(9.1, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0)));
		}
}
