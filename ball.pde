class Ball {
  PVector position;
  PVector velocity;
  private int radius;
  private final int MIN_SPEED = 2;
  private final int MAX_SPEED = 5;
  
  Ball() {
    radius = 16;
    reset();
  }
  
  //Placing a ball with a random velocity
  void reset() {
    int velocityX = MIN_SPEED + (int)(Math.random() * MAX_SPEED);
    int velocityY = MIN_SPEED + (int)(Math.random() * MAX_SPEED);
    position = new PVector(width/2, 40);
    velocity = new PVector(velocityX, velocityY); 
  }
  
  void update() {    
    position.add(velocity);
    
    reflectWall();
    reflectPaddle();
  }
  
  //Reflecting if the ball hits the walls
  void reflectWall() {
    if ((position.x > width - radius/2) || (position.x < 0 + radius/2)) {
      bounce.play();
      velocity.x = velocity.x * -1;
    }
    if ((position.y < 0 + radius/2)) {
      bounce.play();
      velocity.y = velocity.y * -1;
    }
  }
  
  //Reflecting if the ball collides with the paddle
  void reflectPaddle() {
    PVector collision = paddle.shape.circleCollision(position);
    if (collision.mag() < radius/2) {
      collision.normalize();
      float dot = collision.dot(velocity);
      if (Math.abs(dot) < 0.0001) {
        PVector delta = position.copy();
        delta.sub(paddle.shape.center());
        position.add(delta.mult(0.1));
      } else {
        PVector delta = collision.mult(-2 * dot);
        velocity.add(delta);
      }
      bounce.play();
    }
  }
  
  //Method for checking if the ball is out of bound or not
  boolean outOfBound() {
    float outOfBound = position.y - (height - radius);
    return outOfBound > 0;
  }
  
  void draw() {
    fill(#F50C0C);
    ellipse(position.x, position.y, radius, radius);
  }
}