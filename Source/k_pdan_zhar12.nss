////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_zhar.dlg on Entry 102 in danm13 (Jedi Enclave).
	
	This an edit of the script that fires right after the conclusion of the
	training montage. It handles firing another script (k_pdan_player18) to
	jump the player to Zhar and the fade in for the post-montage conversation.
	
	It now also tries to get Zhar pointing in the right	direction to properly
	face the PC instead of looking off to the side, since attempts to do so
	before the conversation failed to work. This approach is still not perfect.
	He has a bit of waddle at the start of the conversation to align himself,
	which has been masked by extending the fade-in a bit longer than is ideal.
	
	Addition of the Pause animation command provided by JC to alleviate an
	issue where Zhar was left frozen post-conversation.
	
	DP 2019-04-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
    object oZhar = GetObjectByTag("dan13_zhar", 0);
    object oPCWP = GetObjectByTag("dan13_WP_PC02", 0);
    
    SetGlobalFadeIn(1.0, 0.5);
	ExecuteScript("k_pdan_player18", GetFirstPC(), 0xFFFFFFFF);
	AssignCommand(oZhar, SetFacingPoint(GetPosition(oPCWP)));
	DelayCommand(0.1, AssignCommand(oZhar, ActionDoCommand(ActionPlayAnimation(ANIMATION_LOOPING_PAUSE, 1.0, 0.5))));
}