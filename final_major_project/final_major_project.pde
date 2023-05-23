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
    // Set gradient start and end colors
  int gradientStart = color(0, 0, 255);   // Blue color
  int gradientEnd = color(128, 0, 128);  // Purple color

  // Draw gradient background
  for (int y = 0; y < height; y++) {
    // Calculate the current color based on the gradient
    int gradientColor = lerpColor(gradientStart, gradientEnd, (float)y / height);
  
    // Set the current row of pixels with the gradient color
    for (int x = 0; x < width; x++) {
      set(x, y, gradientColor);
    }
  }

  // Update the display to show the gradient background
  updatePixels();

  
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
     background(220);
    textAlign(CENTER);
    textSize(24);
    fill(0);
    text("Welcome to Hyper Hurdles!", width / 2, height / 2 - 50);
    textSize(20);
    text("Instructions:", width / 2, height / 2);
    textSize(14);
    text("- Use the left and right arrow keys to move the player", width / 2, height / 2 + 50);
    text("- Avoid the obstacles and survive as long as possible", width / 2, height / 2 + 80);
    textSize(20);
    text("Press any key to start", width / 2, height / 2 + 150);
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
  // Check collision with left wall
  if (playerX - playerSize / 2 < 0 || playerX + playerSize / 2 > width) {
  // Game Over
    isPlaying = false;
    gameOver = true;
    // Update high score if current score is higher
    if (score > highScore) {
      highScore = score;
    }
    return;  // Exit the function to prevent further player movement
  }

  
  if (keyCode == LEFT) {
  if (playerX - playerSize / 2 > 0) {
    playerX -= 5;
  } else {
    // Game Over
    isPlaying = false;
    gameOver = true;
    // Update high score if current score is higher
    if (score > highScore) {
      highScore = score;
    }
    return;  // Exit the function to prevent further player movement
  }
}   else if (keyCode == RIGHT) {
    if (playerX + playerSize / 2 < width) {
      playerX += 5;
  }   else {
      // Game Over
      isPlaying = false;
      gameOver = true;
      // Update high score if current score is higher
      if (score > highScore) {
        highScore = score;
    }
      return;  // Exit the function to prevent further player movement
  }
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
