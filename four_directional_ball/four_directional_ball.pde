int x1 = 200;
int x2 = 1;

void setup(){
 size(400,400);
}

void draw(){
 background(250);
 ellipse(x1, 50, 40, 40);
 x1=x1+x2;
 if (x1>width-20 || x1<20){
   x2=-x2;
 }
}
