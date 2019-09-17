////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kas24_poffice_01.dlg in kas_m24aa (Kashyyyk Upper Shadowlands).
	
	This script is one of two conditionals that checks whether the player has
	has any Tach glands and, in this instance, more than one. The vanilla
	scripts would always end up returning the same result, regardless of if
	the player had multiples or only a single one.
	
	See also k_pkas_yespoach1.
	
	Issue #212: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/212
	
	DP 2019-08-24                                                             */
////////////////////////////////////////////////////////////////////////////////

int GetStackSize(object oTarget, string sItemTag) {
	
	object oItem = GetItemPossessedBy(oTarget, sItemTag);
	int nCount = 0;
	
	if(GetIsObjectValid(oItem))
		{
			nCount = GetNumStackedItems(oItem);
		}
	
	return nCount;
}

int StartingConditional() {
	
	object oSpeaker = GetPCSpeaker();
	
	if ((GetGlobalBoolean("kas_PoacherJob") == TRUE) && (GetStackSize(oSpeaker, "kas24_tachgland") > 1))
		{
			return TRUE;
		}
		else
			{
				return FALSE;
			}
}
