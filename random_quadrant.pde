float x;
float y;
int r = 0;
int g = 0;
int b = 0;
void setup(){
  size(600,600);
}

void draw(){
  x = (int) random(0, width);
  y = (int) random(0, height);
  
  if (x < 300 && y < 300){
    fill(255,0,0);
  }
   else if (x > 300 && y < 300){
    fill(0,255,0);
  }
  else if (x < 300 && y > 300){
    fill(255,255,0);
  }
  else if (x > 300 && y > 300){
    fill(52,60,350);
  }
  
  circle(x, y, 10);
}
