//CAR.101 BY SACHIN SETHI. 
//The Main Class
int y;//X and Y global varibles 
int x;
int score; //Varible for score 
int timer; //Varible for timer
int counter = 0; //Counter is set to 0, I did not have to this because it is 0 by default
int life = 3; //lives for the game is set at 3
int [] postion = {145,240,330,425}; //An array used to allow the points to be sprawned, this to allocate them into the lanes and they start at the bottom of the screen
int [] carPostion = {117,209,300,395}; //An array used to allow the cars to be sprawned, this to allocate them into the lanes and they start at the top of the screen
PImage road, t1; //Varibles used to store the road of the game and the gameover page
PFont Font1; //Stored a font value
PFont Font2;
boolean gameMode = true; //Gamemode is declared as true
GameMode currentState = GameMode.SPLASH_SCREEN; // When the game is first played the splash screen will show (use of enum modes)

Car1 player1; //Car1 is now known as player1
BonusSqaure greenSquare1, greenSquare2, greenSquare3, greenSquare4; // BounusSquares are declared as greenSquare1(+1) to symbolies it is a postive point
NegativeSquares redSquare1, redSquare2, redSquare3, redSquare4; // NegativeSquares are declared as redSquare1(+1) to symbolies it is a negative point
EnmeyCar[] villion = new EnmeyCar[4]; //An array of enmey cars is used  to declare them, they're known as villion

void setup() //Setup method 
{
  size(600,900);//Size of the canvas
  Font1 = createFont("Arial Bold", 18); //The font style that I want to use are stored in Font1 and Font2 
  Font2 = createFont("Arial Bold", 48);
  road = loadImage("theRoad.jpg");//The image for the road
  road.resize(width,height); //The image of the road is sized for the canvas size
   
  player1 = new Car1 (width/2,100); //The postion of player1 (the user) when the game is playing (X and Y is set from the contructor) 
  
  for (int i=0; i<villion.length; i++) //For loop is used, to declare the the array of villion images 
  {
    villion[i] = new EnmeyCar(carPostion[(int)random(0,4)],-200); //The postion of the villion cars and how they going to sprawn randomly on the X-axis (X and Y values passed from the contructor) 
  }
  
  greenSquare1 = new BonusSqaure(postion [(int)random(0,4)],y,2); //The postion of the greenSquares when the game is playing(X,Y and speedY passed from the contructor)   
  greenSquare2 = new BonusSqaure(postion [(int)random(0,4)],y,2);
  greenSquare3 = new BonusSqaure(postion [(int)random(0,4)],y,2);
  greenSquare4 = new BonusSqaure(postion [(int)random(0,4)],y,2);
  
  redSquare1 = new NegativeSquares(postion [(int)random(0,4)],y,2); //The postion of the redSquares when the game is playing(X,Y and speedY passed from the contructor that was used in the super class)
  redSquare2 = new NegativeSquares(postion [(int)random(0,4)],y,2);
  redSquare3=  new NegativeSquares(postion [(int)random(0,4)],y,2);
  redSquare4 = new NegativeSquares(postion [(int)random(0,4)],y,2);
}

enum GameMode //Gamemodes set to declair what point the game is at
{
  SPLASH_SCREEN, //The first page shown when the user enters the game
  PLAYING, //The game is playing, gameMode is true
  GAME_OVER, //Shows the game over page when the user loses their lives 
}

void keyPressed() //KeyPressed method for key board buttons 
{
  if(currentState==GameMode.PLAYING) //When the game is playing
  {
    if (key == CODED) //If the key board is touched when it is these keyboard buttons
    { 
      if (keyCode== UP) //If up key then the player goes up by 10px, but the can't go past the top of the screen limit of 10px from the top 
      {
        if(player1.y >=10)
        {
          player1.y = player1.y -10;
        }
      }
      if (keyCode == DOWN) //If down Key, player goes down by 10px and can't touch the bottom, a couple of pixels seperates it 
      {
        if(player1.y <height-130)
        {
          player1.y =player1.y + 10;
        }
      }
      if (keyCode == LEFT)
      {
        if(player1.x  >x+118) //If left arrow key, then player goes left by 10px but player cannot go past furthest lane on the left 
        player1.x = player1.x -10;
      }
    }
    if (keyCode == RIGHT) //If right arrow key, then player goes right by 10px but player cannot go past furthest lane on the right
    {
      if(player1.x <x+395)
      player1.x = player1.x +10;
    }
  }
}

