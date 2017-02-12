class Mover
{
  float mass;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void display() {
    stroke(0);
    strokeWeight(1);
    
    fill(200);
    ellipse(position.x, position.y, mass*2, mass*2);
  }
  
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector f) {
    f.div(mass);
    acceleration.add(f);
  }
}