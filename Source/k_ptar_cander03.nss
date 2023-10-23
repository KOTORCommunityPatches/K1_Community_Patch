//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	StartingConditional for tar04_cand043.dlg in tar_m04aa (Taris Undercity).
	
	This is the starting conditional for the second portion of the scene with
	Canderous and his mooks in the Taris Undercity. It has been edited to now
	heal Canderous and any surviving mooks so they aren't playing the wounded
	animations during the remaining conversation and afterwards.
	
	See also k_ptar_candatk, k_ptar_cander04, k_ptar_canstr_en.
	
	Issue #235: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/235
	
	DP 2023-10-23																*/
//////////////////////////////////////////////////////////////////////////////////

int StartingConditional() {
	
	if (GetGlobalNumber("Tar_Canderous") == 1)
		{
			object oMook;
			int nCnt = 1;
			
			// Heal Canderous.
			ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(50), OBJECT_SELF);
			
			while (nCnt < 4)
				{
					oMook = GetObjectByTag("daviktroop04" + IntToString(nCnt), 0);
					
					if (!GetIsDead(oMook))
						{
							// Heal any of his mooks that are still alive.
							ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(50), oMook);
							
							AssignCommand(oMook, ClearAllActions());
						}
					
					nCnt++;
				}
			
			return TRUE;
		}
	
	return FALSE;
}
