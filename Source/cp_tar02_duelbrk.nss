//////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch
	
	OnFailToOpen for tar02_arenadoor.utd in tar_m02ae (Taris Upper City Cantina).
	
	This is an added OnFailToOpen for the door in the dueling arena. Gives a bark
	when interacting with it to say it can't be opened.
	
	Issue #396: 
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/issues/396
	
	DP 2020-06-16																*/
//////////////////////////////////////////////////////////////////////////////////

void main() {
	
	BarkString(OBJECT_SELF, 22073);
}
