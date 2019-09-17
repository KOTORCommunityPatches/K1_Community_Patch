////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Dantooine Jedi Enclave).

	This script is fired at the end of the post-Star Map conversation. The
	vanilla script set a global, but this version additional has Vandar play
	an animation in order to cure a problem with him freezing once the DLG
	exited.
	
	See also k_pdan_vandar05, k_pdan_vandar06, and k_pdan_vandar08.

	Issue #104: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/104

	DP 2019-08-02                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oVandar = GetObjectByTag("dan13_vandar", 0);
	
	AssignCommand(oVandar, ClearAllActions());
	AssignCommand(oVandar, SetCommandable(TRUE, OBJECT_SELF));
	AssignCommand(oVandar, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE2, 1.0, 3.96667));
	
	if ((GetGlobalNumber("K_KOTOR_MASTER") < 15))
		{
			SetGlobalNumber("K_KOTOR_MASTER", 15);
		}
}
