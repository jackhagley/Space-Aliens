class Mutants {
  Invader [] collection;
  int w, h;

  Mutants(Invader stranger, float scalar, int w_, int h_, float x, float y) {
    this.w = w_;
    this.h = h_;
    collection = new Invader[w*h];

    for (int k = 0; k<collection.length; k++) {      
      int xx = k%w;
      int yy = (k-xx)/w;
      collection[k]=new Invader(stranger.size, stranger.scale/scalar, 150+xx*100, (yy*100)+500 );//ROUGH
    }
    update();
  }

  void display() {
    for (int k = 0; k<collection.length; k++) {
      int xx = k%w;
      int yy = (k-xx)/w;
      collection[k].display();
    }
  }//display

    void update() {
    for (int k = 0; k<collection.length; k++) {
      collection[k].run();
    }
  }

  void makeNewMutations() {
    for (int k = 0; k<collection.length; k++) {
      collection[k].mutate(invader.dna);
    }
  }

 

  void run() {
    update();
    display();
  }
}//MUTANTS
