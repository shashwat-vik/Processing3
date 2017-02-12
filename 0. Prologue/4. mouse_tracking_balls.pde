Mover mover;

void setup() {
  size(640, 360);
  mover = new Mover();
}
void draw() {
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}


class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acceleration = new PVector(-0.001, 0.01);
    topspeed = 5;
  }
  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    dir.normalize();
    dir.mult(0.5);
    acceleration = dir;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  void checkEdges() {
    if(location.x > width)
      location.x = 0;
    else if(location.x < 0)
      location.x = width;

    if(location.y > height)
      location.y = 0;
    else if(location.y < 0)
      location.y = height;
  }
  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16, 16);
  }
}

static class PVector {
  float x;
  float y;
  PVector(float x_, float y_) {
    x = x_;
    y = y_;
  }
  void add(PVector v) {
    x += v.x;
    y += v.y;
  }
  void mult(float n) {
    x *= n;
    y *= n;
  }
  void normalize() {
    float m = mag();
    mult(1.0/m);
  }
  float mag() {
    return sqrt(x*x + y*y);
  }
  void limit(float max) {
    if (mag() > max) {
      normalize();
      mult(max);
    }
  }
  static PVector sub(PVector a1, PVector a2) {
    PVector a3 = new PVector(a1.x - a2.x, a1.y - a2.y);
    return a3;
  }
  static PVector mult(PVector a1, float n) {
    PVector a1_new = new PVector(n*a1.x, n*a1.y);
    return a1_new;
  }
}
