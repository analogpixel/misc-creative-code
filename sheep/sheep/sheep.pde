PImage back;
PImage sheep;
PImage sheepHead;
PImage cloud;

void setup() {
  size(900,500);
  
  back = loadImage("background_900_500.png");
  sheep = loadImage("sheepBody.png");
  sheepHead = loadImage("sheepHead.png");
  cloud = loadImage("cloud.png");
  
}

int tx,ty;
int counter=1;

void draw() {
  counter+=5;
  imageMode(CORNER);
  image(back,0,0);  
  
  imageMode(CENTER);
  image(sheep, 150 ,350);
  image(sheep, 450 ,350);
  image(sheep, 750 ,350);
  
  image(sheepHead, 150,sin( radians(150 + counter))*25 + 340);
  image(sheepHead, 450,sin( radians(450 + counter))*25 + 340);
  image(sheepHead, 750,sin( radians(750 + counter))*25 + 340);
  
  //image(cloud, counter, 100 + sin( radians(counter) )*25 );
  
  saveFrame("out/out####.png");
  if (counter >=360) { exit(); }
  
}

void mouseClicked() {
  tx = mouseX;
  ty = mouseY;
  println( mouseX, mouseY);
}
