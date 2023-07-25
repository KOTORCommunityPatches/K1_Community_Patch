//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	OnEnter for tar04_repsoldie.utt in tar_m04aa (Taris Undercity).
	
	This is the trigger OnEnter that causes the newly spawned Rakghouls to attack
	the (now cured) infected Republic soldier. The soldier is now given a facing
	command to point him in the right direction and hit with the Horrified effect
	so that he cowers in fear. The Rakghouls have been given a move command so
	that they all get within range, since the vanilla script only had the attack
	command which usually resulted in only the nearest Rakghoul charging in before
	the soldier died.
	
	See also k_ptar_reprun, k_ptar_repserum, tar_pc_jump.
	
	Issue #666: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/666
	
	DP 2023-07-25																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oEntering = GetEnteringObject();
	object oFace = GetObjectByTag("tar04_wpreprg", 0);
	object oRak;
	int nCnt;
	
	if (GetTag(oEntering) == "REPUBLICSO")
		{
			AssignCommand(oEntering, ClearAllActions());
			DelayCommand(0.1, AssignCommand(oEntering, ActionDoCommand(SetFacing(215.0))));
			DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectHorrified(), oEntering, 4.0));
			
			nCnt = 0;
			
			while (GetIsObjectValid(oRak = GetObjectByTag("tar04_repsolrg", nCnt)))
				{
					AssignCommand(oRak, ActionMoveToObject(oEntering, TRUE));
					AssignCommand(oRak, ActionAttack(oEntering, FALSE));
					
					nCnt++;
				}
			
			// Give enough time for all the Rakghouls to attack before allowing him to die.
			DelayCommand(2.0, SetPlotFlag(oEntering, FALSE));
		}
}
