int StartingConditional() {
	int int1 = ((GetGlobalNumber("K_SWG_BASTILA") >= 12) && (GetGlobalNumber("K_SWG_BASTILA") <= 13) && (GetGender(GetPCSpeaker()) == 0));
	return int1;
}

