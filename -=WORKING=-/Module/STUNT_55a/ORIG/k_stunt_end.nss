// Prototypes
void sub1();

void sub1() {
	StartCreditSequence(0);
	SetGlobalBoolean("CREDITPLAY", 1);
}

void main() {
	SetGlobalFadeOut(0.0, 0.0, 0.0, 0.0, 0.0);
	QueueMovie("55", 1);
	PlayMovieQueue(1);
	AssignCommand(GetFirstPC(), DelayCommand(0.049999997, sub1()));
}

