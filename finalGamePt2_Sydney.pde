import processing.sound.*;

// this game will have five states...
// 0. title screen
// 1. level one
// 2. level two
// 3. if player1 wins
// 4. if player1 loses


// array lists
ArrayList<Bullet> bullets;
ArrayList<Item> items;
ArrayList<Enemy> enemyListLevelOne;
ArrayList<Enemy> enemyListLevelTwo;
ArrayList<Item> itemListLevelOne;
ArrayList<Item> itemListLevelTwo;


// make cat player1
PImage kittyWizzy;

// set screens
PImage titleScreen;
PImage levelOneBG;
PImage levelTwoBG;
PImage winningScreen;
PImage loserScreen;
PImage controlsScreen;

// item images
PImage starItem;
PImage heartItem;
PImage teaItem;
PImage leafItem;

// make enemy animation
Animation enemyAnimation;
// make array of enemy images
PImage[] enemyImages = new PImage[2];


// declare vars to store different sounds
SoundFile pewSound;
SoundFile spookyTune;

// variable to represent what state the game is in
int state;


/*
 making different aspects of game
 */

// making player
Player player1;

// making items for level one
Item itemLevelOne1;
Item itemLevelOne2;
Item itemLevelOne3;
Item itemLevelOne4;
// making items for level two
Item itemLevelTwo1;
Item itemLevelTwo2;
Item itemLevelTwo3;
Item itemLevelTwo4;
Item itemLevelTwo5;


// making enemies for level one
Enemy enemyLevelOne1;
Enemy enemyLevelOne2;
Enemy enemyLevelOne3;
// making enemies for level two
Enemy enemyLevelTwo1;
Enemy enemyLevelTwo2;
Enemy enemyLevelTwo3;
Enemy enemyLevelTwo4;
Enemy enemyLevelTwo5;






/*
 setup and draw
 */

