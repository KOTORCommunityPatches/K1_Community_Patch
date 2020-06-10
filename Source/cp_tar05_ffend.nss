//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar05_ff_dlg2.dlg in tar_m05aa (Taris Lower Sewers)
	
	This script fires on the exit nodes of both branches of the cutscene. It unlocks
	the party's orientation, and adds Mission and Zaalbar/Carth back to the party
	for the post-jail break branch scene.
	
	See also cp_tar05_ffopen, cp_tar05_ffstart, cp_tar05_ffwalk, k_ptar_startconv.
	
	Issue #66: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/66
	
	DP 2020-06-09																*/
////////////////////////////////////////////////////////////////////////////////// 

void main() {
	
	object oPC = GetFirstPC();
	object oMission = GetObjectByTag("mission", 0);
	object oCarth = GetObjectByTag("carth", 0);
	object oZaal = GetObjectByTag("zaalbar", 0);
	
	SetLockOrientationInDialog(oPC, FALSE);
	
	SetLockOrientationInDialog(oMission, FALSE);
	
	// Establish who the remaining party member is.
	if (GetIsObjectValid(oZaal))
		{
			SetLockOrientationInDialog(oZaal, FALSE);
			
		}
		else if (GetIsObjectValid(oCarth))
			{
				SetLockOrientationInDialog(oCarth, FALSE);
				
			}
	
	// If exiting from the forcefield opening scene.
	if (IsAvailableCreature(NPC_ZAALBAR))
		{
			AddPartyMember(NPC_MISSION, GetObjectByTag("mission", 0));
			
			if (GetIsObjectValid(oZaal))
				{
					AddPartyMember(NPC_ZAALBAR, GetObjectByTag("zaalbar", 0));
				}
				else if (GetIsObjectValid(oCarth))
					{
						AddPartyMember(NPC_CARTH, GetObjectByTag("carth", 0));
					}
		}
}
