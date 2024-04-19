//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by man28_airlock.dlg in manm28aa (Manaan Hrakert Station).
	
	Fires when the player exits to the underwater Sea Floor module, changing their
	appearance to the environment suit. Modified to remove Force Speed if present,
	since that would remain applied otherwise.
	
	See also k_pman_airlock02, k_pman_airlock03.
	
	Issue #775: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/775
	
	DP 2024-04-19																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_man"

void main() {
	
	int nIndex, nIdx;
	object oPC = GetFirstPC();
	object oPty;
	
	while (nIndex < 3)
		{
			oPty = GetPartyMemberByIndex(nIndex);
			
			if (oPC != oPty)
				{
					nIdx = UT_GetNPCCode(oPty);
					
					if (nIdx != NPC_PLAYER)
						{
							SaveNPCState(nIdx);
						}
				}
			
			nIndex++;
		}
	
	UT_StoreParty();
	
	CP_RemoveForceSpeed(oPC);
	
	DonSuits();
	
	if (GetTag(OBJECT_SELF) == "28d")
		{
			StartNewModule("manm28ad", "from" + GetTag(OBJECT_SELF));
		}
		else
			{
				StartNewModule("manm28ab", "from" + GetTag(OBJECT_SELF));
			}
}
