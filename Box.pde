class Box
{
  PVector position;   // {x, y, z}
  PVector dimensions; // {width, height, depth}
  
  Box(PVector pos, PVector dim)
  {
    position = pos.copy();
    dimensions = dim.copy();
  }
  
  boolean Contains(PVector p)
  {
    return (p.x > position.x - dimensions.x &&
    p.x < position.x + dimensions.x &&
    p.y > position.y - dimensions.y &&
    p.y < position.y + dimensions.y &&
    p.z > position.z - dimensions.z &&
    p.z < position.z + dimensions.z);
  }
}
