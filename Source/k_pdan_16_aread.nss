////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This is an edit of the Sandral Estate's (danm16), OnUserDefine script to
	alleviate the issue of Nurik visibly fading out as Rahasia walks in. Now
	when Rahasia is spawned, Nurik is jumped to the other side of the module
	and then destroyed. This is masked by the fade to black.
	
	See also cp_dan16_nurik_d
	
	DP 2019-02-06                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	int int1 = GetUserDefinedEventNumber();
	switch (int1) {
		case 100:
			{
				object oDan16_rahasia = CreateObject(1, "dan16_rahasia", GetLocation(GetObjectByTag("dan16_wp_plotdoor01", 0)), 0);
				NoClicksFor(4.2);
				DelayCommand(4.0, SignalEvent(OBJECT_SELF, EventUserDefined(110)));
				//
				// Add jumping Nurik to the other side of the module (the back door entry waypoint) in order to mask him fading out when destroyed
				//
				AssignCommand(GetObjectByTag("dan16_nurik", 0), ActionJumpToLocation(GetLocation(GetObjectByTag("from14db", 0))));
				DelayCommand(0.2, DestroyObject(GetObjectByTag("dan16_nurik", 0), 0.0, 0, 0.0));
			}
			break;
		case 110:
			{
				object oDan16_door05 = GetObjectByTag("dan16_door05", 0);
				SetLocked(oDan16_door05, 1);
				AssignCommand(oDan16_door05, ActionCloseDoor(oDan16_door05));
			}
			break;
	}
}
