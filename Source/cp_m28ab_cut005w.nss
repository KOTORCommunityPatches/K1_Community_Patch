////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by m28ab_c01.dlg in manm28ab (Manaan Sea Floor).
	
	A simple delay script in order to pace the DLG progression according to the
	timing of the stunt animations for the scene.
	
	DP 2019-05-17                                                             */
////////////////////////////////////////////////////////////////////////////////

void main()
{
   ActionPauseConversation();
   DelayCommand(0.3, ActionResumeConversation());
}