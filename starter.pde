// Pong Game
// Starter Code
import java.util.*;
import processing.sound.*;

Ball ball;
Paddle paddle;
Headsup hup;
SoundFile bounce;
SoundFile lostGame;
SoundFile lostBall;

final int START = 0;
final int INGAME = 1;
final int GAMEOVER = 2;
//Keeps track of which game state the game is in
int state;

void setup() {
  state = START;
  size(300, 600);
  bounce = new SoundFile(this, "pong.mp3");
  lostGame = new SoundFile(this, "lostgame.mp3");
  lostBall = new SoundFile(this, "lostball.mp3");
  hup = new Headsup();
  paddle = new Paddle();
  ball = new Ball();
}


void draw() {
  background(255);
  
  //Changing the game state
  switch (state) {
    case START:
      hup.start();
      break;
    case INGAME:
      this.game();
      break;
    case GAMEOVER:
      hup.gameOver();
      break;
  }
}

//Method for playing the game
void game() {
  ball.update();
  hup.update();
  ball.draw();
  hup.draw();
  paddle.draw();
}

void keyPressed() {
  paddle.keyPressed();
}