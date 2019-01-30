void main() {
	object oBastila = GetObjectByTag("bastila", 0);
	object oDarthmalak400 = GetObjectByTag("darthmalak400", 0);
	talent talSpell = TalentSpell(49);
	AssignCommand(oBastila, ActionUseTalentOnObject(talSpell, oDarthmalak400));
	DelayCommand(1.0, SetDialogPlaceableCamera(30));
	DelayCommand(0.05, PlaySound("cb_ls_hitsoft1"));
	DelayCommand(0.25, PlaySound("n_drth_mal_atk2"));
	ActionPauseConversation();
	ActionWait(1.75);
	ActionResumeConversation();
}
