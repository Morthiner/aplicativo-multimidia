import processing.sound.*;
SoundFile music;


PImage bg;
float x,y,s=40; 
int score;
boolean pressed, start;
int rectX, rectY;
int rectSize = 180;  

void setup()
{
  music = new SoundFile(this, "erroXP.mp3");
  size(480,860);
  noStroke();
  textAlign(CENTER);
  textSize(35);
  // botao
  start = false;
  rectX = width/2 - rectSize/2;
  rectY = height/2 - rectSize/2;
  reset();
  bg = loadImage("bg.png");
}

void draw() {  
  background(bg);
  fill(0, 0, 0);
  stroke(0, 0, 255);
  //line(0, y, width, y);

  y++;
  if (y > height) {
    y = 0;
  }
  
  if(!start)
  {
    rectMode(CORNER);
    fill(255);
    stroke(255); // borda
    rect(rectX, rectY, rectSize, rectSize);
    fill(255, 0, 0);
    text("Start", rectX + rectSize/2, rectY + rectSize/2  + 35/2); 
    if(mousePressed)
    {
      start = true;
    }
  }
  
  if(!pressed && mousePressed && start)
{
  music.play();
  pressed=true;
  if(mouseX > x - (s/2) && mouseY > y - (s/2) && mouseX < x + (s/2) && mouseY < y + (s/2))
  {
    score++;
    randomPos();
  }
  else{
    reset();
  }
}
if (pressed && !mousePressed && start)
{
  pressed= false;
}
if(start)
{
  ellipse(x,y,s,s);
  text("Score : "+ score,width /2,40);
}  
}

void reset()
{
  x = width/2;
  y = height/2;
  score=0;
}
void randomPos()
{
  x = random(s/2, width - (s/2));
  y = random(s/2, height - (s/2));
}
