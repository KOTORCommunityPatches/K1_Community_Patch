//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Module OnEnter in ebo_m41aa (Ebon Hawk - Lehon Crash).
	
	This is the OnEnter for the Ebon Hawk after landing on the Unknown World. It
	sets the state of the hyperdrive and removes any extraneous journal entries.
	The vanilla list missed out a few entries though, so these have been added.
	
	Issue #227: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/227
	
	DP 2019-10-07																*/
//////////////////////////////////////////////////////////////////////////////////

void CP_JrlRemove() {
	
	RemoveJournalQuestEntry("tat18ac_dragonhunt");
	RemoveJournalQuestEntry("kor25_doubtsith");
	RemoveJournalQuestEntry("kas23_rorworr");
	RemoveJournalQuestEntry("kor35_aidlashowe");
	RemoveJournalQuestEntry("k_swg_helenatalk");
	RemoveJournalQuestEntry("kas23_mainwookplot");
	RemoveJournalQuestEntry("tat_ambush");
	RemoveJournalQuestEntry("tat17ad_buyinghk47");
	RemoveJournalQuestEntry("ebo_supplies");
	RemoveJournalQuestEntry("man_elora");
	RemoveJournalQuestEntry("kor33_enteracademy");
	RemoveJournalQuestEntry("tat17aa_jawarescue");
	RemoveJournalQuestEntry("kor35_findingdustil");
	RemoveJournalQuestEntry("man_firith");
	RemoveJournalQuestEntry("man_gluupor");
	RemoveJournalQuestEntry("kas25_mandalorians");
	RemoveJournalQuestEntry("kas22_EliMatton");
	RemoveJournalQuestEntry("man_ignus");
	RemoveJournalQuestEntry("k_jagi");
	RemoveJournalQuestEntry("kas24_removepoachers");
	RemoveJournalQuestEntry("tar_largobounty");
	RemoveJournalQuestEntry("Man26ab_swoopraces");
	RemoveJournalQuestEntry("tat17aa_middleman");
	RemoveJournalQuestEntry("man_missing");
	RemoveJournalQuestEntry("k_missbroth");
	RemoveJournalQuestEntry("kor35_renegadesith");
	RemoveJournalQuestEntry("man_merc");
	RemoveJournalQuestEntry("kor38_roguedroid");
	RemoveJournalQuestEntry("tat17ag_sandbounty");
	RemoveJournalQuestEntry("tat17ae_signingnico");
	RemoveJournalQuestEntry("kas22_starmap");
	RemoveJournalQuestEntry("kor33_findstarmap");
	RemoveJournalQuestEntry("man26_starmap");
	RemoveJournalQuestEntry("tat17_starmap");
	RemoveJournalQuestEntry("k_pebo_stowaway");
	RemoveJournalQuestEntry("man_murder");
	RemoveJournalQuestEntry("man_sunry");
	RemoveJournalQuestEntry("kas24_tachpoaching");
	RemoveJournalQuestEntry("tat18aa_tanistrapped");
	RemoveJournalQuestEntry("tat17ae_swoopracing");
	RemoveJournalQuestEntry("Category000");
	RemoveJournalQuestEntry("kor35_doublecross");
	RemoveJournalQuestEntry("kor35_doublecross2");
	RemoveJournalQuestEntry("kor38_hermit");
	RemoveJournalQuestEntry("kor35_mandalorian");
	RemoveJournalQuestEntry("kor37_ajuntapall");
	RemoveJournalQuestEntry("k_pebo_gizkatrouble");
	RemoveJournalQuestEntry("kor35_waysith");
	RemoveJournalQuestEntry("k_xor");
	RemoveJournalQuestEntry("ebo46_unfinishedbusiness");
	RemoveJournalQuestEntry("Tat20aa_worthy");
	RemoveJournalQuestEntry("Genoharadan");
	RemoveJournalQuestEntry("Geno_Ithorak");
	RemoveJournalQuestEntry("Geno_Lorgal");
	RemoveJournalQuestEntry("Geno_Rulan");
	RemoveJournalQuestEntry("Geno_Vorn");
	RemoveJournalQuestEntry("Geno_Zuulan");
	RemoveJournalQuestEntry("k_pazaak");
	// Add additional entries for removal not included in the vanilla script
	RemoveJournalQuestEntry("lev_captured");
	RemoveJournalQuestEntry("tar_escape");
	RemoveJournalQuestEntry("man_planet");
	RemoveJournalQuestEntry("main_premium");
	RemoveJournalQuestEntry("man_emb");
	RemoveJournalQuestEntry("tar_planetinfo");
}
void main() {
	
	object oEntering = GetEnteringObject();
	object oHyper = GetObjectByTag("Hyperdrive", 0);
	
	if (GetIsPC(oEntering))
		{
			CP_JrlRemove();
			
			if (!GetGlobalBoolean("EBO_HYPER_FIXED"))
				{
					AssignCommand(oHyper, ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
					
					if (GetGlobalBoolean("UNK_SHIPPARTS"))
						{
							object oPC = GetFirstPC();
							object oTalker = GetObjectByTag("invis");
							
							AssignCommand(oTalker, ActionStartConversation(oPC, "ebo41_tell", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
						}
				}
				else
					{
						AssignCommand(oHyper, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));
					}
			
			PlayRoomAnimation("m12aa_01q", 7);
			
			if (IsAvailableCreature(NPC_JOLEE))
				{
					DestroyObject(GetObjectByTag("bastila", 0), 0.0, TRUE);
					RemovePartyMember(NPC_BASTILA);
				}
			
			RevealMap();
		}
}
