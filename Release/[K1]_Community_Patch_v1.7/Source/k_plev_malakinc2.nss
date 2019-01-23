void main() {
	SetGlobalNumber("Lev_MalakVision", (GetGlobalNumber("Lev_MalakVision") + 1));
	object oBastila = GetObjectByTag("bastila", 0);
	SetLockOrientationInDialog(oBastila, 1);
}