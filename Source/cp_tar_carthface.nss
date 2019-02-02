////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This forces Carth to face Kandon during his interjections in the pre-race
	conversation when siding with the Black Vulkars. For some reason the addition
	of Speaker/Listener tags in the DLG was insufficient to elicit the desired
	behaviour. Carth continued to face the player during his lines, so a more
	direct and forceful approach was required.
	
	DP 2019-02-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oCarth = GetObjectByTag("Carth");
	object oKandon = GetObjectByTag("KandonArk101");
	
	AssignCommand(oCarth, ClearAllActions());
	AssignCommand(oCarth, ActionDoCommand(SetCommandable(TRUE, oCarth)));
	DelayCommand(0.2, AssignCommand(oCarth, SetFacingPoint(GetPosition(oKandon))));
}