//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by kas25_hurt_01.dlg in kas_m25aa (Kashyyyk Lower Shadowlands).
	
	This script fires when the player returns to Grrrwahrr with the Mando leader's
	helmet. The original only destroyed the helmet itself, but this has now been
	expanded to destroy the datapads the ambushing Mandos drop as well.
	
	Issue #486: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/486
	
	DP 2021-12-04																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_DestroyMandoItems(object oTarget) {
	object oItem = GetFirstItemInInventory(oTarget);
	string sItem;
	while (GetIsObjectValid(oItem))
		{
			sItem = GetTag(oItem);
			if (sItem == "kas25_mandhelmet" || sItem == "kas25_datapad" || sItem == "kas25_datapad1" || sItem == "kas25_datapad2")
				{
					DestroyObject(oItem);
				}
			
			oItem = GetNextItemInInventory(oTarget);
		}
}

void main() {
	
	object oPC = GetFirstPC();
	object oHelm = GetItemPossessedBy(oPC, "kas25_mandhelmet");
	
	NoClicksFor(2.0);
	
	CP_DestroyMandoItems(oPC);
	
	CreateItemOnObject("g_w_vbroshort03", oPC, 1);
}
