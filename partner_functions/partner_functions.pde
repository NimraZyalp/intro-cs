void setup () {
  size(600,600); 
  background(0);
}

void draw() {
  noStroke();
 moon();
  fill(145, 200, 100);
 star();
  
  translate(300, 50);
  star();
  
   translate(50, 200);
   star();
}

void star() {
  beginShape();
  vertex(170,80); //highest 
  vertex(250, 300);
   vertex(70, 160);
   vertex(300, 160);
  vertex(130, 300);
  endShape(); 
}

void moon(){
  fill(211,211,211);
  circle(300,100,100);
  fill(128,128,128);
  circle(300,80,10);
  circle(270,100,10);
  circle(330, 120, 10);
  circle(290, 125, 10);
  circle(300,100,10);
  circle(330,90,10);
}

void mousePressed() {
  println("coordinates are: "
  + mouseX + ","
  + mouseY);
  circle(mouseX, mouseY, 30);
}
