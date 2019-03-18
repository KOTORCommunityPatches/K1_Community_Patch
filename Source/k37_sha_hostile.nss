////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by kor37_shaardan.dlg in korr_m37aa (Tomb of Ajunta Pall).
	
	A fix by AFP that hijacks the original script to force Shaardan to attack
	with a Lightsaber instead of a vibroblade when turned hostile.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

void main(){

  ExecuteScript("k37_sha_old", OBJECT_SELF);
  ActionEquipMostDamagingMelee();
}