//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_ff_dlg2.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script fires on the first nodes of both branches of the forcefield cutscene.
	For the scene post-Zaalbar jail break where the field is shut down, the party
	members are temporarily removed from the party to prevent them trying to follow
	the player around instead of doing what they are told. The player also begins
	the scene in slicing mode, since Mission has a line about that not working.
	
	See also cp_tar05_ffend, cp_tar05_ffopen, cp_tar05_ffwalk, k_ptar_startconv.
	
	Issue #66: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/66
	
	DP 2020-06-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	NoClicksFor(2.0);
	
	SetGlobalFadeIn(0.1, 2.0);
	
	// If this is the forcefield opening scene.
	if (IsAvailableCreature(NPC_ZAALBAR))
		{
			object oMission = GetObjectByTag("mission", 0);
			object oCarth = GetObjectByTag("carth", 0);
			object oZaal = GetObjectByTag("zaalbar", 0);
			
			RemovePartyMember(NPC_MISSION);
			
			if (GetIsObjectValid(oZaal))
				{
					RemovePartyMember(NPC_ZAALBAR);
				}
				else if (GetIsObjectValid(oCarth))
					{
						RemovePartyMember(NPC_CARTH);
					}
			
			AssignCommand(GetFirstPC(), ActionPlayAnimation(ANIMATION_FIREFORGET_USE_COMPUTER));
		}
}
