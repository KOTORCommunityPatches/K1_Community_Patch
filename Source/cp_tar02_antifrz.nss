//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_zelka021.dlg in tar_m02ac (Taris Upper City South).
	
	This is an amendment to a previous adjustment of Zelka Forn's dialogue in the
	Taris medical clinic that replaces in-DLG animations to prevent Bastila and
	Carth freezing after their interjections. Specifying the anims in the DLG
	itself causes that line to briefly pause before starting if one or both are
	absent from the party, so it has been pushed out to a script instead.
	
	Fired on Entries 86 and 92.
	
	Issue #78: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/78
	
	DP 2021-07-29																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	
	if (GetIsObjectValid(oPM1))
		{
			if (GetTag(oPM1) == "Bastila" || GetTag(oPM1) == "Carth")
				{
					AssignCommand(oPM1, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
				}
		}
		
	if (GetIsObjectValid(oPM2))
		{
			if (GetTag(oPM2) == "Bastila" || GetTag(oPM2) == "Carth")
				{
					AssignCommand(oPM2, PlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 1.0));
				}
		}
}
