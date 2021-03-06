class Liquid
{
  float x, y, w, h;
  float c;
  Liquid(float x_, float y_, float w_, float h_, float c_) {
    x=x_; y=y_;
    w=w_; h=h_;
    c=c_;
  }
  
  void display() {
    noStroke();
    fill(200);
    rect(x, y, w, h);
  }
  boolean contains(Mover m) {
    if((m.position.x >= x && m.position.x < x+w) && (m.position.y >= y && m.position.y < y+h))
      return true;
    return false;
  }
  PVector drag(Mover m) {
    float speed = m.velocity.mag();
    float drag_magnitude = c*speed*speed;
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);
    dragForce.normalize();
    dragForce.mult(drag_magnitude);
    return dragForce;
  }
}