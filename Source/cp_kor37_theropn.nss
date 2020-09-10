//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for kor37_therangen.utp in korr_m37aa (Korriban Tomb of Ajunta Pall).
	
	This is the OnOpen script for the therangen pillar the player has to blow up
	to proceed in the Tomb of Ajunta Pall. This script simply filters the player's
	inventory in the Give Item screen so that only grenades and mines are shown.
	Credit to JC for coming up with the filtering trick.
	
	Issue #xxx: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/xxx
	
	DP 2020-09-07																*/
//////////////////////////////////////////////////////////////////////////////////

int GrenadeCheck(object oItem) {
	
	string sItemTag = GetTag(oItem);
	
	if (sItemTag == "G_w_StunGren01" ||
	sItemTag == "g_w_adhsvgren001" ||
	sItemTag == "g_w_fraggren01" ||
	sItemTag == "G_w_SonicGren01" ||
	sItemTag == "G_w_ThermlDet01" ||
	sItemTag == "G_W_FIREGREN001" ||
	sItemTag == "G_I_TRAPKIT002" ||
	sItemTag == "G_I_TRAPKIT005" ||
	sItemTag == "G_I_TRAPKIT011" ||
	sItemTag == "G_I_TRAPKIT008" ||
	sItemTag == "G_I_TRAPKIT003" ||
	sItemTag == "G_I_TRAPKIT006" ||
	sItemTag == "G_I_TRAPKIT012" ||
	sItemTag == "G_I_TRAPKIT009" ||
	sItemTag == "G_I_TRAPKIT001" ||
	sItemTag == "G_I_TRAPKIT004" ||
	sItemTag == "G_I_TRAPKIT010" ||
	sItemTag == "G_I_TRAPKIT007")
		{
			return TRUE;
		}
	else
		{
			return FALSE;
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oItem;
	string sTag;
	
	oItem = GetFirstItemInInventory(oPC);
	
	while (GetIsObjectValid(oItem))
		{
			sTag = GetTag(oItem);
			
			if (!GetPlotFlag(oItem) && !GrenadeCheck(oItem))
				{
					SetPlotFlag(oItem, TRUE);
					DelayCommand(0.5, SetPlotFlag(oItem, FALSE));
				}
			
			oItem = GetNextItemInInventory(oPC);
		}
}
