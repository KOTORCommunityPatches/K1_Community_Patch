//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnOpen for cp_tar10_vulmec1.utd/cp_tar10_vulmec2.utd/cp_tar10_vulmec3.utd in
	tar_m10ac (Taris Black Vulkar Base Lower/Garage).
	
	This is the OnOpen for some added doors in the Black Vulkar Base's garage.
	They replace the generic doors used for the three rooms with mechanics that
	spawn in unarmed and performing an animation, pantomiming working on swoops.
	Since the added perception events to get them to turn hostile were not firing
	reliably, they now get signalled by the door to their room opening. Since the
	door can be opened remotely via slicing a terminal, it signals a slightly
	different event than the existing psuedo-shout event, flushing the computer
	use animation they perform when spawning in.
	
	See also k_ptar_mech01_ud.
	
	Issue #240: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/240
	
	DP 2023-12-11																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	string sTag = GetTag(OBJECT_SELF);
	object oTarget1, oTarget2;
	
	if (sTag == "cp_tar10_vulmec1")
		{
			oTarget1 = GetObjectByTag("tar10_vulkgang");
			oTarget2 = GetObjectByTag("cp_tar10_vulkd02");
		}
		else if (sTag == "cp_tar10_vulmec2")
			{
				oTarget1 = GetObjectByTag("tar10_vulkgan001");
				oTarget2 = OBJECT_INVALID;
			}
			else if (sTag == "cp_tar10_vulmec3")
				{
					oTarget1 = GetObjectByTag("cp_tar10_vulkg02");
					oTarget2 = GetObjectByTag("cp_tar10_vulkg03");
				}
	
	SignalEvent(oTarget1, EventUserDefined(888));
	SignalEvent(oTarget2, EventUserDefined(888));
}
