Attractor a;
Mover[] movers = new Mover[10];

void setup() {
  size(720, 360);
  
  a = new Attractor();
  for(int i=0; i<movers.length; ++i)
    movers[i] = new Mover(random(3,20), random(width), random(height));
}
void draw() {
  background(255);
  
  a.update();
  a.display();
  
  for(int i=0; i<movers.length; ++i) {
    PVector g_force = a.attract(movers[i]);
    movers[i].applyForce(g_force);
    movers[i].update();
    movers[i].display();
  }
  
}

void mousePressed(){
  a.clicked(mouseX, mouseY);
}
void mouseReleased() {
  a.stopDragging();
}