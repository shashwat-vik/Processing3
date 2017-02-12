float gray[][];
int incr[][];
int cellSize;

void setup() {
  size(600, 600);
  background(0);
  //noStroke();
  colorMode(HSB);

  cellSize = 5;
  gray = new float[100][100];
  incr = new int[100][100];
  setArray();
}

void draw() {
  background(0);
  translate(100/2, 100/2);

  for(int y=0; y<gray.length; ++y) {
    for(int x=0; x<gray[0].length; ++x) {
      if(gray[x][y] > 255 || gray[x][y] < 0)
        incr[x][y] *= -1;
      gray[x][y] += incr[x][y];
      //fill(gray[x][y]);
      fill(gray[x][y], 255, 255);
      pushMatrix();
      translate(x*cellSize, y*cellSize);
      rect(0, 0, cellSize, cellSize);
      popMatrix();
    }
  }
}

void setArray() {
  float xSc, ySc, z;
  for(int y=0; y<gray.length; y++) {
    for(int x=0; x<gray[0].length; x++) {
      xSc = map(x, 0, gray[0].length-1, 0, TWO_PI);
      ySc = map(y, 0, gray.length-1, 0, TWO_PI);
      z = sin(ySc)*cos(xSc);
      gray[x][y] = map(z, -1.0, 1.0, 0.0, 255.0);
      incr[x][y] = 1;
    }
  }
}

int randInt(int low, int high) {
  int r = floor(random(low, high+1));
  r = constrain(r, low, high);
  return r;
}
