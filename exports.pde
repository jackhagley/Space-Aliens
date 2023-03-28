void keyPressed() {
  switch(key) {
  case 'e':
    exportFrame();
      break;
      
      case 'g':
      invader.generate();
      mutants.makeNewMutations();
      break;
      
      case'1':
      invader.makeWithDNA(new DNA(mutants.collection[1].dna,mutants.collection[2].dna));
      break;
      
  }//switch
}//keypressed

void exportFrame() {
  save(year()+nf(month(), 2)+nf(day(), 2)+nf(hour(), 2)+nf(minute(), 2)+nf(second(), 4)+frameCount+".png");
}
