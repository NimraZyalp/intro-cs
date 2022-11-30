int x = 200;
int y = 200;
int color_1 = 0;
int color_2 = 0;
int color_3 = 0;
float dir_x = 6;
float dir_y = 4;
int colors = 0;
void setup() {
  size(600, 600);
}

void draw() {
  background(color_1, color_2, color_3);
  circle(x, y, 20);
 
  x += dir_x;
  if (x>=580 || x<=20)  {
    dir_x *= -1;
    colors += 1;
  }
  y += dir_y;
  if (y>=580 || y<=20)  {
    dir_y *= -1;
    colors += 1;
  }
  if (colors%4 == 0) {
    color_1 = 0;
    color_2 = 0;
    color_3 = 0;
  }
  if (colors%4 == 1) {
    color_1 = 0;
    color_2 = 230;
    color_3 = 0;
  }
  if (colors%4 == 2) {
    color_1 = 0;
    color_2 = 0;
    color_3 = 250;
  }
  if (colors%4 == 3) {
    color_1 = 150;
    color_2 = 0;
    color_3 = 150;
  }
}
