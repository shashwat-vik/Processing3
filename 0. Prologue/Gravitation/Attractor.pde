class Attractor
{
  float mass;
  float G;
  PVector position;
  boolean rollOver = false;                    // hover animation
  boolean dragging = false;                    // flagging Attractor as being dragged
  PVector dragOffset = new PVector(0, 0);
  
  Attractor() {
    mass = 30;
    G = 1;
    position = new PVector(width/2, height/2);
  }
  
  void display() {
    stroke(0);
    strokeWeight(4);
    
    if(dragging)
      fill(50);
    else if(rollOver)
      fill(100);
    else
      fill(150);
    ellipse(position.x, position.y, mass*2, mass*2);
  }
  
  void update() {
    hoverAnimation(mouseX, mouseY);
    drag();
  }
  
  PVector attract(Mover m) {
    PVector dir = PVector.sub(position, m.position);
    float dist = dir.mag();
    dist = constrain(dist, 5.0, 25.0);
    float mag = (G*mass*m.mass)/(dist*dist);
    println(mag);
    dir.normalize();
    dir.mult(mag);
    return dir;
  }
  
  void hoverAnimation(float mx, float my) {
    float distance = dist(mx, my, position.x, position.y);
    if(distance < mass)
      rollOver = true;
    else
      rollOver = false;
    
  }
  
  void clicked(float mx, float my) {
    float distance = dist(mx, my, position.x, position.y);
    if(distance < mass) {
      dragging = true;
      dragOffset.x = mx - position.x;
      dragOffset.y = my - position.y;
    }
    
  }
  
  void drag() {
    if(dragging) {
      position.x = mouseX+dragOffset.x;
      position.y = mouseY+dragOffset.y;
    }
  }
  
  void stopDragging() {
    dragging = false;
  }
}