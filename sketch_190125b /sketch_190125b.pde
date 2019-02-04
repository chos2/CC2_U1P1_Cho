PImage bird;
PImage hunter;
PImage field;
PVector birdpos = new PVector(100,100);
PVector dir = new PVector(0,0);
PVector bulletpos = new PVector(-1000,-1000);
PVector hunterpos = new PVector(400,700);
import processing.sound.*;
SoundFile file;

void setup()
{
size(800,800);
  bird= loadImage("bird.png");
  hunter= loadImage("hunter.png");
  file = new SoundFile(this,"gunshot.mp3");
  field= loadImage("field.jpg");
  
}


void draw()
{
  background(255);
  background(field);
  image(bird,birdpos.x,birdpos.y,50,50);
  birdpos.x= birdpos.x+6;
  if( birdpos.x>800)
  {birdpos.x=-6;
  }
  ellipse(bulletpos.x,bulletpos.y,10,10);
  fill(0);
  image(hunter,hunterpos.x,hunterpos.y,50,50);
  bulletpos.add(dir);
  dir.add(new PVector(0,0.03));
  
  if (dist(bulletpos.x, bulletpos.y, birdpos.x,birdpos.y)<20)
  {birdpos.y=-200;}
  
}

void mouseReleased()
{
  file.play();
  bulletpos = hunterpos.copy();
  PVector mouse = new PVector(mouseX, mouseY);
 dir = mouse.sub(bulletpos);
 dir.normalize();
 dir.mult(18);
}
