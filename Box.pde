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
    return (p.x >= position.x - dimensions.x / 2 &&
    p.x < position.x + dimensions.x / 2 &&
    p.y >= position.y - dimensions.y / 2 &&
    p.y < position.y + dimensions.y / 2 &&
    p.z >= position.z - dimensions.z / 2 &&
    p.z < position.z + dimensions.z / 2);
  }
}
