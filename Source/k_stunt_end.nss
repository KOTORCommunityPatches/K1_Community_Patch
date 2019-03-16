////////////////////////////////////////////////////////////////////////////////
/*	KOTOR Community Patch

	This script is fired at the end of the final cutscene for the Dark Side
	ending to play the pre-credits movie. For some reason, the filename (of
	all things) of this movie resulted in the credits not being scaled to
	the full screen resolution. Simply changing the filename of the movie
	resolves the issue, but that required a script edit in order to play it.
	
	Why the filename causes such a problem is beyond human comprehension. 
	
	DP 2019-03-17                                                             */
////////////////////////////////////////////////////////////////////////////////
void sub1();

void sub1() {
	StartCreditSequence(0);
	SetGlobalBoolean("CREDITPLAY", 1);
}

void main() {
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	QueueMovie("DSEnd", 1);
	PlayMovieQueue(1);
	AssignCommand(GetFirstPC(), DelayCommand(0.049999997, sub1()));
}