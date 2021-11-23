//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by unk41_carth.dlg in unk_m41aa (Lehon Central Beach).
	
	This script fires during the start of the beach scene, walking the player and
	Bastila or Jolee/Juhani from the trail to the rest of the party on the beach.
	In order to improve the shot composition of the DS version of the scene, Bastila
	has been given a different position than she was originally.
	
	See also cp_unk41_csface1, cp_unk41_csface2, cp_unk41_csface3, cp_unk41_csface4,
	cp_unk41_csface5, cp_unk41_csface6, cp_unk41_misdies, cp_unk41_pause1s,
	k_def_gizka02, k_punk_carrun, k_punk_finale01, k_punk_finale05, k_punk_finale06,
	k_punk_finale07, k_punk_finale08, k_punk_finale11, k_punk_finale15, k_punk_finale17,
	k_punk_finale18, k_punk_finale19, k_punk_finale20, k_punk_finale21, k_punk_fincs_en,
	k_punk_misrem, k_punk_mzatk, k_punk_zaalrem.
	
	Issue #168: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/168
	
	DP 2021-11-23																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oBast = GetObjectByTag("bastila", 0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	vector vFace = GetPosition(GetObjectByTag("carthend", 0));
	
	ActionPauseConversation();
	
	NoClicksFor(5.0);
	
	AssignCommand(oPC, ActionMoveToLocation(GetLocation(GetObjectByTag("playerend", 0))));
	DelayCommand(1.0, AssignCommand(oPC, ActionDoCommand(SetFacingPoint(vFace))));
	DelayCommand(1.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_LISTEN, 1.0, 1.0)));
	
	if (GetGlobalNumber("G_FinalChoice") == 1)
		{
			// For the DS ending, send Bastila to the PM2 waypoint for better positioning during the conversation. 
			AssignCommand(oBast, ActionMoveToLocation(GetLocation(GetObjectByTag("final2wp2", 0))));
			DelayCommand(1.0, AssignCommand(oBast, ActionDoCommand(SetFacingPoint(vFace))));
			
			// Leave a PM2 command as a safety precaution for mod-added party members like DS Juhani.
			if (GetTag(oPM1) != "bastila")
				{
					AssignCommand(oPM1, ActionMoveToLocation(GetLocation(GetObjectByTag("final1wp2", 0))));
					DelayCommand(1.0, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(vFace))));
				}
			if (GetTag(oPM2) != "bastila")
				{
					AssignCommand(oPM2, ActionMoveToLocation(GetLocation(GetObjectByTag("final1wp2", 0))));
					DelayCommand(1.0, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(vFace))));
				}
		}
		else
			{
				AssignCommand(oPM1, ActionMoveToLocation(GetLocation(GetObjectByTag("final1wp2", 0))));
				DelayCommand(1.0, AssignCommand(oPM1, ActionDoCommand(SetFacingPoint(vFace))));
				
				AssignCommand(oPM2, ActionMoveToLocation(GetLocation(GetObjectByTag("final2wp2", 0))));
				DelayCommand(1.0, AssignCommand(oPM2, ActionDoCommand(SetFacingPoint(vFace))));
			}
	
	DelayCommand(5.0, ActionResumeConversation());
}
