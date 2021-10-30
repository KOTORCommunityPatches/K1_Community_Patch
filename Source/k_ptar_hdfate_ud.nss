//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OUD for tar04_hendarfate.utc in tar_m04aa (Taris Undercity).
	
	This is the UserDefine script for the Rakghoul that attacks Hendar outside
	the gate of the Undercity village. Since Mission's vanilla spawn trigger
	has been replaced with two separate triggers, this script needs to be edited,
	as they need to be flagged with a local boolean after the Hendar scene is
	resolved. It now also destroys the vanilla trigger, since that no longer has
	a use.
	
	See also cp_tar04_miskill, k_ptar_addmissio, k_ptar_desmis, k_ptar_miscrt_en,
	k_ptar_misrun, k_ptar_rakrun.
	
	Issue #472: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/472
	
	DP 2021-10-30																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_tar"
#include "k_inc_generic"

void Holster_Weapon(object oObject) {
	ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, OBJECT_SELF), FALSE);
	TAR_PlotMoveObject(oObject, TRUE);
}

void main() {
    
	int nUser = GetUserDefinedEventNumber();

	if (nUser == 1001) // HEARTBEAT
		{

		}
    else if (nUser == 1002) // PERCEIVE
		{

		}
    else if (nUser == 1003) // END OF COMBAT
		{

		}
    else if (nUser == 1004) // ON DIALOGUE
		{

		}
    else if (nUser == 1005) // ATTACKED
		{

		}
    else if (nUser == 1006) // DAMAGED
		{

		}
    else if (nUser == 1007) // DEATH
		{
			object oHendar = GetObjectByTag("OutcastMan046", 0);
			object oHester = GetObjectByTag("OutcastWoman043", 0);
			object oGate = GetObjectByTag("tar04_maingate", 0);
			object oNPC;
			int nCount;
			
			GivePlotXP("tar_misc", 10);
			SetLocked(oGate, FALSE);
			ChangeToStandardFaction(oHendar, STANDARD_FACTION_NEUTRAL);
			
			// Flag Mission's spawn trigger so it fires her cutscene. Now replaced with two separate triggers to
			// account for party moving left or right from the gate for jumped scene. Destroy the vanilla trigger.
			DestroyObject(GetObjectByTag("tar04_miscrt", 0));
			UT_SetPlotBooleanFlag(GetObjectByTag("cp_tar04_missspl", 0), SW_PLOT_BOOLEAN_01, TRUE);
			UT_SetPlotBooleanFlag(GetObjectByTag("cp_tar04_missspr", 0), SW_PLOT_BOOLEAN_01, TRUE);
			
			if (GetGlobalNumber("TAR_HENDAR") != 2)
				{
					SetGlobalNumber("TAR_HENDAR", 98);
					AssignCommand(oHendar, Holster_Weapon(oHester));
				}
			
			nCount = 0;
			while (nCount < GetPartyMemberCount())
				{
					oNPC = GetPartyMemberByIndex(nCount);
					AssignCommand(oNPC, ClearAllActions());
					CancelCombat(oNPC);
					nCount++;
				}
		}
    else if (nUser == 1008) // DISTURBED
		{

		}
    else if (nUser == 1009) // BLOCKED
		{

		}
    else if (nUser == 1010) // SPELL CAST AT
		{

		}
    else if (nUser == 1011) // DIALOGUE END
		{
		
		}
    else if (nUser == 2000) // PLAYER REFUSES TO HELP HENDAR
		{
			object oHendar = GetObjectByTag("OutcastMan046", 0);
			object oSelf = OBJECT_SELF;
			
			SetPlotFlag(OBJECT_SELF, FALSE);
			ChangeToStandardFaction(oHendar, STANDARD_FACTION_FRIENDLY_1);
			ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_FRIENDLY_2);
			ActionWait(1.0);
			ActionAttack(oHendar);
		}
    else if (nUser == 3000) // PLAYER AGREES TO HELP HENDAR
		{
			object oHendar = GetObjectByTag("OutcastMan046", 0);
			object oSelf = OBJECT_SELF;
			
			SetPlotFlag(OBJECT_SELF, FALSE);
			ChangeToStandardFaction(oHendar, STANDARD_FACTION_FRIENDLY_1);
			ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
			GN_DetermineCombatRound(oHendar);
		}
    else if (nUser == HOSTILE_RETREAT)
		{
			UT_ReturnToBase();
		}
}
