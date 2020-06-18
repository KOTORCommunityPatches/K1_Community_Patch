//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar03_brejik031.dlg in tar_m03af (Taris Swoop Platform).
	
	As the name suggests, this script originally destroyed the three swoop fans
	that are spawned in at the start of the Taris swoop race finale scene. Now
	they have been left alive, so this script instead jumps them in behind the
	player. Somewhat more complex than it probably should have been, due to the
	fact that Bioware chose to use the same tag for all three UTCs. The player
	now also gets a facing adjustment to point them towards Brejik instead of
	straight ahead.
	
	See also cp_tar03_brejeqp, cp_tar03_brejfce, k_ptar_brejikatk, k_ptar_brejik_sp,
	k_ptar_swpie_ud.
	
	Issue #345: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/345
	
	DP 2020-06-18																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oWP_PC = GetObjectByTag("tar_pc_cutjump", 0);
	int nCount;
	object oFan;
	location lFan;
	
	ActionPauseConversation();
	
	AssignCommand(oPC, JumpToLocation(GetLocation(oWP_PC)));
	AssignCommand(oPC, ActionDoCommand(SetFacing(147.5)));
	AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 2.0));
	
	nCount = 2;
	
	while (nCount >= 0)
		{
			oFan = GetObjectByTag("tar03_swoopie", nCount);
			
			switch (nCount)
				{
					case 0:
						lFan = Location(Vector(233.678,219.222,8.25), 142.726);
						break;
					case 1:
						lFan = Location(Vector(232.899,223.318,8.25), -142.23);
						break;
					case 2:
						lFan = Location(Vector(234.032,221.816,8.25), -167.307);
						break;
				}
	
			AssignCommand(oFan, JumpToLocation(lFan));
	
			(nCount--);
		}
	
	DelayCommand(1.0, ActionResumeConversation());
}
