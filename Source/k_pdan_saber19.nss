//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg in danm13 (Dantooine Jedi Enclave).
	
	Fired on the first node of the branch where the player constructs their first
	lightsaber. Removes any party members from the active party and jumps them out
	of the way, since typically they will get in the way of the player trying to
	walk to the workbench.
	
	See also k_pdan_saber16.
	
	Issue #547: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/547
	
	DP 2022-12-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	int nID, bFound1, bFound2, bRemove;
	location lPM1 = Location(Vector(80.85,47.68,5.00), 236.84);
	location lPM2 = Location(Vector(79.52,48.49,5.00), 236.84);
	
	NoClicksFor(7.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	// In order to prevent them trying to follow the player, remove any active party members for the
	// duration of the scene, ignoring Bastila since she's unavailable. Modified after UT_StoreParty().
	SetGlobalNumber("K_PARTY_STORE1", -2);
	SetGlobalNumber("K_PARTY_STORE2", -2);
	SetGlobalBoolean("K_PARTY_STORED", FALSE);
	
	for (nID = 1; nID <= 8 && !bFound2; nID++)
		{
			bRemove = IsNPCPartyMember(nID);
			
			if (bRemove)
				{
					if (bFound1 == FALSE)
						{
							RemovePartyMember(nID);
							SetGlobalNumber("K_PARTY_STORE1", nID);
							
							bFound1 = TRUE;
							SetGlobalBoolean("K_PARTY_STORED",TRUE);
						}
						else
							{
								RemovePartyMember(nID);
								SetGlobalNumber("K_PARTY_STORE2", nID);
								
								bFound2 = TRUE;
								SetGlobalBoolean("K_PARTY_STORED", TRUE);
							}
				}
			
			bRemove = FALSE;
		}
	
	AssignCommand(oPC, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oPC), TRUE));
	AssignCommand(oPC, ActionUnequipItem(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oPC), TRUE));
	
	// Jump the party members out of the way of the route from Zhar to the workbench, since the player
	// can have issues trying to path around them otherwise.
	DelayCommand(1.0, CP_PartyJump(oPM1, lPM1));
	DelayCommand(1.5, AssignCommand(oPM1, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
	
	DelayCommand(1.0, CP_PartyJump(oPM2, lPM2));
	DelayCommand(1.5, AssignCommand(oPM2, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
}
