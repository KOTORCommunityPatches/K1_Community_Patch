//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk42_eldspk.utt in unk_m42aa (Unknown World Elder's Settlement).
	
	This script is fired by one of the triggers at the entrance of the Elder's
	compound to initiate conversation the first time the party enters. Some
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
	
	Revised the code to split out unnecessary elements to scripts that fire on
	the opening nodes of the DLG. One of these already handled walking the player,
	so the other members were added as well.
	
	See also k_punk_blckhost, k_punk_rakeld01.
	
	DP 2019-10-09																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oEntering = GetEnteringObject();
	location lPC = Location(Vector(52.5,28.5,16.165), 90.0);
	location lPM1 = Location(Vector(54.0,26.0,16.165), 90.0);
	location lPM2 = Location(Vector(51.0,26.0,16.165), 90.0);
	
	SetPartyLeader(NPC_PLAYER);
	
	if (GetIsPC(oEntering) && CP_HasNeverTriggered())
		{
			HoldWorldFadeInForDialog();
			
			CP_PartyHerder(lPC, lPM1, lPM2);
			
			if (!GetGlobalBoolean("Unk_RedHostile"))
				{
					NoClicksFor(6.0);
					CP_DLGInit("unk42_redelder");
				}
				else
					{
						SetGlobalFadeIn(0.5, 1.5);
					}
		}
}
