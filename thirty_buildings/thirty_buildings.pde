void setup() {
  size(800, 600);
  background(255);
  noStroke();

  int numBuildings = 30;
  for (int i = 0; i < numBuildings; i++) {
    float xCenter = random(width);
    float yBottom = height;
    float buildingWidth = random(50, 150);
    int numWindows = int(random(1, 6));
    float buildingHeight = random(150, 350);

    drawBuilding(xCenter, yBottom, buildingWidth, buildingHeight, numWindows);
  }
}

void drawBuilding(float xCenter, float yBottom, float buildingWidth, float buildingHeight, int numWindows) {
  float buildingLeft = xCenter - buildingWidth / 2;
  float buildingTop = yBottom - buildingHeight;
  
  fill(200);
  rect(buildingLeft, buildingTop, buildingWidth, buildingHeight);
  
  // door
  float doorWidth = buildingWidth * 0.15;
  float doorHeight = buildingHeight * 0.1;
  float doorLeft = xCenter - doorWidth / 2;
  float doorTop = buildingTop + buildingHeight - doorHeight;
  fill(50);
  rect(doorLeft, doorTop, doorWidth, doorHeight);
  
  // windows
  float windowSpacing = buildingWidth / (numWindows + 1);
  float windowWidth = windowSpacing * 0.8;
  float windowHeight = windowWidth * 1.5;
  float windowTop = buildingTop + buildingHeight * 0.2;
  for (int i = 0; i < numWindows; i++) {
    float windowLeft = buildingLeft + windowSpacing * (i + 1) - windowWidth / 2;
    fill(255, 200);
    rect(windowLeft, windowTop, windowWidth, windowHeight);
    fill(0);
    ellipse(windowLeft + windowWidth * 0.5, windowTop + windowHeight * 0.5, windowWidth * 0.2, windowWidth * 0.2);
  }
}
