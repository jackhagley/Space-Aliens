class Invader {

  //grid size
  int size;
  int halfsize;

  //display variables
  float scale; 
  float x;
  float y;
  color COLOUR;

  //DNA
  //boolean [] dna;
  DNA dna;

  //Button stuff
  boolean isHover;
  //boolean isClicked;

  Invader(int size_, float scale_, float x_, float y_) {
    this.size = size_;
    this.scale = scale_;
    this.x = x_;
    this.y = y_;
    halfsize = int(size/2);
    dna = new DNA(size*halfsize, 16);
    generate();
    COLOUR = (#000000);
  }//new

  Invader(DNA stranger) { 
    dna.clone(stranger);
  }
  
  void makeWithDNA(DNA stranger){
    dna.clone(stranger);
  }

  void generate() {
    dna.generateRandom();
  }

  void display() {
    rectMode(RADIUS);
    stroke(COLOUR);
    strokeWeight(scale);

    for (int k = 0; k<dna.geneNumber; k++) {
      int xx = k%halfsize;
      int yy = (k-xx)/halfsize;
      if (dna.getDNA(k)>dna.dnaMax/2) {
        point(x+(xx*scale), y+(yy*scale));
        point(1+x-(xx*scale), y+(yy*scale));
      }
    }
  }

  void update() {
    if (
    mouseX<x+(halfsize*scale)
      &&
      mouseX>x-(halfsize*scale)
      &&
      mouseY<y+(size*scale)
      &&
      mouseY>y

      ) {
      isHover=true;
    } else {
      isHover=false;
    }

    if (isHover) {
      COLOUR = #FFFFFF;
    } else {
      COLOUR = #000000;
    }
  }

  void run() {
    update();
    display();
  }


  void mutate(DNA master) {
    for (int k = 0; k<dna.geneNumber; k++) {
      dna.setDNA(k, master.getDNA(k));
      float r = random(1);
      if (r<0.1) {
        dna.makeOneRandomGene(k);
      }
    }
  }//mutate

  void generateColour() {

    int r = dna.extractDNA(1, 1, 3);
    int g = dna.extractDNA(2, 1, 3);
    int b = dna.extractDNA(3, 1, 3);

    COLOUR = color(r, g, b);
  }
}//INVADERS MUST DIE
