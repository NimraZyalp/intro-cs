// Game Variables
int playerX, playerY;  // Player position
int playerSize = 20;   // Player size
int obstacleX, obstacleY;  // Obstacle position
int obstacleSize = 40;  // Obstacle size
float obstacleSpeed = 3;  // Obstacle speed
boolean isPlaying = false;  // Game state
boolean gameStarted = false;  // Starting menu state
boolean gameOver = false;  // Game over menu state
float difficultyFactor = 0.01;  // Difficulty factor
int score = 0;  // Score
int highScore = 0;  // High score

void setup() {
  size(400, 400);
  playerX = width / 2;
  playerY = height - 50;
  obstacleX = int(random(width));
  obstacleY = 0;
}

void draw() {
  background(220);
  
  if (gameStarted) {
    if (isPlaying) {
      // Update game logic
      if (dist(playerX, playerY, obstacleX, obstacleY) < (playerSize + obstacleSize) / 2) {
        // Game Over
        isPlaying = false;
        gameOver = true;
        // Update high score if current score is higher
        if (score > highScore) {
          highScore = score;
        }
      }
      player();
      obstacle();
      obstacleY += obstacleSpeed;
      obstacleSpeed += difficultyFactor;
      score++;  // Increment score
    } else {
      // Game Over Menu
      if (gameOver) {
        textAlign(CENTER);
        textSize(24);
        text("Game Over", width / 2, height / 2);
        textSize(16);
        text("Score: " + score, width / 2, height / 2 + 30);
        text("High Score: " + highScore, width / 2, height / 2 + 50);
        textSize(14);
        text("Press any key to restart", width / 2, height / 2 + 80);
      }
    }
  } else {
    // Starting Menu
    if (!gameStarted && !gameOver) {
      textAlign(CENTER);
      textSize(24);
      text("Press any key to start", width / 2, height / 2);
    }
  }
  
  // Display score
  textAlign(RIGHT);
  textSize(16);
  text("Score: " + score, width - 20, 20);
}

void keyPressed() {
  if (!isPlaying || key == ' ') {
    // Start or Restart the game
    isPlaying = true;
    gameStarted = true;
    gameOver = false;
    playerX = width / 2;
    playerY = height - 50;
    obstacleX = int(random(width));
    obstacleY = 0;
    obstacleSpeed = 3;
    score = 0;  // Reset score
  }
}

void player() {
  fill(0, 0, 255);
  rectMode(CENTER);
  rect(playerX, playerY, playerSize, playerSize);
  
  // Move player with arrow keys
  if (keyCode == LEFT && playerX > playerSize / 2) {
    playerX -= 5;
  } else if (keyCode == RIGHT && playerX < width - playerSize / 2) {
    playerX += 5;
  }
}

void obstacle() {
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(obstacleX, obstacleY, obstacleSize, obstacleSize);
  
  // Reset obstacle position if it reaches the bottom
  if (obstacleY > height) {
    obstacleX = int(random(width));
    obstacleY = 0;
  }
}
