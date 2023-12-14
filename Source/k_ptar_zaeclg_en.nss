//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_zaeclg.utt in tar_m11aa (Taris Hidden Beks Base)

	This script is fired by a trigger in front of Gadon the first time the
	party enters the Hidden Beks' base, initiating Zaerdra's "Hold it right
	there" dialogue. This has been altered to jump the party into a more
	desirable position, in conjunction with chaining Gadon's conversation
	on directly to the end.
	
	Updated 2023-12-14 to tweak the setup to better hide the party positioning.
	
	See also k_ptar_zaerd.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70

	DP 2019-05-01 / DP 2023-12-14												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oEntering = GetEnteringObject();
	object oPC = GetFirstPC();
	object oZaedra = GetObjectByTag("zaerdra111");
	location lPC = Location(Vector(63.9,74.5,0.0), 90.0);
	location lPM1 = Location(Vector(65.4,72.5,0.0), 90.0);
	location lPM2 = Location(Vector(62.4,72.5,0.0), 90.0);

	if (GetIsPC(oEntering) && !UT_GetTalkedToBooleanFlag(OBJECT_SELF))
		{
			UT_SetTalkedToBooleanFlag(OBJECT_SELF, TRUE);
			
			SetGlobalFadeOut();
			SetGlobalFadeIn(1.2, 1.0);
			
			NoClicksFor(1.5);
			
			SetPartyLeader(NPC_PLAYER);
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			DelayCommand(0.5, AssignCommand(oZaedra, ClearAllActions()));
			
			DelayCommand(0.9, AssignCommand(oZaedra, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
		}
}
