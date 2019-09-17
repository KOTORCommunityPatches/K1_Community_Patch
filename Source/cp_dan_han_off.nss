////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Originally created by JC for DP's mod "Handon's Enhanced Waistline".
	
	Original JC notes: Script to turn Handon's wounded animation flag off.
	
	Fired by dan14_bolook.dlg on Replies 71 and 87 in danm14ac (Grove)
	
	This is a utility script to turn off Handon's injured idle animation
	during the ending where he is accused and Rickard is allowed to leave.
	This is to prevent the TALK_FORCEFUL animations specified by the DLG
	for Handon's subsequent lines being overridden.
	
	Issue #38: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/38
	
	DP 2019-02-19                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	object oHandon = GetObjectByTag("dan14_handon", 0);

	AssignCommand(oHandon, SetLocalBoolean(OBJECT_SELF, 51, FALSE));
	AssignCommand(oHandon, ClearAllActions());
}
