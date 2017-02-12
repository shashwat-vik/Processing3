Mover[] movers = new Mover[10];

void setup(){
  size(760, 320);
  for(int i=0; i<movers.length; ++i)
    movers[i] = new Mover(random(1,5), 0, 0);
}

void draw() {
  background(255);

  PVector wind = new PVector(0.01, 0);
  for(int i=0; i<movers.length; ++i) {
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
