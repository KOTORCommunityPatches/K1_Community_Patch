//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar03_calo031.dlg in tar_m03ae (Taris Lower City Javyar's Cantina).
	
	This script fires during the scene of Calo Nord killing three Black Vulkars
	in the Lower City cantina. The original version of the script made reference
	to blaster fire sounds that don't exist in the game files, so the scene only
	ended up playing two shots, despite there being three victims. This has now
	been changed to the extant sound, along with changing the cries of the two
	Twi'leks to different sounds to reduce the clone effect and also tweaking the
	timings for everything.
	
	See also k_ptar_flash.
	
	Issue #359: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/359
	
	DP 2020-06-15																*/
////////////////////////////////////////////////////////////////////////////////// 

// Pulled from k_inc_utility, since it cuts down on extraneous include cruft.
void CP_CreateObject(int nObjectType, string sTemplate, location lLocal) {
    
	object oCreate = CreateObject(nObjectType, sTemplate, lLocal);
}

void main() {

	object oHelper1 = GetObjectByTag("invis_sound1", 0);
	object oHelper2 = GetObjectByTag("invis_sound2", 0);
	object oHelper3 = GetObjectByTag("invis_sound3", 0);
	object oCalo = GetObjectByTag("calo031", 0);
	object oRodian = GetObjectByTag("taproomvic031", 0);
	object oTwilek1 = GetObjectByTag("taproomvic032", 0);
	object oTwilek2 = GetObjectByTag("taproomvic033", 0);
	location lCorpse3 = GetLocation(GetObjectByTag("tar03_wpvic0", 0));
	location lCorpse1 = GetLocation(GetObjectByTag("tar03_wpvic1", 0));
	location lCorpse2 = GetLocation(GetObjectByTag("tar03_wpvic2", 0));
	
	ActionPauseConversation();
	
	DestroyObject(oRodian, 0.0, TRUE);
	DestroyObject(oTwilek1, 0.0, TRUE);
	DestroyObject(oTwilek2, 0.0, TRUE);
	
	DelayCommand(1.0, AssignCommand(oCalo, PlaySound("cb_ht_blastleth1")));
	DelayCommand(2.0, AssignCommand(oCalo, PlaySound("cb_ht_blastleth1")));
	DelayCommand(3.0, AssignCommand(oCalo, PlaySound("cb_ht_blastleth1")));
	
	DelayCommand(1.75, AssignCommand(oHelper1, PlaySound("n_twilekm_hit1")));
	DelayCommand(2.75, AssignCommand(oHelper2, PlaySound("n_rodian_hit1")));
	DelayCommand(3.75, AssignCommand(oHelper3, PlaySound("n_twilekm_hit2")));
	
	DelayCommand(1.5, CP_CreateObject(OBJECT_TYPE_CREATURE, "bp_dead3", lCorpse3));
	DelayCommand(2.0, CP_CreateObject(OBJECT_TYPE_CREATURE, "bp_dead1", lCorpse1));
	DelayCommand(2.5, CP_CreateObject(OBJECT_TYPE_CREATURE, "bp_dead2", lCorpse2));
	
	DelayCommand(10.0, ActionResumeConversation());
}
