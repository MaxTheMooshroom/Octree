boolean root = true;

class OctoTree
{
  Box boundaries;
  int capacity;
  ArrayList<PVector> points;
  boolean divided = false;
  
  OctoTree upnorthwest;
  OctoTree upnortheast;
  OctoTree upsouthwest;
  OctoTree upsoutheast;  
  OctoTree downnorthwest;
  OctoTree downnortheast;
  OctoTree downsouthwest;
  OctoTree downsoutheast;
  
  OctoTree(Box b, int n)
  {
    boundaries = b;
    capacity = n;
    points = new ArrayList<PVector>();
  }
  
  void Subdivide()
  {
    PVector h = new PVector();
    PVector.div(boundaries.dimensions, 2, h);
    
    PVector pos = boundaries.position;
    
    upnorthwest = new OctoTree(new Box(new PVector(pos.x + h.x, pos.y - h.y, pos.z + h.z), h), capacity);
    upnortheast = new OctoTree(new Box(new PVector(pos.x + h.x, pos.y + h.y, pos.z + h.z), h), capacity);
    upsouthwest = new OctoTree(new Box(new PVector(pos.x - h.x, pos.y - h.y, pos.z + h.z), h), capacity);
    upsoutheast = new OctoTree(new Box(new PVector(pos.x - h.x, pos.y + h.y, pos.z + h.z), h), capacity);
    downnorthwest = new OctoTree(new Box(new PVector(pos.x + h.x, pos.y - h.y, pos.z - h.z), h), capacity);
    downnortheast = new OctoTree(new Box(new PVector(pos.x + h.x, pos.y + h.y, pos.z - h.z), h), capacity);
    downsouthwest = new OctoTree(new Box(new PVector(pos.x - h.x, pos.y - h.y, pos.z - h.z), h), capacity);
    downsoutheast = new OctoTree(new Box(new PVector(pos.x - h.x, pos.y + h.y, pos.z - h.z), h), capacity);
    
    divided = true;
    
    for (PVector p : points)
    {
      if (upnorthwest.boundaries.Contains(p))
      {
        upnorthwest.Insert(p);
      } else if (upnortheast.boundaries.Contains(p))
      {
        upnortheast.Insert(p);
      } else if (upsouthwest.boundaries.Contains(p))
      {
        upsouthwest.Insert(p);
      } else if (upsoutheast.boundaries.Contains(p))
      {
        upsoutheast.Insert(p);
      } else if (downnorthwest.boundaries.Contains(p))
      {
        downnorthwest.Insert(p);
      } else if (downnortheast.boundaries.Contains(p))
      {
        downnortheast.Insert(p);
      } else if (downsouthwest.boundaries.Contains(p))
      {
        downsouthwest.Insert(p);
      } else if (downsoutheast.boundaries.Contains(p))
      {
        downsoutheast.Insert(p);
      }
    }
  }
  
  void Insert(PVector point)
  {
    if (!boundaries.Contains(point)) return;
    
    if (points.size() < capacity)
    {
      points.add(point);
    }
    else
    {
      if (!divided) 
      {
        Subdivide();
      }
      upnorthwest.Insert(point);
      upnortheast.Insert(point);
      upsouthwest.Insert(point);
      upsoutheast.Insert(point);
      downnorthwest.Insert(point);
      downnortheast.Insert(point);
      downsouthwest.Insert(point);
      downsoutheast.Insert(point);
    }
  }
  
  void Draw()
  {
    if (divided)
    {
      upnorthwest.Draw();
      upnortheast.Draw();
      upsouthwest.Draw();
      upsoutheast.Draw();
      downnorthwest.Draw();
      downnortheast.Draw();
      downsouthwest.Draw();
      downsoutheast.Draw();
    }
    else
    {
      stroke(0, map(points.size(), 0, capacity, 0, 255), map(points.size(), 0, capacity, 255, 0));
      if (!root) 
      {
        translate(-boundaries.position.x / 2, -boundaries.position.y / 2, -boundaries.position.z / 2);
        box(boundaries.dimensions.x, boundaries.dimensions.y, boundaries.dimensions.z);
        translate(boundaries.position.x / 2, boundaries.position.y / 2, boundaries.position.z / 2);
      }
      else
      {
        box(boundaries.dimensions.x, boundaries.dimensions.y, boundaries.dimensions.z);
        root = false;
      }
      
      stroke(vertexColour);
      for (PVector p : points)
      {
        translate(-p.x, -p.y, -p.z);
        sphere(3);
        translate(p.x, p.y, p.z);
      }
    }
  }
}
