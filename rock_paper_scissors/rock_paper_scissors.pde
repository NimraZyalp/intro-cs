int x = 0;
float y = 0;
boolean win = true;
boolean tie = true;
int wins = 0;
int losses = 0;
void setup() {
  size(500, 500);
  text(0, 0, 0);
  text("Press 'x' for rock, '2' for paper and '3' for scissors", 100, 100);
}
void keyPressed(){
if (keyCode == 49) {
   x = 1;
} 
if (keyCode == 50) {
   x = 2;
} 
if (keyCode == 51) {
   x = 3;
}
y = floor(random(1,4));
if (win && !tie){
  wins +=1;
} else if (!win && !tie) {
  losses += 1;
} else {
}
}
void draw() {
  background(0);
    text("Press 'x' for rock, '2' for paper and '3' for scissors", 100, 100);
if (x == y) {
  win = false;
  tie = true;
text("you tied", 250, 250);
} else if (x == 1 && y == 2) {
  win = false;
  tie = false;
text("loss", 250, 250);
} else if (x == 2 && y == 3) {
    win = false;
      tie = false;
text("loss", 250, 250);
} else if (x == 3 && y == 1) {
    win = false;
      tie = false;
text("loss", 250, 250);
} else {
  win = true;
    tie = false;
text ("win", 250, 250);
}
if(x == 1) {
text("You choose rock.", 300, 200);
}
if(x == 2) {
text("You choose paper.", 300, 200);
}
if(x == 3) {
text("You choose scissors.", 300, 200);
}
if(y == 1) {
text("CPU chose rock.", 100, 200);
}
if(y == 2) {
text("CPU chose paper.", 100, 200);
}
if(y == 3) {
text("CPU chose scissors.", 100, 200);
}


text("Score", 250, 400);
text("Wins "+ wins, 200, 450);
text("Losses "+ losses, 300, 450);
}
