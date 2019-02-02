////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	k_pebo_carthrom
	
	Post-Leviathan cleanup for HK. Gives him all the stat bonuses he can get if
	you repair him because you can't repair him after this scene.
	
	JC 2019-02-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

object oHK = GetObjectByTag("HK47", 0);
object oOldHide = GetItemInSlot(INVENTORY_SLOT_CARMOUR, oHK);
object oNewHide = CreateItemOnObject("g_i_crhide012", oHK);

if( GetIsObjectValid(oOldHide) ) {
        DestroyObject(oOldHide);
        }
ActionEquipItem(oNewHide, INVENTORY_SLOT_CARMOUR, TRUE);
SetGlobalBoolean("Ebo_HK47", TRUE);

}