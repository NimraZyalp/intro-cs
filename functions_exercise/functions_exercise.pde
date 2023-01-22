int x = 0;

void setup() {
  size(400, 400);
  background(255, 255, 255);
}

void draw() {
  background(255, 255, 255);
  drawSquare(x);
  x += 5;
}

void drawSquare(int x) {
  fill(255, 0, 0);
  rect(x, 200, 50, 50);
}
