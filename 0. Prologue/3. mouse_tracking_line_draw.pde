void setup()
{
  size(640, 640);
}
void draw()
{
  //background(255);
  PVector mouse = new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  fill(0);
  line(center.x, center.y, mouse.x, mouse.y);
}

class PVector
{
  float x, y;
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
}
