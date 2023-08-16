//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tat18_10tanis_01.dlg in tat_m18aa (Tatooine Dune Sea).
	
	This is a replacement starting conditional for Tanis that checks if the party
	member speaking to him for the first time is wearing the Sandpeople disguise.
	The vanilla starting conditional checked the tat_TuskenSuit global, but that
	is only set true if the entire party is disguised, meaning Tanis can be spoken
	to normally while dressed as a Tusken as long as at least one of the party
	isn't disguised. Switched to a simple check of the speaker's equipped torso
	slot item.
	
	Issue #690: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/690
	
	DP 2023-08-16																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	object oBody = GetItemInSlot(INVENTORY_SLOT_BODY, GetPCSpeaker());
	
	if (GetTag(oBody) == "tat17_sandperdis")
		{
			return TRUE;
		}
	
	return FALSE;
}
