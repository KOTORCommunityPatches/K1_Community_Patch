////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar02_spawncand.utt in tar_m02ae (Taris Upper City Cantina).

	This is the trigger OnEnter script that spawns Canderous in the cantina
	after the swoop race. It was necessary to change the rotation on his
	spawn location, since he was refusing to obey any facing commands prior
	to or during the subsequent conversation.
	
	See also k_ptar_candtlk, cp_tar_pcfacecan.
	
	Issue #75: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/75

	DP 2019-09-28                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oEntering = GetEnteringObject();
	object oCand;
	location lCand_WP = Location(Vector(117.272,105.348,0.0), 73.0);
	
	if (!GetGlobalBoolean("TAR_CANDSPAWN") && GetGlobalBoolean("Tar_SwoopRace") && GetIsPC(oEntering))
		{
			SetGlobalBoolean("TAR_CANDSPAWN", TRUE);
			oCand = CreateObject(OBJECT_TYPE_CREATURE, "tar03_cander031", lCand_WP);
		}
}
