void main(){
if(GetJournalEntry("man_merc") > 0){
AddJournalQuestEntry("man_merc",19);
}
if(GetJournalEntry("man_missing") > 0 && GetJournalEntry("man_missing") < 40){
AddJournalQuestEntry("man_missing",50);
}
if(GetJournalEntry("Man26ab_swoopraces") > 0){
AddJournalQuestEntry("Man26ab_swoopraces",75);
}
if(GetJournalEntry("Genoharadan") > 0){
AddJournalQuestEntry("Genoharadan",40);
}
if(GetJournalEntry("Geno_Ithorak") > 0){
AddJournalQuestEntry("Geno_Ithorak",98);
}
if(GetJournalEntry("Geno_Lorgal") > 0){
AddJournalQuestEntry("Geno_Lorgal",97);
}
if(GetJournalEntry("Geno_Rulan") > 0){
AddJournalQuestEntry("Geno_Rulan",98);
}
if(GetJournalEntry("Geno_Vorn") > 0){
AddJournalQuestEntry("Geno_Vorn",98);
}
if(GetJournalEntry("Geno_Zuulan") > 0){
AddJournalQuestEntry("Geno_Zuulan",97);
}
if(GetJournalEntry("man_murder") > 0){
AddJournalQuestEntry("man_murder",45);
}
RemoveJournalQuestEntry("man_sunry");
RemoveJournalQuestEntry("man_elora");
RemoveJournalQuestEntry("man_gluupor");
RemoveJournalQuestEntry("man_ignus");
RemoveJournalQuestEntry("man_firith");
}