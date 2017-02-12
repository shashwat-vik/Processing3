void star(int pointCount, float innerRadius, float outerRadius) {
  float x;
  float y;
  float theta = 0.0;
  float thetaRot = TWO_PI/(2*pointCount);
  float tempRadius;
  beginShape();
  for(int i=0; i<2*pointCount; ++i) {
    tempRadius = outerRadius;
    if(i%2 != 0)
      tempRadius = innerRadius;
    x = tempRadius*sin(theta);
    y = tempRadius*cos(theta);
    vertex(x,y);
    theta += thetaRot;
  }
  endShape(CLOSE);
}