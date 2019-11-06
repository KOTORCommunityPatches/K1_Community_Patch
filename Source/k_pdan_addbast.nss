//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).
	
	This script adds Bastila to the party at the end of the post-Grove conversation.
	A fade-out has been added to mask the transition to the Ahlan Matale DLG.
	
	See also k_pdan_alhan07.
	
	Issue #55: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/55
	
	DP 2019-11-06																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	if (IsAvailableCreature(NPC_BASTILA) == FALSE)
		{
			AddAvailableNPCByTemplate(NPC_BASTILA, "p_bastilla");
		}
	
	if (GetNPCSelectability(NPC_BASTILA) == FALSE)
		{
			SetGlobalFadeOut();
			
			SetNPCSelectability(NPC_BASTILA, TRUE);
			SetGlobalBoolean("DAN_BASTILA_AT_JEDI", FALSE);
			
			AssignCommand(GetFirstPC(), ShowPartySelectionGUI("k_pdan_alhan02", NPC_BASTILA, -1));
			
			DestroyObject(GetObjectByTag("bastila"), 0.0, TRUE);
		}
	
}
