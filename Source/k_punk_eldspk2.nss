//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_eldspk2.utt in unk_m42aa (Unknown World Elder's Settlement).
	
	This script is fired by one of the triggers at the entrance of the Elder's
	compound to initiate conversation after the party has killed The One. Some
	tweaks have been made in order to wrangle the party, since by default the
	party members will remain hanging back in the entrance-way instead of falling
	in behind the PC at the start of the conversation. Additionally, the original
	attempt to forcibly set the PC to party leader did not work while inside
	the If statement, so it has been moved out so that it functions properly.
	Having a party member as party leader can cause the PC to freak out once the
	conversation ends.
	
	Issue #169: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/169
	
	DP 2019-06-22
	
//////////////////////////////////////////////////////////////////////////////////
	
	Revised the code to skip straight to jumping the party into their final positions
	since, unlike with the first trigger, on the second triggered conversation there
	is no opening wide shot to show the party walking in.
	
	DP 2019-10-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(52.875,36.5,16.165), 90.0);
	location lPM1 = Location(Vector(54.5,34.0,16.165), 90.0);
	location lPM2 = Location(Vector(51.25,34.0,16.165), 90.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered() && GetGlobalBoolean("Unk_One_Dead"))
		{
			HoldWorldFadeInForDialog();
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			if (!GetGlobalBoolean("Unk_RedHostile"))
				{
					NoClicksFor(3.0);
					CP_DLGInit("unk42_redelder");
				}
				else
					{
						SetGlobalFadeIn(0.5, 1.5);
					}
		}
}
