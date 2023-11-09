//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar08_calo082.dlg in tar_m08aa (Taris Davik's Estate).
	
	This script fires in the middle of Calo Nord's last stand after the showdown
	with him and Davik in the hangar. It runs any party member with 10m of him
	away so that they don't get hit by the falling debris in the subsequent shot.
	Now it also turns them back to face towards Calo.
	
	See also k_ptar_calo_ud.
	
	Issue #368: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/368
	
	DP 2023-11-09																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oCalo = OBJECT_SELF;
	object oPM;
	object oWP;
	int nIdx;
	int bResume = FALSE;
	
	nIdx = 0;
	
	while (nIdx < GetPartyMemberCount())
		{
			oPM = GetPartyMemberByIndex(nIdx);
			
			if (GetDistanceBetween(oPM, oCalo) < 10.0)
				{
					oWP = GetNearestObjectByTag("tar08_wpflee", oPM, 1);
					
					SetCommandable(TRUE, oPM);
					AssignCommand(oPM, ClearAllActions());
					AssignCommand(oPM, ActionMoveToLocation(GetLocation(oWP), TRUE));
					AssignCommand(oPM, ActionDoCommand(SetFacingPoint(GetPosition(oCalo))));
					AssignCommand(oPM, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.1));
					
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
