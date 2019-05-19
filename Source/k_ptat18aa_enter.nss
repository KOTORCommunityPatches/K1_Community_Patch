////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnEnter for tat_m18a (Tatooine Dune Sea).
	
	This is the hijacked OnEnter for the Dune Sea, since the original script
	cannot be decompiled. It checks if the player has spoken to the miners
	at the sandcrawler (through an added local boolean) and has resolved the
	quest at the Sandpeople enclave (either peacefully or violently). If both
	cases are true, the miners are removed, since their dialogue indicates they
	plan on evacuating back to Anchorhead soon after the player has rescued them.
	See also cp_tat18aa_enter.
	
	DP 2019-05-19                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	int nCount = 0;
	object oMinerCap = GetObjectByTag("tat18_13craw2_01", 0);
	object oMinerGrunt = GetObjectByTag("tat18_13craw1_01", nCount);
	
	if ((GetLocalBoolean(oMinerCap, 53) && GetGlobalBoolean("tat_TuskenDead")))
		{
			if(GetIsObjectValid(oMinerCap))
				{
					DestroyObject(oMinerCap,0.0,TRUE);
				}
			
			while ((GetIsObjectValid(oMinerGrunt)))
				{
					if (GetIsObjectValid(oMinerGrunt))
						{
							DestroyObject(oMinerGrunt, 0.0, TRUE);
						}
				
					(nCount++);
					
					oMinerGrunt = GetObjectByTag("tat18_13craw1_01", nCount);
				}
		}
}