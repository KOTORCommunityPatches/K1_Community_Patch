//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_darthmala2.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	Original script edit from KOTOR Bug Fix Attempt by danil-ch. Prevents sabers
	from being powered down after the resumption of the Malak conversation post-
	revelation cutscene.
	
	Updated 2021/11/26 to add in provision for the PC and clean up the unused
	object declarations.
	
	See also k_plev_postvis, k_plev_malstun, k_plev_pause.
	
	2019-03-18 / DP 2021/11/26													*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

void main() {
	
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("bastila", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oWP_Bast = GetObjectByTag("lev40_wpconfb", 0);
	object oWP_Carth = GetObjectByTag("lev40_wpconfc", 0);
	object oMalak = GetObjectByTag("DarthMalak400", 0);
	
	AddPartyMember(NPC_BASTILA, oBastila);
	AddPartyMember(NPC_CARTH, oCarth);
	
	UT_TeleportPartyMember(oCarth, GetLocation(oWP_Carth));
	UT_TeleportPartyMember(oBastila, GetLocation(oWP_Bast));
	
	SetLightsaberPowered(oBastila, TRUE, TRUE, FALSE);
	SetLockOrientationInDialog(oBastila, FALSE);
	
	SetLightsaberPowered(oMalak, TRUE, TRUE, FALSE);
	
	SetLightsaberPowered(oPC, TRUE, TRUE, FALSE);
}
