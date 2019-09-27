////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_duelorg021.dlg in tar_m02ae (Taris Upper City Cantina).
	
	This script jumps the party into place when talking to Ajuur to prevent
	scattering and party facing issues.
	
	Loosely based on the jump script from DP's "Taris Dueling Arena Adjustment"
	mod, but completely refactored using K1CP's Include functions.
	
	Issue #88: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/88
	
	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oHutt = GetObjectByTag("DuelOrgan021", 0);
	location lPC = Location(Vector(110.0,78.75,0.0), 270.0);
	location lPM1 = Location(Vector(111.5,80.5,0.0), 270.0);
	location lPM2 = Location(Vector(108.5,80.5,0.0), 270.0);
	
	CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
	
	DelayCommand(0.2, AssignCommand(oPC, SetCommandable(TRUE, OBJECT_SELF)));
	DelayCommand(0.3, AssignCommand(oPC, ClearAllActions()));
	DelayCommand(0.5, AssignCommand(oPC, SetFacingPoint(GetPosition(oHutt))));
	
	DelayCommand(0.2, AssignCommand(oPM1, SetCommandable(TRUE, OBJECT_SELF)));
	DelayCommand(0.3, AssignCommand(oPM1, ClearAllActions()));
	DelayCommand(0.5, AssignCommand(oPM1, SetFacingPoint(GetPosition(oHutt))));
	
	DelayCommand(0.2, AssignCommand(oPM2, SetCommandable(TRUE, OBJECT_SELF)));
	DelayCommand(0.3, AssignCommand(oPM2, ClearAllActions()));
	DelayCommand(0.5, AssignCommand(oPM2, SetFacingPoint(GetPosition(oHutt))));
}
