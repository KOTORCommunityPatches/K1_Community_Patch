////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Originally created by JC for DP's mod "Handon's Enhanced Waistline".
	
	Original JC notes: Edited to set Handon's wounded animation flag to true
	when he's done moving.
	
	Fired by dan14_bolook.dlg on Entry 195 in danm14ac (Grove)
	
	This script is fired during the intro of the Murder Mystery quest, moving
	the characters after they were spawned in a few nodes earlier. As per JC's
	original notes, the edited version now forces Handon to perform the injured
	idle animation when finished.
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////

void JC_HANDON_WOUND() {

	AssignCommand(OBJECT_SELF, ActionPlayAnimation(28, 1.0, 6.0));
	SetLocalBoolean(OBJECT_SELF, 51, TRUE);
}


void main()
{
   // SetGlobalFadeIn(0.0,2.0);
    AssignCommand(GetObjectByTag("dan14_bolook"),ActionMoveToObject(GetObjectByTag("POST_dan14_bolook01")));
    AssignCommand(GetObjectByTag("dan14_handon"),ActionMoveToObject(GetObjectByTag("POST_dan14_handon01")));
    AssignCommand(GetObjectByTag("dan14_idroid"),ActionMoveToObject(GetObjectByTag("POST_dan14_idroid01")));
    AssignCommand(GetObjectByTag("dan14_rickard"),ActionMoveToObject(GetObjectByTag("POST_dan14_rickard01")));

	AssignCommand(GetObjectByTag("dan14_handon"), ActionDoCommand(JC_HANDON_WOUND()));
}
