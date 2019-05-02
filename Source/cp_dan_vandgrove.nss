////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Jedi Enclave).

	This script, in conjunction with cp_dan_traindone, adds a cutscene intro
	when approaching the Council after having told Zhar you dealt with Juhani.
	This revised version has now moved all of the party herding elements out
	to cp_dan_traindone, so this script only handles the camera setup and
	dialogue pause.

	DP 2019-05-02                                                             */
////////////////////////////////////////////////////////////////////////////////


void main() {

	object oVandar = GetObjectByTag("dan13_vandar", 0);

    if(GetLocalBoolean(oVandar, 53) == FALSE && GetGlobalNumber("DAN_JEDI_PLOT") == 7)
    {
		SetLocalBoolean(oVandar, 53, TRUE);
		ActionPauseConversation();
		ActionWait(6.0);
		ActionResumeConversation();
		DelayCommand(0.1, SetDialogPlaceableCamera(37));
	}
}