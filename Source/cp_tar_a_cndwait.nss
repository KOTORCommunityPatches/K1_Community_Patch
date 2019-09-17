////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	cp_tar_a_cndwait
	
	Fires when you talk to Canderous after retrieving the Sith codes. Used to
	check if you've had this conversation before, so he won't repeat dialogue
	if you make him wait while you go do other stuff.
	
	Issue #73: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/73
	
	JC 2019-02-27                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oCand = GetObjectByTag("Canderous031", 0);
	SetLocalBoolean(oCand, 49, TRUE);
}
