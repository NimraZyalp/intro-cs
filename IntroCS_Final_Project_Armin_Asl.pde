float ballX, ballY, ballSpeedX, ballSpeedY;
float platformX, platformY, platformWidth, platformHeight;
float gravity;
int score;
boolean gameOver;

void setup() {
  size(600, 400);
  resetGame();
}

void draw() {
  background(200, 200, 255);

  if (!gameOver) {
    // update ball position based on speed and gravity
    ballSpeedY += gravity;
    ballX += ballSpeedX;
    ballY += ballSpeedY;

    // check if ball hits platform
    if (ballX > platformX && ballX < platformX + platformWidth &&
        ballY + 10 > platformY && ballY + 10 < platformY + platformHeight) {
      // bounce ball off platform
      ballSpeedY = -abs(ballSpeedY);
      score++;
    }

    // check if ball hits walls
    if (ballX < 0 || ballX > width) {
      ballSpeedX = -ballSpeedX;
    }

    // check if ball falls off screen
    if (ballY > height) {
      gameOver = true;
    }

    // draw platform
    fill(0, 255, 0);
    rect(platformX, platformY, platformWidth, platformHeight);

    // draw ball
    fill(255, 0, 0);
    ellipse(ballX, ballY, 20, 20);

    // draw score UI
    textSize(20);
    textAlign(RIGHT);
    fill(255);
    text("Score: " + score, width - 20, 30);
  } else {
    // draw game over screen
    textSize(40);
    textAlign(CENTER);
    fill(255);
    text("Game Over", width / 2, height / 2 - 20);
    textSize(20);
    text("Final Score: " + score, width / 2, height / 2 + 20);
    textSize(15);
    text("PRESS SPACE TO PLAY AGAIN ", width / 2, height / 2 + 150);
  }
}

void resetGame() {
  // set initial ball position and speed
  ballX = width / 2;
  ballY = 50;
  ballSpeedX = random(-5, 5);
  ballSpeedY = 0;

  // set initial platform position and size
  platformX = width / 2 - 50;
  platformY = height - 50;
  platformWidth = 100;
  platformHeight = 20;

  // set gravity
  gravity = 0.1;

  // set score and game over status
  score = 0;
  gameOver = false;
}

void keyPressed() {
  // move platform left or right when arrow keys are pressed
  if (keyCode == LEFT) {
    platformX -= 30;
  } else if (keyCode == RIGHT) {
    platformX += 30;
  }

  // reset game when spacebar is pressed after game over
  if (gameOver && keyCode == 32) {
    resetGame();
  }
}
