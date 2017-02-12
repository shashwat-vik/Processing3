void setup() {
  size(600, 600);
  PImage img = loadImage("pretty.png");
  int resolution=100;
  int xInc = width/resolution;
  int yInc = height/resolution;
  for(int y=0; y<img.height; y+=yInc) {
    for(int x=0; x<img.width; x+=xInc) {
      fill(img.get(x, y));
      rect(x, y, xInc, yInc); 
    }
  }
}

void draw() {
}