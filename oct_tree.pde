import peasy.*;

OctoTree ot;
PeasyCam cam;

color boxColour = color(255);
color vertexColour = color(0, 255, 255);

void setup()
{
  size(600, 600, P3D);
  cam = new PeasyCam(this, 1200);
  
  Box bounds = new Box(new PVector(width / 4, height / 4, width / 4), new PVector(width / 2, height / 2, width / 2));
  ot = new OctoTree(bounds, 8);
}
color record = color(255, 0, 0);
void draw()
{
  if (frameCount % 3 == 0) ot.Insert(new PVector(random(width / 2), random(width / 2), random(width / 2)));
  background(0);
  noFill();
  ot.Draw();
  
  if (frameCount <= 30 * 15) saveFrame("frames/####");
  else record = color(0, 128, 0);
  
  fill(record);
  cam.beginHUD();
  ellipse(width - 20, height - 20, 15, 15);
  cam.endHUD();
}
