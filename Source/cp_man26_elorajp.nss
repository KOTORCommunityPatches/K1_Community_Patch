////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by man26_elora.dlg in manm26aa (Manaan Ahto West).
	
	This added script fires on most of the first nodes of each branch of Elora's
	DLG, jumping the party into position to help alleviate facing issues.
	
	See also k_pman_init02.
	
	Issue #135: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/135
	
	DP 2023-11-16																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oElora = GetObjectByTag("man26_elora");
	location lPC = Location(Vector(12.68,14.50,59.16), 50.00);
	location lJolee = Location(Vector(12.17,15.91,59.16), -10.00);
	location lPM2 = Location(Vector(11.30,14.80,59.16), 20.00);
	
	SetGlobalFadeOut();
	DelayCommand(0.5, SetGlobalFadeIn(0.5, 0.5));
	
	if (IsNPCPartyMember(NPC_JOLEE))
		{
			DelayCommand(0.1, CP_PartyJump(oPC, lPC));
			// Flush the player with an anim to ensure they don't end up frozen post-convo.
			DelayCommand(0.2, CP_FaceNPC(oPC, oElora));
			
			if (GetTag(oPM1) == "Jolee")
				{
					DelayCommand(0.1, CP_PartyJump(oPM1, lJolee));
					DelayCommand(0.1, CP_PartyJump(oPM2, lPM2));
				}
				else
					{
						DelayCommand(0.1, CP_PartyJump(oPM2, lJolee));
						DelayCommand(0.1, CP_PartyJump(oPM1, lPM2));
					}
		}
		else
			{
				DelayCommand(0.1, CP_PartyHerder(lPC, lJolee, lPM2));
				// Flush the player with an anim to ensure they don't end up frozen post-convo.
				DelayCommand(0.2, CP_FaceNPC(oPC, oElora));
			}
}
