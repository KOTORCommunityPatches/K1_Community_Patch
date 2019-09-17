////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by dan13_vandar.dlg in danm13 (Jedi Enclave).
	
	This script is intended to be fired during the post-Juhani conversation
	with the Council. It signals the spawn event in Ahlan Matale's OnUserDefine.
	Due to alterations to Vandar's DLG, activation of this script was moved to
	a later node where it could potentially be unintentionally fired on
	subsequent occasions out of sequence, so a conditional has been added to
	prevent this.
	
	Issue #55: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/55
	
	DP 2019-04-29                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

    if (GetGlobalNumber("DAN_ROMANCE_PLOT") < 1 )
		{
		
			SignalEvent(GetObjectByTag("dan13_ahlan", 0), EventUserDefined(10));
		}
}
