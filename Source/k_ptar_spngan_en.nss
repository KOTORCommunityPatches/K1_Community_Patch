////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by a trigger in tar_m02ac (Upper City South).
	
	A script edit by AFP to make sure Gana Levin has a bark bubble.
	
	2019-03-18                                                                */
////////////////////////////////////////////////////////////////////////////////

int CheckBoolean(object oTrigger) {
	 
	if (GetIsObjectValid(oTrigger))
		{
			int iLocalBool = GetLocalBoolean(oTrigger, 10);
			
			if (iLocalBool > 0)
				{
					return TRUE;
				}
		}
	
	return FALSE;
}

void main(){
	
	object oGana = GetObjectByTag("GanaLavin021");
	object oPC = GetFirstPC();
	object oEntering = GetEnteringObject();
    
	if (GetIsPC(oEntering) && GetIsObjectValid(oGana) && !CheckBoolean(OBJECT_SELF))
		{
			if (GetIsObjectValid(OBJECT_SELF))
				{
					SetLocalBoolean(OBJECT_SELF, 10, 1);
				}
			
			if (GetIsObjectValid(oGana))
				{
					SetLocalBoolean(oGana, 9, 1);
				}
			
			ExecuteScript("k_ptar_gana20a", OBJECT_SELF);
			DelayCommand(0.2, BarkString(oGana, 22214));
		}
}
