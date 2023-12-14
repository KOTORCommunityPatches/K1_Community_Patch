//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for k38a_init_wardrd.utt in korr_m38aa (Korriban Tomb of Marka Ragnos).

	This is the trigger OnEnter at the start of the Tomb of Marka Ragnos that
	fires a barkstring from the nearest War Droid if the controlled party member
	isn't wearing a stealth belt. Edited to add in the missing belts, as was done
	for the door OnOpen.
	
	See also k_pkor_open_door.
	
	Issue #280: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/280

	DP 2023-12-14																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	string sBelt = GetTag(GetItemInSlot(INVENTORY_SLOT_BELT, oPM0));
	string sBaragwin = "G1_I_BELT001";
	string sDampening = "G_I_BELT006";
	string sAdvanced = "G_I_BELT007";
	string sEriadu = "G_I_BELT008";
	string sGenerator = "G_I_BELT010";
	string sGeno = "Geno_stealth";
	object oDroid = GetNearestObjectByTag("kor38a_wardroid", OBJECT_SELF, 1);
	
	if (GetIsPC(GetEnteringObject()) && CP_HasNeverTriggered())
		{
			if (sBelt != sBaragwin && sBelt != sDampening && sBelt != sAdvanced && sBelt != sEriadu && sBelt != sGenerator && sBelt != sGeno)
				{
					if (GetGlobalNumber("KOR_WAR_DEAD") < 12)
						{
							AssignCommand(oDroid, ClearAllActions());
							AssignCommand(oPM0, ClearAllActions());
							
							if (d100(1) < Random(11))
								{
									BarkString(OBJECT_INVALID, 15832);
								}
								else if (d100(1) < Random(22))
									{
										BarkString(OBJECT_INVALID, 15833);
									}
									else
										{
											BarkString(OBJECT_INVALID, 15834);
										}
						}
				}
		}
}
