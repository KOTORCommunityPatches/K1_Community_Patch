////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by tar10_kandon01.dlg in tar_m10aa (Taris Black Vulkar Base Upper).
	
	This forces Carth to face Kandon during his interjections in the pre-race
	conversation when siding with the Black Vulkars. For some reason the addition
	of Speaker/Listener tags in the DLG was insufficient to elicit the desired
	behaviour. Carth continued to face the player during his lines, so a more
	direct and forceful approach was required.
	
	Issue #17: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/17
	
	DP 2019-02-02  
	
////////////////////////////////////////////////////////////////////////////////
	
	Updated to make the script conditional on Carth being present, since it was
	desirable to move it from his specific nodes and fire it on the preceding
	line to avoid any visible realignments. The scene has been further adjusted
	with a forcible placement of the party, so Carth's facing sins are less
	egregious now.
	
	Issue #62: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/62
	
	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oCarth = GetObjectByTag("Carth");
	object oKandon = GetObjectByTag("KandonArk101");
	
    if(GetIsObjectValid(oCarth))
		{
			AssignCommand(oCarth, ClearAllActions());
			AssignCommand(oCarth, ActionDoCommand(SetCommandable(TRUE, oCarth)));
			DelayCommand(0.5, AssignCommand(oCarth, SetFacingPoint(GetPosition(oKandon))));
		}
}
