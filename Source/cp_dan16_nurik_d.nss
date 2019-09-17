////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This is a replacement for Nurik's OnUserDefine script in the Sandral
	Estate (danm16), renamed to avoid TSLPatcher filename conflict dramas.
	It simply removes the command to destroy himself and moves it to another
	script, in order to alleviate the issue of him visibly fading out when
	Rahasia walks in.
	
	See also k_pdan_16_aread
	
	DP 2019-02-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	switch (GetUserDefinedEventNumber()) {
		case 10:
			ActionMoveToObject(GetObjectByTag("dan16_wp_nurik01", 0), 0, 1.0);
			ActionDoCommand(SignalEvent(GetObjectByTag("dan16_cutscene01", 0), EventUserDefined(0)));
			//ActionDoCommand(DestroyObject(OBJECT_SELF, 0.0, 0, 0.0));
			return;
	}
}
