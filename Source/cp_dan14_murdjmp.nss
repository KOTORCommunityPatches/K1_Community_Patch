//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	Fired by dan14_bolook.dlg/dan14_handon.dlg/dan14_idroid.dlg/dan14_rickard.dlg
	in danm14ac (Dantooine Grove)
	
	This added script fires on the starting nodes for all conversations during
	the murder mystery quest once the investigation begins. It jumps the party
	into position to avoid companion pathfinding freaking out due to the close
	proximity of all the NPCs to each other.
	
	Issue #110: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/110
	
	DP 2023-12-12																*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {
	
	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oFace = OBJECT_SELF;
	string sTag;
	location lPC;
	location lPM1;
	location lPM2;
	
	SetGlobalFadeOut();
	SetGlobalFadeIn(0.75, 1.0);
	
	sTag = GetTag(OBJECT_SELF);
	
	if (sTag == "dan14_bolook")
		{
			lPC = Location(Vector(317.13,423.74,61.24), 253.51);
			lPM1 = Location(Vector(318.56,425.06,61.24), 253.51);
			lPM2 = Location(Vector(316.65,425.63,61.36), 253.51);
		}
		else if (sTag == "dan14_handon")
			{
				lPC = Location(Vector(319.22,423.91,61.26), -45.79);
				lPM1 = Location(Vector(318.76,425.81,61.26), -45.79);
				lPM2 = Location(Vector(317.33,424.41,61.26), -45.79);
			}
			else if (sTag == "dan14_rickard")
				{
					lPC = Location(Vector(316.17,425.90,61.41), 157.16);
					lPM1 = Location(Vector(317.33,424.33,61.25), 157.16);
					lPM2 = Location(Vector(318.11,426.17,61.35), 157.16);
				}
				else if (sTag == "dan14_idroid")
					{
						lPC = Location(Vector(319.51,425.83,61.25), 37.06);
						lPM1 = Location(Vector(317.57,425.61,61.29), 37.06);
						lPM2 = Location(Vector(318.77,424.02,61.18), 37.06);
					}
	
	CP_PartyHerder(lPC, lPM1, lPM2);
	
	DelayCommand(0.2, CP_FaceNPC(oPC, oFace));
	DelayCommand(0.2, CP_FaceNPC(oPM1, oFace));
	DelayCommand(0.2, CP_FaceNPC(oPM2, oFace));
	DelayCommand(0.2, CP_FaceNPC(OBJECT_SELF, oPC));
}
