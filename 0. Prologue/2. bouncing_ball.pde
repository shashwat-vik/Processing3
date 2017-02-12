PVector location;
PVector velocity;

void setup()
{
  size(640, 320);
  location = new PVector(100, 100);
  velocity = new PVector(2.5, 5);
}
void draw()
{
  background(255);

  location.add(velocity);
  if ((location.x > width) || (location.x < 0))
    velocity.x *= -1;
  if ((location.y > height) || (location.y < 0))
    velocity.y *= -1;

  stroke(0);
  fill(175);
  ellipse(location.x, location.y, 20, 20);
}

class PVector
{
  float x, y;
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void add(PVector v) {
    x += v.x;
    y += v.y;
  }
}
