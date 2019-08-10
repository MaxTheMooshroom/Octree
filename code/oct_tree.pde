import peasy.*;

OctoTree ot;
PeasyCam cam;

color boxColour = color(255);
color vertexColour = color(0, 255, 255);

void setup()
{
  size(600, 600, P3D);
  cam = new PeasyCam(this, 1200);
  
  Box bounds = new Box(new PVector(width / 2, height / 2, width / 2), new PVector(width / 2, height / 2, width / 2));
  ot = new OctoTree(bounds, 8);
}

void keyPressed()
{
  if (key == ' ') ot.Insert(new PVector(random(width / 2), random(height / 2), random(width / 2)));
}

void draw()
{
  background(0);
  noFill();
  ot.Draw();
}
