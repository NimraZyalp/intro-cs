float manX = 100;  // x-coordinate of man
float manY = 250;  // y-coordinate of man
int numRainDrops = 100;  // number of raindrops
float[] rainX = new float[numRainDrops];   // x-coordinates of raindrops
float[] rainY = new fl oat[numRainDrops];   // y-coordinates of raindrops
boolean lightningStruck = false;  // flag to track whether lightning has struck

void setup() {
  size(400, 400);
  // initialize raindrop starting positions
  for (int i = 0; i < numRainDrops; i++) {
    rainX[i] = random(0, 400);
    rainY[i] = random(-400, 0);
  }
}

void draw() {
  background(135, 206, 235);  // sky blue color
  fill(0, 255, 0);  // green color
  rect(0, 300, 400, 100);  // draw ground

  // draw man
  fill(255, 255, 255);  // white color
  ellipse(manX, manY, 30, 30);  // head
  line(manX, manY+15, manX, manY+50);  // body
  line(manX, manY+30, manX-15, manY+15);  // left arm
  line(manX, manY+30, manX+15, manY+15);  // right arm
  line(manX, manY+50, manX-10, manY+65);  // left leg
  line(manX, manY+50, manX+10, manY+65);  // right leg

  // draw clouds
  fill(255, 255, 255);  // white color
  ellipse(100, 75, 50, 50);
  ellipse(150, 75, 50, 50);
  ellipse(130, 65, 50, 50);

  ellipse(300, 100, 50, 50);
  ellipse(350, 100, 50, 50);
  ellipse(330, 90, 50, 50);

  // draw raindrops
  stroke(0, 0, 255);  // blue color
  strokeWeight(2);
  for (int i = 0; i < numRainDrops; i++) {
    if (rainY[i] < 300) {  // raindrop has not reached ground
      line(rainX[i], rainY[i], rainX[i]+5, rainY[i]+10);
      rainY[i] += 5;
    } else {  // raindrop has reached ground
      rainY[i] = random(-400, 0);  // reset raindrop's position
    }
  }
  
  // check if mouse has been clicked
  if (mousePressed) {
    // choose random start and end positions for lightning bolt
    float startX = random(0, 400);
    float startY = 0;
    float endX = random(0, 400);
    float endY = 400;

    stroke(255, 255, 0);  // yellow color
    strokeWeight(5);      // thickness of lightning
    line(startX, startY, endX, endY);  // draw lightning bolt
    lightningStruck = true;  // set flag to true
    }
}
