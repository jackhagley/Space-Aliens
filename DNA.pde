class DNA {
  
  /* 
  
  DNA stores int values
  The length of the value in characters
  is determined by geneLength
  
  */
  
  //Code
  int[] genes;
  
  //Number of genes
  int geneNumber;

  //how many decimal places
  int geneLength;

  //maximum - used to generate ints
  int dnaMax = MAX_INT;
  
  //Spontaneous method
  DNA(int geneNumber_, int geneLength_) {
    this.geneNumber=geneNumber_;
    genes = new int[geneNumber];
    this.geneLength = geneLength_;
  }
  
  //Breeding method
  DNA(DNA mother, DNA father) {
    genes=new int [mother.geneNumber];
    this.geneLength = mother.geneLength;

    for (int i = 0; i<geneNumber; i++) {
      float r = random(1);
      if (r<.5) {
        genes[i]=father.genes[i];
      } else {
        genes[i]=mother.genes[i];
      }
    }
  }
  
  //Cloning method: agamogenesis
  DNA(DNA stranger){
    this.geneNumber=stranger.geneNumber;
    genes=new int [geneNumber];
    this.geneLength = stranger.geneLength;
    
    
  }

  int extractDNA(int dnaIndex, int geneIndex, int snippetSize) {
    if (snippetSize+geneIndex<=geneLength+1) {
      String temp = Integer.toString(genes[dnaIndex]);
      temp = temp.substring(geneIndex, geneIndex+snippetSize);
      println(temp);//debug
      println(temp.length());
      return parseInt(temp);//debug
    } else {
      return -1;
    }
  }

  void clone(DNA stranger) {
    for (int i = 0; i<geneNumber; i++) {
      genes[i]=stranger.genes[i];
    }
  }

  boolean isLessThan(int index, int value) {
    if (genes[index]<value) {
      return true;
    } else {
      return false;
    }
  }

  boolean isMoreThan(int index, int value) {
    if (genes[index]>value) {
      return true;
    } else {
      return false;
    }
  }

  int shortenGene(int g) {
    ///THIS ISN’T WORKING!!!
    String temp = nf(g, geneLength, 0);
    g = Integer.parseInt(temp);
    return g;
  }

  int generateRandomIndex() {
    return int(random(geneNumber));
  }

  void generateRandom() {
    for (int i=0; i<geneNumber; i++) {
      makeOneRandomGene(i);
    }
  }

  void makeOneRandomGene(int index) {
    genes[index]=shortenGene(int(random(dnaMax)));
  }

  int getDNA(int index) {
    return genes[index];
  }

  void setDNA(int index, int value) {
    genes[index]=shortenGene(value);
  }
}//DNA Class
