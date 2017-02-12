void setup() {
  size(600, 600);
  translate(width/2, height/2);
  background(0);
  
  int pointCount = 8;
  int steps = 50;
  float outerRadius = width*0.5;
  float innerRadius = outerRadius*0.7;
  float shadeRatio = 255/steps;
  float rotationRatio = 45.0/steps;
  float outerRadiusRatio = outerRadius/steps;
  float innerRadiusRatio = innerRadius/steps;
  
  for(int i=0; i<steps; ++i) {
    stroke(255-shadeRatio*i, 100);
    fill(shadeRatio*i);
    pushMatrix();
    rotate(rotationRatio*i*PI/180);
    star(pointCount, outerRadius-outerRadiusRatio*i, innerRadius-innerRadiusRatio*i);
    popMatrix();
  }
}

void draw() {
}