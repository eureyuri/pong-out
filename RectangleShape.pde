class RectangleShape {
  float x, y, w, h;
  
  RectangleShape(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  //Method for identifying if the ball collided with the paddle
  PVector circleCollision (PVector center) {
    PVector result = new PVector(0, 0);
    
    //Dividing the paddle into a x-sector and a y-sector
    int xSector, ySector;
    if (center.x < left()) {
      xSector = -1;
    } else if (center.x > right()) {
      xSector = 1;
    } else {
      xSector = 0;
    }
    if (center.y < bottom()) {
      ySector = -1;
    } else if (center.y > top()) {
      ySector = 1;
    } else {
      ySector = 0;
    }
    
    if (xSector == 0 && ySector == 0) {
      return result;
    }
    
    if (xSector == 0) {
      if (ySector == 1) {
        result.y = center.y - top();
      } else {
        result.y = center.y - bottom();
      }
      return result;
    }
    if (ySector == 0) {
      if (xSector == 1) {
        result.x = center.x - right();
      } else {
        result.x = center.x - left();
      }
      return result;
    }
    
    //If the ball hits the corner
    PVector corner = new PVector();
    if (xSector == 1) {
      corner.x = right();
    } else {
      corner.x = left();
    }
    if (ySector == 1) {
      corner.y = top();
    } else {
      corner.y = bottom();
    }
    
    result.x = center.x - corner.x;
    result.y = center.y - corner.y;
    
    return result;
  }
  
  //Identifying where the top, bottom, right, and left are
  
  float top() {
    return y + h/2;
  }
  
  float bottom() {
    return y - h/2;
  }
  
  float right() {
    return x + w/2;
  }
  
  float left() {
    return x - w/2;
  }
  
  PVector center() {
    return new PVector(x, y);
  }
  
}