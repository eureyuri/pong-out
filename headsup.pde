class Headsup {
  int count;
  final int colour = #6699ff;
  
  Headsup() {
    //How many lives the player has
    count = 3;
  }
 
  void draw() {
    fill(colour);
    textAlign(CENTER);
    text("Made by Eurey Noguchi", width/2, height - 10);
    String ballLeft = count + " balls left!";
    textAlign(RIGHT);
    text(ballLeft, width - 10, 30);
  }
  
  void start() {
    fill(colour);
    textAlign(CENTER);
    textSize(20);
    String welcome = "WELCOME! \n\n Press any key to start!";
    text(welcome, width/2, height/4);
    if (keyPressed) {
      state = INGAME;
    }
  }
  
  void update() {
    if (ball.outOfBound()) {
      count--;
      if (count == 0) {
        lostGame.play();
        state = GAMEOVER;
      } else { 
        lostBall.play();
        ball.reset();
      }
    }
  }
  
  //When there are no balls left
  void gameOver() {
    fill(colour);
    textAlign(CENTER);
    textSize(20);
    String restart = "GAME OVER! \n\n Press 'e' to stop \n and any other key to re-start!";
    text(restart, width/2, height/4);
    this.keyPressed();
  } 
  
  void keyPressed() {
    if (key == 'e') {
      endGame();
    } 
    if (keyPressed) {
      count = 4;
      state = INGAME;
    }
  }
  
  void endGame() {
    text("Thank you for playing!!", width/2, height/2);
    stop();
  }
}