//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_calo082.dlg in tar_m08aa (Taris Davik's Estate).
	
	This script fires in the middle of Calo Nord's last stand after the showdown
	with him and Davik in the hangar. It runs any party member with 10m of him
	away so that they don't get hit by the falling debris in the subsequent shot.
	Now it also turns them back to face towards Calo.
	
	Updated 2023-12-06 to change the running of any melee party members from the
	default behaviour of running them all to the nearest single waypoint to instead
	running them back to their original starting point at the beginning of combat.
	
	See also k_ptar_calo_ud, k_ptar_calofade.
	
	Issue #368: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/368
	
	DP 2023-11-09 / DP 2023-12-06												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oPty;
	object oCalo = OBJECT_SELF;
	int nIdx = 0;
	int bResume = FALSE;
	location lLoc;
	
	while (nIdx < GetPartyMemberCount())
		{
			oPty = GetPartyMemberByIndex(nIdx);
			
			if (GetDistanceBetween(oPty, oCalo) < 10.0)
				{
					if (oPty == oPC)
							lLoc = Location(Vector(50.00,65.60,0.0), 0.0);
						else if (oPty == oPM1)
								lLoc = Location(Vector(49.32,67.35,0.0), 0.0);
							else if (oPty == oPM2)
									lLoc = Location(Vector(49.32,63.85,0.0), 0.0);
					
					SetCommandable(TRUE, oPty);
					AssignCommand(oPty, ClearAllActions());
					AssignCommand(oPty, ActionMoveToLocation(lLoc, TRUE));
					AssignCommand(oPty, ActionDoCommand(SetFacingPoint(GetPosition(oCalo))));
					AssignCommand(oPty, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
					
					bResume = TRUE;
				}
			
			nIdx++;
		}
	
	if (bResume)
		{
			ActionPauseConversation();
			ActionWait(3.0);
			ActionResumeConversation();
		}
}
