void setup() {
  size(800, 800);
  background(255);
  
  float polyCount=3000;
  for(int i=0; i<polyCount; ++i) {
    pushMatrix();
    translate(random(width), random(height));
    rotate(random(TWO_PI));
    polygon(int(random(3,15)), random(2,20));
    popMatrix();
  }
}

void draw() {
}