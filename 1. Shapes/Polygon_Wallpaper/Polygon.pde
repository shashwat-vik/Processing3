void polygon(int sideCount, float radius) {
  beginShape();
  
  float theta=0;
  float offset = TWO_PI/sideCount;
  for(int i=0; i<sideCount; ++i) {
    plot(radius, theta);
    theta += offset;
  }
  endShape(CLOSE);
}
void plot(float radius, float theta) {
  float x = radius*cos(theta);
  float y = radius*sin(theta);
  vertex(x, y);
}