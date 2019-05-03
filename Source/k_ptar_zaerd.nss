////////////////////////////////////////////////////////////////////////////////
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

	DP 2019-05-01                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {

	object oPC = GetFirstPC();
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	object oGadon = GetObjectByTag("GadonThek112", 0);
	
	AssignCommand(oPC, DelayCommand(0.1, SetFacingPoint(GetPosition(oGadon))));
	AssignCommand(oPM1, DelayCommand(0.1, SetFacingPoint(GetPosition(oGadon))));
	AssignCommand(oPM2, DelayCommand(0.1, SetFacingPoint(GetPosition(oGadon))));
	AssignCommand(oGadon, ActionStartConversation(oPC, "", FALSE, CONVERSATION_TYPE_CINEMATIC, TRUE, "", "", "", "", "", "", FALSE));
}