void setup() {
  // set window size
  size(900, 800);

  // initilaize kitty pic for player
  kittyWizzy = loadImage("kittyWizzy.png");
  // initialize title screen
  titleScreen = loadImage("titleScreen.JPEG");
  titleScreen.resize(900, 800);
  // initilize level screens
  levelOneBG = loadImage("levelOneBG.png");
  levelOneBG.resize(900, 800);
  levelTwoBG = loadImage("levelTwoBG.png");
  levelTwoBG.resize(900, 800);
  // initilize win/lose screens
  winningScreen = loadImage("winningScreen.JPEG");
  winningScreen.resize(900, 800);
  loserScreen = loadImage("loserScreen.JPEG");
  loserScreen.resize(900, 800);
  // controls screen
  controlsScreen = loadImage("controlsScreen.JPEG");
  controlsScreen.resize(900, 800);
  // items
  starItem = loadImage("starItem.png");
  starItem.resize(50, 50);
  heartItem = loadImage("heartItem.png");
  heartItem.resize(50, 50);
  teaItem = loadImage("teaItem.png");
  teaItem.resize(50, 50);
  leafItem = loadImage("leafItem.png");
  leafItem.resize(50, 50);



  // fill array of enemy images
  for (int i=0; i<enemyImages.length; i++) {
    enemyImages[i] = loadImage("ghostie"+i+".png");
  }

  // initialize enemyAnimation
  enemyAnimation = new Animation(enemyImages, .1, 2);

  // initialize state var
  state = 0;

  // initilize sound vars
  pewSound = new SoundFile(this, "pewSound.wav");
  spookyTune = new SoundFile(this, "spookyTune.mp3");
  spookyTune.amp(.2);


  player1 = new Player(200, 200, 50, 4, 4, color(0, 0, 0));
  bullets = new ArrayList<Bullet>();

  // initilize item array lists
  itemListLevelOne = new ArrayList<Item>();
  itemListLevelTwo = new ArrayList<Item>();

  enemyListLevelOne = new ArrayList <Enemy>();
  enemyListLevelTwo = new ArrayList <Enemy>();

  // draw enemies for level one
  enemyLevelOne1 = new Enemy(600, 600, 50, 1, 1, color (255, 0, 0), enemyAnimation);
  enemyLevelOne2 = new Enemy(700, 300, 50, 1, 1, color (0, 255, 0), enemyAnimation);
  enemyLevelOne3 = new Enemy(750, 700, 50, 1, 1, color(255, 0, 0), enemyAnimation);
  enemyListLevelOne.add(enemyLevelOne1);
  enemyListLevelOne.add(enemyLevelOne2);
  enemyListLevelOne.add(enemyLevelOne3);

  // draw items for level one
  itemLevelOne1 = new Item(500, 550, 50, color (255, 0, 0), teaItem);
  itemLevelOne2 = new Item(400, 200, 50, color (0, 255, 0), starItem);
  itemLevelOne3 = new Item(100, 400, 50, color (0, 0, 255), leafItem);
  itemLevelOne4 = new Item( 50, 300, 40, color (145, 200, 105), heartItem);
  itemListLevelOne.add(itemLevelOne1);
  itemListLevelOne.add(itemLevelOne2);
  itemListLevelOne.add(itemLevelOne3);
  itemListLevelOne.add(itemLevelOne4);



  // draw enemies for level two
  enemyLevelTwo1 = new Enemy(650, 700, 50, 1, 1, color(255, 0, 0), enemyAnimation);
  enemyLevelTwo2 = new Enemy(400, 400, 50, 1, 1, color(255, 0, 0), enemyAnimation);
  enemyLevelTwo3 = new Enemy(900, 700, 50, 1, 1, color(255, 0, 0), enemyAnimation);
  enemyLevelTwo4 = new Enemy(450, 500, 50, 1, 1, color(255, 0, 0), enemyAnimation);
  enemyLevelTwo5 = new Enemy(650, 650, 50, 1, 1, color(255, 0, 0), enemyAnimation);
  enemyListLevelTwo.add(enemyLevelTwo1);
  enemyListLevelTwo.add(enemyLevelTwo2);
  enemyListLevelTwo.add(enemyLevelTwo3);
  enemyListLevelTwo.add(enemyLevelTwo4);
  enemyListLevelTwo.add(enemyLevelTwo5);


  // draw items for level two
  itemLevelTwo1 = new Item(500, 600, 40, color(255, 100, 0), starItem);
  itemLevelTwo2 = new Item(200, 200, 50, color (237, 210, 160), leafItem);
  itemLevelTwo3 = new Item(700, 600, 30, color (160, 237, 213), starItem);
  itemLevelTwo4 = new Item(800, 200, 65, color (255, 64, 125), teaItem);
  itemLevelTwo5 = new Item(400, 700, 50, color (67, 255, 64), leafItem);
  itemListLevelTwo.add(itemLevelTwo1);
  itemListLevelTwo.add(itemLevelTwo2);
  itemListLevelTwo.add(itemLevelTwo3);
  itemListLevelTwo.add(itemLevelTwo4);
  itemListLevelTwo.add(itemLevelTwo5);
}



