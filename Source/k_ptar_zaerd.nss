//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	Fired by tar11_zaerdra111.dlg in tar_m11aa (Taris Hidden Beks Base)

	This script is fired on the last node of Zaerdra's opening "Hold it right
	there" dialogue branch. The vanilla version of this script is completely
	empty. It's possible that Bioware originally intended to do what K1CP has
	done, possibly (given the name) it was intended to signal an event in her
	OnUserDefine, or perhaps it was some sort of cut content.
	
	Normally once this dialogue chain is completed, control is reverted to the
	player and dialogue with Gadon must be initiated manually. Because of the
	table in the way, the player will often try to run around behind Gadon to
	get close enough to initiate the conversation. To prevent this, this script
	initiates Gadon's dialogue right after Zaerdra's finishes, having previously
	jumped the party into a more desirable position (see k_ptar_zaeclg_en).
	
	Updated 2023-12-14 to switch to include functions and give Zaedra an anim to
	flush her, since she could be seen frozen after switching to Gadon's DLG.
	
	See also k_ptar_zaeclg_en.
	
	Issue #70: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/70

	DP 2019-05-01 / DP 2023-12-14												*/
//////////////////////////////////////////////////////////////////////////////////

#include "cp_inc_k1"

void main() {

	object oPC = GetFirstPC();
	object oPM1 = CP_GetPartyMember(1);
	object oPM2 = CP_GetPartyMember(2);
	object oGadon = GetObjectByTag("GadonThek112", 0);
	object oZaedra = OBJECT_SELF;
	
	CP_FaceNPC(oPC, oGadon);
	CP_FaceNPC(oPM1, oGadon);
	CP_FaceNPC(oPM2, oGadon);
	CP_FaceNPC(oZaedra, oPC);
	
	AssignCommand(oGadon, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE));
}
