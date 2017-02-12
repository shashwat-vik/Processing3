void setup() {
  size(600, 600);
  PImage img = loadImage("pretty.png");
  for(int y=0; y<img.height; y++) {
    for(int x=0; x<img.width; x++) {
      color c = img.get(x, y);
      set(x, y, color(255-red(c), 255-blue(c), 255-green(c)));
    }
  }
}

void draw() {
}