void draw() {

  /*
FINITE STATE MACHINE
   */

  // title screen
  switch(state) {
  case 0:
    background(titleScreen);
    break;

    //// level one
  case 1:

    // draw background
    background(levelOneBG);

    // move player
    player1.movePlayer();


    // draw and move bullets
    for (Bullet bullet : bullets)
    {
      bullet.renderBullet();
      bullet.moveBullet();
    }

    // render items, make items
    // disappear when hit by player
    for (Item item : itemListLevelOne)
    {
      item.renderItem();
      item.itemTouched(player1);
    }

    for (int i=itemListLevelOne.size()-1; i>=0; i--) {
      if (itemListLevelOne.get(i).isCollected == true) {
        itemListLevelOne.remove(i);
      }
    }


    // draw player
    player1.renderPlayer();


    // draw and move enemies
    for (Enemy enemy : enemyListLevelOne)
    {
      enemyAnimation.display(enemy.enemyX, enemy.enemyY);
      enemy.moveEnemy(player1);
      player1.isSpooky(enemy);
      for (Bullet bullet : bullets) {
        enemy.isHit(bullet);
      }
      if (player1.isSpooked == true) {
        state = 4;
      }
    }


    for (int i=enemyListLevelOne.size()-1; i>=0; i--) {
      if (enemyListLevelOne.get(i).isDead == true) {
        enemyListLevelOne.remove(i);
      }
    }

    if (enemyListLevelOne.size() == 0) {
      if (itemListLevelOne.size() == 0) {
        state = state + 1;
      }
    }

    if (!spookyTune.isPlaying()) {
      spookyTune.play();
    }
    break;


  case 2:
    background(levelTwoBG);

    // move player
    player1.movePlayer();

    // draw and move bullets
    for (Bullet bullet : bullets)
    {
      bullet.renderBullet();
      bullet.moveBullet();
    }

    // render items, make items
    // disappear when hit by player
    for (Item item : itemListLevelTwo)
    {
      item.renderItem();
      item.itemTouched(player1);
    }

    for (int i=itemListLevelTwo.size()-1; i>=0; i--) {
      if (itemListLevelTwo.get(i).isCollected == true) {
        itemListLevelTwo.remove(i);
      }
    }


    // draw player
    player1.renderPlayer();


    // draw and move enemies
    for (Enemy enemy : enemyListLevelTwo)
    {
      enemyAnimation.display(enemy.enemyX, enemy.enemyY);
      enemy.moveEnemy(player1);
      player1.isSpooky(enemy);
      for (Bullet bullet : bullets) {
        enemy.isHit(bullet);
      }
      if (player1.isSpooked == true) {
        state = 4;
      }
    }



    for (int i=enemyListLevelTwo.size()-1; i>=0; i--) {
      if (enemyListLevelTwo.get(i).isDead == true) {
        enemyListLevelTwo.remove(i);
      }
    }

    if (enemyListLevelTwo.size() == 0) {
      if (itemListLevelTwo.size() == 0) {
        state = 3;
      }
    }


    if (!spookyTune.isPlaying()) {
      spookyTune.play();
    }
    break;

  case 3:
    background(winningScreen);
    break;

  case 4:
    background(loserScreen);
    break;

  case 5:
    background(controlsScreen);
    break;
  }
}






/*
   
 move the player when specific keys are pressed
 shoot bullets when 's' key is pressed
 
 */

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player1.isMovingRight = true;
    }
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      player1.isMovingLeft = true;
    }
  }

  if (key == CODED) {
    if (keyCode == UP) {
      player1.isMovingUp = true;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      player1.isMovingDown = true;
    }
  }

  if (key == 's') {
    bullets.add(new Bullet(player1.playerX, player1.playerY, 10, 10, color (255, 255, 0)));
    // play pew sound when s key is pressed
    pewSound.play();
  }
}


void keyReleased() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      player1.isMovingRight = false;
    }
  }

  if (key == CODED) {
    if (keyCode == LEFT) {
      player1.isMovingLeft = false;
    }
  }

  if (key == CODED) {
    if (keyCode == UP) {
      player1.isMovingUp = false;
    }
  }

  if (key == CODED) {
    if (keyCode == DOWN) {
      player1.isMovingDown = false;
    }
  }

  if (key == ' ') {
    state = 5;
  }

  if (key == 'r') {
    state = 0;
    if (spookyTune.isPlaying()) {
      spookyTune.stop();
    }
  }

  if (key == 'd') {
    state = 0;
    if (spookyTune.isPlaying()) {
      spookyTune.stop();
    }
  }

  if (key == 'b') {
    setup();
    state = 1;
  }
}
