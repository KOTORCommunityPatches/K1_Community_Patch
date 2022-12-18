//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for talktrig.utt in unk_m41ab (Lehon South Beach).
	
	This is the trigger OnEnter that initiates the scene with the hologram
	outside the Elder's Compound on Lehon. The original script was simply named
	"talk", so that has been changed to something more unique. The vanilla scene
	could suffer from excessive user input breaking the party walk commands in
	the subsequent script, despite having a NoClicksFor. This has now been moved
	earlier in the script and runs through to the execution of the following
	script to prevent this. Additionally, since CP party herding functions are
	used in the following script, those have also been used here to ensure the
	party formation remains in the same order (vanilla functions tend to randomly
	swap the order of PM1 and 2).
	
	See also unk41_holo01.
	
	Issue #560: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/560
	
	DP 2022-12-18																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oTarget = GetObjectByTag("b1", 0);
	location lPC = Location(Vector(46.62,114.71,4.77), -78.75);
	location lPM1 = Location(Vector(47.52,115.21,4.80), -78.75);
	location lPM2 = Location(Vector(45.57,114.82,4.75), -78.75);
	
	if (GetIsPC(GetEnteringObject()))
		{
			SetGlobalFadeOut();
			
			NoClicksFor(2.0);
			
			DestroyObject(GetObjectByTag("blowtrig1", 0));
			DestroyObject(GetObjectByTag("blowtrig2", 0));
			DestroyObject(GetObjectByTag("blowtrig3", 0));
			DestroyObject(GetObjectByTag("blowtrig4", 0));
			DestroyObject(GetObjectByTag("blowtrig5", 0));
			
			SetPartyLeader(NPC_PLAYER);
			
			DelayCommand(0.5, CP_PartyHerder(lPC, lPM1, lPM2, TRUE));
			
			DelayCommand(1.0, AssignCommand(oPC, ActionStartConversation(oTarget, "unk41_holo", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE)));
			
			DelayCommand(1.5, DestroyObject(OBJECT_SELF));
		}
}
