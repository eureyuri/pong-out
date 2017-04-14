class Paddle {
  private float minX;
  private float maxX;
  RectangleShape shape;
  final int STEP = 10;
  
  Paddle() {
    float x = width/4;
    float y = height * .9;
    float w = 75;
    float h = 15;
    minX = w/2;
    maxX = width - w/2;
    shape = new RectangleShape(x, y, w, h);
  }
  
  void draw() {
    fill(0);
    rect(shape.x - shape.w/2, shape.y - shape.h/2, shape.w, shape.h, 0.1, 0.1, 0.1, 0.1);
  }
  
  //Method for moving the paddle
  void move(int step) {
    shape.x += step;
    //Checking if the paddle is between the walls
    shape.x = Math.max(minX, shape.x);
    shape.x = Math.min(maxX, shape.x);
  }
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        move(STEP);
      } else if (keyCode == LEFT) {
        move(-STEP);
      }
    }
  }
}