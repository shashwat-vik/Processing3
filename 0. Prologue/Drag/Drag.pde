Mover[] movers = new Mover[10];
Liquid liquid;

void setup(){
  size(640, 360);

  liquid = new Liquid(0, height/2, width, height/2, 0.4);
  for(int i=0; i<movers.length; ++i)
    movers[i] = new Mover(random(1,5), (i+1)*width/(movers.length+1), 0);
}

void draw() {
  background(255);

  liquid.display();
  for(int i=0; i<movers.length; ++i) {
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    
    if(liquid.contains(movers[i])) {
      PVector dragForce = liquid.drag(movers[i]);
      movers[i].applyForce(dragForce);
    }
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}