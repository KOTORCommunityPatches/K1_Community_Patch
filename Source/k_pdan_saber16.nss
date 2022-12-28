//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg in danm13 (Dantooine Jedi Enclave).
	
	Fired on the exit node of the branch where the player constructs their first
	lightsaber. Adds back any party members that were removed from the active
	party at the start of the scene.
	
	See also k_pdan_saber19.
	
	Issue #547: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/547
	
	DP 2022-12-28																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"
#include "k_inc_dan"

void main() {
	
	object oSaber = CreateFirstLightsaber();
	int nPM1 = GetGlobalNumber("K_PARTY_STORE1");
	int nPM2 = GetGlobalNumber("K_PARTY_STORE2");
	
	NoClicksFor(0.5);
	
	// Add NPCs back to the party if they were removed at the start of the scene. Modified after UT_RestoreParty().
	if (GetGlobalBoolean("K_PARTY_STORED"))
		{ 
			if (nPM1 >= 1 && nPM1 <= 8)
				{
					AddPartyMember(nPM1, GetObjectByTag(CP_NPCToTag(nPM1)));
				}
			
			if (nPM2 >= 1 && nPM2 <= 8)
				{
					AddPartyMember(nPM2, GetObjectByTag(CP_NPCToTag(nPM2)));
				}
		}
	
	SetGlobalNumber("K_PARTY_STORE1", -2);
	SetGlobalNumber("K_PARTY_STORE2", -2);
	SetGlobalBoolean("K_PARTY_STORED", FALSE);
	
	ShowUpgradeScreen(oSaber);
}
