//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnDeath script for tar10_vulkpool.utc / tar10_vulkpoo005.utc in tar_m10aa
	(Taris Black Vulkar Base (Upper)).
	
	This is the OnDeath script for the two lieutenants in the upper Vulkar base
	that carry the passcard quest item. It replaces the generic OnDeath. Since
	there's no reason to drop duplicate items, this script in conjunction with
	a custom UserDefine takes care of destroying the second passcard if the PC
	already picked one up, or if one lieutenant already died and dropped his.
	
	See also cp_tar10_vlkplud.
	
	Issue #364: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/364
	
	DP 2021-10-25																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oCard = GetItemPossessedBy(OBJECT_SELF, "tar10_mechid");
	object oPC_Card = GetItemPossessedBy(GetFirstPC(), "tar10_mechid");
	
	if (GetIsObjectValid(oPC_Card))
		{
			DestroyObject(oCard);
		}
		else if (GetIsObjectValid(oCard))
			{
				if (GetTag(OBJECT_SELF) == "VulkarPool")
					{
						SignalEvent(GetNearestObjectByTag("Vulkarguard", OBJECT_SELF, 1), EventUserDefined(100));
						SignalEvent(GetNearestObjectByTag("Vulkarguard", OBJECT_SELF, 2), EventUserDefined(100));
						SignalEvent(GetNearestObjectByTag("Vulkarguard", OBJECT_SELF, 3), EventUserDefined(100));
					}
				
				if (GetTag(OBJECT_SELF) == "Vulkarguard")
					{
						SignalEvent(GetNearestObjectByTag("VulkarPool", OBJECT_SELF, 1), EventUserDefined(100));
						SignalEvent(GetNearestObjectByTag("VulkarPool", OBJECT_SELF, 2), EventUserDefined(100));
						SignalEvent(GetNearestObjectByTag("VulkarPool", OBJECT_SELF, 3), EventUserDefined(100));
						SignalEvent(GetNearestObjectByTag("VulkarPool", OBJECT_SELF, 4), EventUserDefined(100));
						SignalEvent(GetNearestObjectByTag("VulkarPool", OBJECT_SELF, 5), EventUserDefined(100));
					}
			}
	
	ExecuteScript("k_ai_master", OBJECT_SELF, 1007);  // KOTOR_DEFAULT_EVENT_ON_DEATH
}
