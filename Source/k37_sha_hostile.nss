////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor37_shaardan.dlg in korr_m37aa (Tomb of Ajunta Pall).
	
	Originally a fix by AFP that hijacked the vanilla script to force Shaardan
	to attack with a Lightsaber instead of a vibroblade when turned hostile.
	Now integrated into a single script.
	
	JC 2018-08-09                                                             */
////////////////////////////////////////////////////////////////////////////////

#include "k_inc_generic"

void main() {
	
	object oSpeaker = GetPCSpeaker();
	
	ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE_1);
	
    //Edited to make Shaardan able to equip a lightsaber
	ActionEquipMostDamagingMelee();
	
	/*
	object object3 = GetItemPossessedBy(OBJECT_SELF, "G_w_VbrDblswd01");
	
	if (GetIsObjectValid(object3))
		{
			ClearAllActions();
			ActionEquipItem(object3, 4, 0);
			Db_PostString("Sword valid", 10, 10, 4.0);
		}
		else
		{
			Db_PostString("Sword not valid", 10, 10, 4.0);
		}
	*/
	
	DelayCommand(0.5, GN_DetermineCombatRound(oSpeaker));
	
	SetGlobalNumber("KOR33_SHAARDAN", 4);
}
