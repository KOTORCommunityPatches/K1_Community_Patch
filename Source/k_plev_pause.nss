//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by lev40_darthmala2.dlg in lev_m40ac (Leviathan Hangar Bay).
	
	As part of returning Bastila's equipped gear at the end of the Malak showdown
	on the Leviathan, she now only equips a stunt saber if she doesn't already
	have a saber equipped, in much the same way as Carth is already dealt with
	in the vanilla scene. If she already has any type of saber, it is simply
	given a powered override, otherwise she is given the stunt saber. In an
	extension of other forced powered saber changes originally made by danil-ch,
	the PC now also has their saber powered on, if applicable.
	
	See also k_plev_bastatk, k_plev_destweap, k_plev_finale1, k_plev_malakmov2.
	
	Issue #419: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/419
	
	DP 2021/11/26																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBastila = GetObjectByTag("bastila", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oMalak = GetObjectByTag("DarthMalak400", 0);
	int nPCWeap = GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oPC));
	int nBastWeap = GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oBastila));
	int nCarthWeap = GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oCarth));
	object oStuntWeap;
	
	ActionPauseConversation();
	
	NoClicksFor(4.5);
	
	// Force the PC's saber/s to be powered for the cutscene, just like Bastila.
	DelayCommand(3.0, SetLightsaberPowered(oPC, TRUE, TRUE, TRUE));
	
	// Check if Bastila has a saber equipped. If not, give her a stunt saber.
	if (nBastWeap != BASE_ITEM_LIGHTSABER && nBastWeap != BASE_ITEM_SHORT_LIGHTSABER && nBastWeap != BASE_ITEM_DOUBLE_BLADED_LIGHTSABER)
		{
			oStuntWeap = CreateItemOnObject("bast_temp_saber", oBastila, 1);
			DelayCommand(3.0, AssignCommand(oBastila, ActionEquipItem(oStuntWeap, INVENTORY_SLOT_RIGHTWEAPON, TRUE)));
			DelayCommand(3.25, SetLightsaberPowered(oBastila, TRUE, TRUE, TRUE));
			
			// Spawn a duplicate on an invisible placeable to grab the tag from later.
			CreateItemOnObject("bast_temp_saber", GetObjectByTag("lev_invis_conv_target1"), 1);
		}
		else
			{
				DelayCommand(3.0, SetLightsaberPowered(oBastila, TRUE, TRUE, TRUE));
				
				// Spawn duplicates of equipped weapons on an invisible placeable to grab the tag from later.
				CreateItemOnObject(GetTag(GetItemInSlot(INVENTORY_SLOT_RIGHTWEAPON, oBastila)), GetObjectByTag("lev_invis_conv_target1"), 1);
				CreateItemOnObject(GetTag(GetItemInSlot(INVENTORY_SLOT_LEFTWEAPON, oBastila)), GetObjectByTag("lev_invis_conv_target2"), 1);
			}
	
	// Check if Carth has a blaster equipped. If not, give him a stunt blaster.
	if (nCarthWeap != BASE_ITEM_BLASTER_PISTOL && nCarthWeap != BASE_ITEM_HEAVY_BLASTER && nCarthWeap != BASE_ITEM_HOLD_OUT_BLASTER && nCarthWeap != BASE_ITEM_BLASTER_CARBINE
	&& nCarthWeap != BASE_ITEM_BLASTER_RIFLE && nCarthWeap != BASE_ITEM_BOWCASTER && nCarthWeap != BASE_ITEM_DISRUPTER_PISTOL && nCarthWeap != BASE_ITEM_DISRUPTER_RIFLE
	&& nCarthWeap != BASE_ITEM_ION_BLASTER && nCarthWeap != BASE_ITEM_ION_RIFLE && nCarthWeap != BASE_ITEM_SONIC_PISTOL && nCarthWeap != BASE_ITEM_SONIC_RIFLE
	&& nCarthWeap != BASE_ITEM_REPEATING_BLASTER && nCarthWeap != BASE_ITEM_HEAVY_REPEATING_BLASTER)
		{
			oStuntWeap = CreateItemOnObject("carth_temp_gun", oCarth, 1);
			DelayCommand(1.0, AssignCommand(oCarth, ActionEquipItem(oStuntWeap, INVENTORY_SLOT_RIGHTWEAPON, TRUE)));
		}
	
	DelayCommand(4.5, ActionResumeConversation());
}
