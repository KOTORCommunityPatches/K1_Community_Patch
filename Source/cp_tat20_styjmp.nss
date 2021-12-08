//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat20_xstory_01.dlg in tat_m20aa (Tatooine Sand People Enclave).
	
	This script fires on the two starting nodes of the Storyteller's DLG in order
	to jump the party into position. If HK is present, he and the PC are brought
	up close and HK's orientation is locked to prevent him constantly refacing
	between the Storyteller and the PC and freaking out the dynamic camera.
	
	See also cp_tat20_hkunlck.
	
	Issue #221: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/221
	
	DP 2021/12/08																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oHK = GetObjectByTag("hk47");
	object oPC = GetFirstPC();
	location lPC = Location(Vector(4.28,60.75,14.58), 143.50);
	location lHK = Location(Vector(1.44,59.80,14.68), 75.00);
	location lPM2 = Location(Vector(3.64,57.94,14.58), 108.50);
	location lPCb = Location(Vector(3.05,59.71,14.58), 108.50);
	location lPM1b = Location(Vector(5.14,58.20,14.58), 108.50);
	location lPM2b = Location(Vector(2.29,57.24,14.68), 108.50);
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.5, 1.0);
	
	NoClicksFor(1.5);
	
	SetPartyLeader(NPC_PLAYER);
	
	if (!GetIsObjectValid(oHK))
		{
			CP_PartyHerder(lPCb, lPM1b, lPM2b);
			
			DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
		}
		else
			{
				object oPM1 = GetPartyMemberByIndex(1);
				object oPM2 = GetPartyMemberByIndex(2);
				
				CP_PartyJump(oPC, lPC);
				CP_PartyJump(oHK, lHK);
				
				DelayCommand(0.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1)));
				DelayCommand(0.5, SetLockOrientationInDialog(oHK, TRUE));
				
				if (oPM1 != oHK)
					{
						CP_PartyJump(oPM1, lPM2);
					}
				
				if (oPM2 != oHK)
					{
						CP_PartyJump(oPM2, lPM2);
					}
			}
}
