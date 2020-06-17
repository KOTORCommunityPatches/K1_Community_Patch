//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for tar02_openbase.utt in tar_m02ab (Taris Upper City North).
	
	This is the trigger OnEnter that plays the scene of T3 opening the door to the
	Taris Sith Base. The vanilla script was somewhat oddly set up, requiring that
	T3 be the controlled character rather than simply being present in the party.
	This seems due to the size of the trigger and the script that fires on the
	opening node of the dialogue, effectively relying on the player to drive T3
	right up to the door before playing the scene. The result of this was that it
	was possible to have the trigger fail to fire by controlling the player and
	then switching to T3. The door would fail to open, since the lock DC is set
	to 100. Now the trigger has been edited to extend much further out from the
	door, and the entire party is jumped as soon as any of them hits it (as long
	as T3 is present), in preparation for the cutscene.
	
	See also k_ptar_baseopen.
	
	Issue #400: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/400
	
	DP 2020-06-17																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oT3 = GetObjectByTag("t3m4", 0);
	object oHelper = GetObjectByTag("tar02_drdtalker", 0);
	location lPC = Location(Vector(111.02,220.85,0.0), 90.0);
	location lT3 = Location(Vector(112.52,223.0,0.0), 90.0);
	location lPM2 = Location(Vector(114.02,220.85,0.0), 90.0);
	
	if (GetIsPC(oEntering) && IsNPCPartyMember(NPC_T3_M4) && !GetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO))
		{
			NoClicksFor(1.0);
			
			SetGlobalFadeOut();
			
			SetLocalBoolean(OBJECT_SELF, SW_PLOT_HAS_TALKED_TO, TRUE);
			
			CP_PartyJump(oPC, lPC);
			CP_PartyJump(oT3, lT3);
			
			if (oPM1 != oT3)
				{
					CP_PartyJump(oPM1, lPM2);
				}	
				else if (GetIsObjectValid(oPM2) && oPM2 != oT3)
					{
						CP_PartyJump(oPM2, lPM2);
					}
			
			DelayCommand(1.0, AssignCommand(oHelper, ActionStartConversation(oHelper, "tar02_base_dlg", FALSE, CONVERSATION_TYPE_CINEMATIC, FALSE)));
		}
}
