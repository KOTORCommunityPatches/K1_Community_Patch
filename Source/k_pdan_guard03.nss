//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan15_ancientdrd.dlg in danm15 (Dantooine Ruins).
	
	This script fires on one of the early nodes of the DLG the first time the
	party enters the ruins and triggers the conversation with the overseer droid.
	The positioning has been altered slightly from the vanilla waypoints, and the
	contents of k_pdan_bast01 has been directly incorporated. Bastila has also had
	her orientation locked to prevent some undesirable facing that was occurring.
	
	Updated 2019-10-27 to remove the player's orientation locking and tweak the
	facing angles to minimise some undesirable camera angles.
	
	See also k_pdan_guard04.
	
	Issue #105: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/105
	
	Issue #152: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/152
	
	DP 2019-07-31																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_generic"

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM2 = CP_GetPartyMember(2);
	location lPC = Location(Vector(145.781,132.0,4.417), 45.0);
	location lBast = Location(Vector(148.181,132.0,4.417), 135.0);
	location lPM2 = Location(Vector(146.981,129.0,4.417), 90.0);
	
	CP_PartyMove(oPC, lPC, FALSE);
	DelayCommand(0.5, AssignCommand(oPC, ActionDoCommand(SetFacing(45.0))));
	
	SetLocalBoolean(oBast, SW_FLAG_AI_OFF, TRUE);
	
	CP_PartyMove(oBast, lBast, FALSE);
	DelayCommand(0.5, AssignCommand(oBast, ActionDoCommand(SetFacing(135.0))));
	DelayCommand(1.5, SetLockOrientationInDialog(oBast, TRUE));
	
	// Since Bastila will always be returned as PM1 by the CP_GetPartyMember Include function due
	// to the alphabetical order of the NPC IDs, we can simply call PM2 with no further checks.
	DelayCommand(1.5, CP_PartyMove(oPM2, lPM2, FALSE));
	DelayCommand(2.0, AssignCommand(oPM2, ActionDoCommand(SetFacing(90.0))));
}
