class NegativeSquares extends BonusSqaure //This class is for the red squares that is used to remove points to player's score, the class extends from BonusSquare where that is the superclass 
//I pass in the values from the super class, so I won't have declare them again
{//Start of NegativeSquares Class
  PImage squarePointsNegative, squarePointsNegative2; //Where the image will be stored 
  NegativeSquares(int x, int y, int speedY) //Constructor of NegativeSquares
  {
    super(x,y,speedY); //values from the superclass are used in the contructor where the values are set the in main page 
    squarePointsNegative = loadImage("point2.png"); //Image is loaded
    squarePointsNegative2 = loadImage("pointMinus.png"); //Image is loaded
    squarePointsNegative.resize(25,25); //Resize of the image 
    squarePointsNegative2.resize(25,25); //Resize of the image 
  }

void move() //movement of the NegativeSquares
{
  if (this.y==0) //If Y is 0, then the NegativeSquares is at the top screen and then it should go back to the bottom and sprawned at random
  {
    this.y=height;
    x = postion[(int)random(0,4)];
  }
  else this.y -=1; // The direction of the NegativeSquares it goes up the screen
  if (this.x <=width+120 || this.x >=width-120) // Does not go past these pixels on the screen, stays within the lanes
  {
    speedX = -speedX; //speedX postion brings back within the distances 
  }
  x=x+speedX;
}

void render() //The display method
{
  if ((timer >=0) && (timer<=15)) //When the timer is between 0 and 15, then show the red box image
  {
    image(squarePointsNegative,this.x,this.y);
  }
   else if ((timer >15) && (timer <=30)) //When the the time is between 15 and 30 then show the minus in the red box image
  { 
    image(squarePointsNegative2,this.x,this.y);
  }
  else
  {
    timer=0; 
    image(squarePointsNegative2,this.x,this.y); //Wehn the timer is 0, it shows the plus in the red box image
  }
}
  
void delete()//The delete method
{//this menthod is called upon when the player colided with NegativeSquares then go forward by 200 in which that allow it to be sprawned at the bottom again at random
  this.y = -200;
}

void update()//Method use to call the move and render
{//This method is used so that whent the enmey car are called upon I won't have to write more lines of code, instead I just call the method 
  render();
  move();
}


}//End of NegativeSquares Class
