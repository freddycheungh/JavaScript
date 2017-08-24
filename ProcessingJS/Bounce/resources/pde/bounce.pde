/* @pjs preload="../resources/media/shibawithcostume.png"; */

int state = 0;
int posX;
int posY;
int shapeSize = 20;
int shapeColor = color(0);
color barColor = color(0);
float barWidth = 50;
float barHeight = 5;
float gravity = 1;
float verticalSpeed = 0;
float horizontalSpeed = 0;
float gvfriction = 0.0001; 
float friction = 0.1;
int score = 0;
PImage im = loadImage("../resources/media/shibawithcostume.png");

void setup() {

    size(500, 500);  
    posX = width/2;
    posY = height/5;
    frameRate(60);
    
}

/*
    0 - Initial Screen 
    1 - Start Game
    2 - Game Over game
*/

void draw() {

    switch(state) {

        case 0:
            initScreen();
        break;
        case 1:
            gameScreenStart();
        break;
        case 2:
            gameOverScreen();
        break;

    }
   
}

void initScreen() {

    background(0);
    textSize(16);
    text("Click the screen to start", height/2, width/2);
    textAlign(CENTER);

}

void gameScreenStart() {

    background(255);
    drawEllipse();
    drawBar();
    barHitBoxBounce();
    applySideForces();
    applyGravity();
    printScore();
    boxObject();
    
}

void gameOverScreen() {

    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Game Over", width/2, height/2 - 20);
    textSize(15);
    text("Click to play again!", width/2, height/2 + 30);

}

// Start of the game and End of the game event
public void mousePressed() {

    switch (state) {

        // Start game
        case 0:
            state = 1;
        break;
        // Restart game
        case 2:
            state = 1;
            posX = width/2;
            posY = height/5;
            verticalSpeed = 0;
            horizontalSpeed = 0;
            shapeColor = color(0);
            barColor = color(0)
            score = 0;
        break;

    }

}

void drawEllipse() {

    fill(shapeColor);
    ellipse(posX, posY, shapeSize, shapeSize);
    image(im, posX - shapeSize / 2, posY - shapeSize / 2, shapeSize, shapeSize);

}

void drawBar() {

    fill(barColor);
    rectMode(CENTER);
    rect(mouseX, mouseY, barWidth, barHeight);

}

void barHitBoxBounce() {

    float overhead = mouseY - pmouseY;
    int r = random(0,255);
    int g = random(0,255);
    int b = random(0,255);

    if (posX - (shapeSize/2) < mouseX + (barWidth/2) && mouseX - (barWidth/2) < posX + (shapeSize/2)) {

        if (dist(posX, posY, posX, mouseY) <= shapeSize + abs(overhead)) {

            physicBottom(mouseY);
            // racket moving up
            horizontalSpeed = (posX - mouseX) / 8;
            score++;

            // Change the shape's color every 10 point
            if (score % 10 == 0) {

                shapeColor = color(r,g,b);
                barColor = color(r,g,b);
                
            }

            if (overhead < 0) {

                posY += overhead;
                verticalSpeed += overhead;

            }

        }

    }

}

void applyGravity() {

    posY += verticalSpeed;
    verticalSpeed += gravity;
    verticalSpeed -= (verticalSpeed * gvfriction);

}

void physicBottom(float surface) {

    posY = surface - (shapeSize / 2);
    verticalSpeed *= -1;
    verticalSpeed -= (verticalSpeed * friction);

}

void physicTop(float surface) {
    
    posY = surface + (shapeSize / 2);
    verticalSpeed *= -1;
    verticalSpeed -= (verticalSpeed * friction);

}

void physicLeft(float surface) {

    posX = surface + (shapeSize / 2);
    horizontalSpeed*=-1;
    horizontalSpeed -= (horizontalSpeed * friction);

}

void physicRight(float surface) {

    posX = surface - (shapeSize / 2);
    horizontalSpeed*=-1;
    horizontalSpeed -= (horizontalSpeed * friction);

}

void applySideForces() {

    posX += horizontalSpeed;
    horizontalSpeed -= (horizontalSpeed * gvfriction);

}

// Contain the objects inside the canvas' wall
void boxObject() {
    
    // object hit the bottom of the canvas
    if (posY + (shapeSize / 2) > height) { 
        physicBottom(height);
        // game over state
        state = 2;
    }

    // object hit the top of the canvas
    if (posY - (shapeSize / 2) < 0) {
        physicTop(0);
    } 

    // object hit the left of the canvas
    if (posX -(shapeSize / 2) < 0){
        physicLeft(0);
    }

    // object hit the right of the canvas
    if (posX + (shapeSize / 2) > width){
        physicRight(width);
    }

}

void printScore(){

    fill(0);
    textSize(30); 
    text(score, height / 2, 80);
    textAlign(CENTER);

}
