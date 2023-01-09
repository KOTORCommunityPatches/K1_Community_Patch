//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	UserDefine for kas25_mandalor02.utc in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This is the OnUserDefine script for one of the Mandos that spawn as part of
	the Hidden Hunters quest from Grrrwahrr. The vanilla script had an OnDeath
	event that checked the state of a global number in order to destroy duplicates
	of the datapads these enemies drop. However, it seems that changes were made
	to how this quest was implemented, meaning this approach no longer works. As
	such, this has now been changed to an OnHeartbeat check, since the Mando OnSpawn
	scripts enable both OnHeartbeat and OnDeath events. If the PC has already picked
	up a copy of the datapad previously, the duplicate that the Mando is caryying
	is destroyed.
	
	See also k_pkas_manduser.
	
	Issue #271: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/271
	
	DP 2023-01-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nUser = GetUserDefinedEventNumber();
	
	if (nUser == 1001) // HEARTBEAT
		{
			object oPC = GetFirstPC();
			object oDatapad2 = GetItemPossessedBy(OBJECT_SELF, "kas25_datapad2");
			object oPCPad2 = GetItemPossessedBy(oPC, "kas25_datapad2");
			int SW_PLOT_BOOLEAN_06 = 5;
			
			if (!GetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_06) && GetIsObjectValid(oPCPad2))
				{
					DestroyObject(oDatapad2);
					SetLocalBoolean(OBJECT_SELF, SW_PLOT_BOOLEAN_06, TRUE);
				}
		}
	else if (nUser == 1002) // PERCEIVE
		{

		}
	else if (nUser == 1003) // END OF COMBAT
		{

		}
	else if (nUser == 1004) // ON DIALOGUE
		{

		}
	else if (nUser == 1005) // ATTACKED
		{

		}
	else if (nUser == 1006) // DAMAGED
		{

		}
	else if (nUser == 1007) // DEATH
		{

		}
	else if (nUser == 1008) // DISTURBED
		{

		}
	else if (nUser == 1009) // BLOCKED
		{

		}
	else if (nUser == 1010) // SPELL CAST AT
		{

		}
}
