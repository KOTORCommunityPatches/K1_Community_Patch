//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for man27_enter.utt in manm27aa (Manaan Sith Base).
	
	This is the trigger OnEnter for the foyer. It fires the cutscene with the Sith
	Lieutenant at the desk who calls in the "Diplomat", and his bevy of war droids,
	from outside. The original script had a habit of jumping the player behind the
	lieutenant, even when the party entered from the front door. It didn't account
	for the fact that the party can enter the room from three different directions,
	which makes for a messy scene. This has now been changed, in conjunction with
	some door swaps, to position the party correctly based on their entry point. It
	also corrects the starting position of the diplomat, since he somehow ended up
	offset from his spawn-in point which was causing pathing issues. Additionally,
	the vanilla script is global, for some reason. This version is a local module
	injection.
	
	See also cp_man27aa_dr07, cp_man27aa_dr08, cp_man27_lieufce, k_pman_secur01,
	k_pman_secur04, k_pman_secur09, k_pman_sith02.
	
	Issue #141: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/141
	
	DP 2021-01-16																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oDip = GetObjectByTag("man27_sithdip", 0);
	object oLieu = GetObjectByTag("man27_sthlieu", 0);
	object oSideDoor = GetObjectByTag("cp_man27aa_dr07", 0);
	object oBackDoor = GetObjectByTag("cp_man27aa_dr08", 0);
	location lDip = Location(Vector(98.67,35.57,0.02), 0.00);
	location lPC;
	location lPM1;
	location lPM2;
	
	if (GetGlobalBoolean("MAN_SITHBASE_SEALED") == FALSE && IsObjectPartyMember(oEntering))
		{
			NoClicksFor(2.0);
			
			CancelCombat(oPC);
			SetGlobalBoolean("MAN_SITHBASE_SEALED",TRUE);
			
			// Since the Diplomat seems to be out of position, jump him back to where he should be.
			CP_PartyJump(oDip, lDip);
			
			if (GetLocalBoolean(oSideDoor, 7))
				{
					// If the party came in the side door.
					
					SetGlobalFadeOut();
					
					lPC = Location(Vector(112.74,30.33,0.00), 90.00);
					lPM1 = Location(Vector(109.74,29.33,0.00), 60.00);
					lPM2 = Location(Vector(115.74,29.33,0.00), 120.00);
					
					CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
				}
				else if (GetLocalBoolean(oBackDoor, 8))
					{
						// If the party came in the back door.
						
						SetGlobalFadeOut();
						
						lPC = Location(Vector(117.38,35.57,0.00), 180.00);
						lPM1 = Location(Vector(118.38,32.57,0.00), 150.00);
						lPM2 = Location(Vector(118.38,38.57,0.00), 210.00);
						
						CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
					}
					else
						{
							// If the party came in the front door.
							
							HoldWorldFadeInForDialog();
							
							lPC = Location(Vector(109.59,35.57,0.00), 0.00);
							lPM1 = Location(Vector(108.59,38.57,0.00), -30.00);
							lPM2 = Location(Vector(108.59,32.57,0.00), 30.00);
							
							CP_PartyHerder(lPC, lPM1, lPM2, TRUE, FALSE);
						}
			
			
			DelayCommand(0.5, AssignCommand(oLieu, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
	
	if (oEntering == oPC)
		{
			SetStealthXPEnabled(FALSE);
		}
}