void draw () //Draw method to display the game
{
  if (currentState==GameMode.SPLASH_SCREEN) //Shows the splash screen the user first enters the game
  {
    background(0); //Black backgorund
    textFont(Font2); //Font2 is used for the font style
    text("CAR.101", 200,375); //Name of the game and the postion of text 
    textFont(Font1); //Font1 is used for the font style
    text("TO THE START THE GAME PRESS THE SPACE-BAR TO START", 30,400); //Message for the user to enter the game, and postion to be shown
    text("BY SACHIN SETHI", 225,425); //Message for the user to enter the game, and postion to be shown
    
    if (keyPressed==true &&  key == ' ') //When the user clicks the spaces bar then game begins 
    {
      currentState=GameMode.PLAYING; 
    }
  }
  
  if (currentState==GameMode.PLAYING) // The begining of the game
    { //Allows the road to fall as if its moving
     image(road, 0, y); //Draw background twice adjacent
     image(road, 0, y+road.height);
     y -= 6;
     if(y <= -road.height)
     y= 0;//wrap background
  
     textFont(Font1,16); //Font1 style used to show the score of the game
     fill(255); //colour white
     text("TRAVEL POINTS:" + score/400, 303,20);
  
     textFont(Font1, 16);//Font1 style used to show the lives of the game
     text("LIFE:" + life, 125,20);
     timer +=1; //The timer is set and it plues by 1
     
     
     player1.render(); //The player is shown on the screen
     
     greenSquare1.update(); //The greenSquare (green points) will appear on the screen and will show up respectivly 
     greenSquare2.update();
     greenSquare3.update();
     greenSquare4.update();
  
     redSquare1.update(); //The redSquare (red points) will appear on the screen and will show up respectivly 
     redSquare2.update();
     redSquare3.update();
     redSquare4.update();
     
     //Postive points
     if(player1.collide(greenSquare1)) //When the player collided with the green points then add to the score 
       {
         println("SCORE!"); //Prints "SCORE!" as proof of the collision
         score = score +=10000; //The score to add when theres a collision
         greenSquare1.delete(); //Delete when the collision happens 
       }
     if(player1.collide(greenSquare2)) //Same procedure for below 
       {
         println("SCORE!");
         score = score +=10000;
         greenSquare2.delete();
       }
     if(player1.collide(greenSquare3))
       {
         println("SCORE!");
         score = score +=10000;
         greenSquare3.delete();
       }
     if(player1.collide(greenSquare4))
       {
         println("SCORE!");
         score = score +=10000;
         greenSquare4.delete(); 
       }
     
     //Negative Points
     if(player1.collideNegative(redSquare1))//When the player collided with the red points then take from the score 
       {
         println("SCORE KNOCKED OFF!"); //Prints "SCORE KNOCKED OFF!" as proof of the collision
         score = score -=10000;//The score to takeaway when theres a collision
         redSquare1.delete(); //Delete when the collision happens
       }
     if(player1.collideNegative(redSquare2)) //Same procedure for below 
       {
         println("SCORE KNOCKED OFF!");
         score = score -=10000;
         redSquare2.delete();
       }
     if(player1.collideNegative(redSquare3))
       {
         println("SCORE KNOCKED OFF!");
         score = score -=10000;
         redSquare3.delete();
       }
     if(player1.collideNegative(redSquare4))
       {
         println("SCORE KNOCKED OFF!");
         score = score -=10000;
         redSquare4.delete(); 
       }
     
     for(EnmeyCar a : villion) //Shows the array of the EnmeyCars (villion_
     a.update(); 
     
     for(int i=0; i<=villion.length;i++)//For loop to prevent the overlapping of the villion cars 
       {
         for(int j=i+1; j<villion.length;j++) //Check the width and height, using cordinates 
         {
           if(villion[j].x < villion[i].x +villion[i].w && villion[j].x + villion[j].w > villion[i].x 
           && villion[j].y < villion[i].y + villion[i].h && villion[j].y +villion[j].h >villion[i].y)
           { //Using cordinates to deteramine if there has been overlapping, the width and the height and x and y the check among each other of overlapping
             villion[i].y=(-i*600)-200; //If there is overlapping then villion[i](which is used to show on the canvas) goes up backwards by 200px if there is detection of overlapping
           }
         }
       }
     
     if (life>=0) //If the lives are greater than 0 then detect for collision before it takes a life away and ends the game 
       {
         for(int i=0; i<villion.length;i++) //For loop to check over the collision when each cordinate of the images has past each other the player and villion 
         { //Collion with villiom cars 
           if(abs(player1.x -villion[i].x) < villion[i].w && abs(player1.y -villion[i].y) < villion[i].h) 
           //When player X is in approximity with villion.X/Y and villio.width/height then there is a collision 
           {
             println("CAR CRASH AND SCORE KNOCKED OFF"); //If the player and villion over lap then print the message in the console to confirm the detection
             life -=1; //When the user colided then take 1 life away and take away the score as well 
             score = score -20000; 
             villion[i].y= -300; //When theres a collion then the villion car goes back by 300px to show theres a collision
             
             if(life ==0) //If life is 0 then its game over
             {
               println("GAME OVER!"); //Message is shown in the colsole
               currentState=GameMode.GAME_OVER; //enum game mode is set as gameover and it will show the gameover page
               t1= loadImage("t1.jpg");
               t1.resize(width,height);
               image(t1,0,0);
             }
           }
         }
       }
     }//End of the void draw()
}//End of the Main Class 
