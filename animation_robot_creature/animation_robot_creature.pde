int diam = 65;
int dir = 1;
int sunX = 0;

void setup() {
  size(800, 800);
}

void draw() {
  background(0,0,255);
  
  // left leg
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(350, 615, 30, 150);
  
  // right leg
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(420, 620, 30, 150);
  
  // left foot
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  ellipse(359, 773, 45, 30);
  
  // right foot
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  ellipse(443, 775, 45, 30);
  
  //left arm
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(317, 435, 30, 140);

  //right arm
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(450, 435, 30, 140);

  //actual torso
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  rect(350, 425, 100, 200);

  //head code
  fill(#698362);
  stroke(#5C6F98);
  strokeWeight(3);
  ellipse(400, 275, 250, 300);

  //eyes are in these bottom lines
  // left eye
  fill(#000000);
  stroke(255);
  strokeWeight(5);
  circle(345, 325, 90);

  // left pupil
  fill(#ff0000 );
  stroke(#ff0000 );
  strokeWeight(5);
  circle(345, 325, diam);

  //right eye
  fill(#000000);
  stroke(255);
  strokeWeight(5);
  circle(455, 325, 90);

  //right pupil
  fill(#ff0000 );
  stroke(#ff0000 );
  strokeWeight(5);
  circle(455, 325, diam);
  
  // Animate the pupils by changing their size
  diam += dir;
  if (diam > 90) {
    dir = -1;
  } else if (diam < 65) {
    dir = 1;
  }
  
  // Draw the sun
  fill(#FFFF00);
  noStroke();
  circle(sunX, 50, 50);
  
  // Animate the sun by moving it horizontally
  sunX += 5;
  if (sunX > width) {
    sunX = 0;
  }
}
