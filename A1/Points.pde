class BonusSqaure //This class is for the green squares that is used to add points to player's score
{ //Start of BonusSqaure Class
  int x,y; //Variables declared that will be used to add to the constructor 
  int speedX, speedY; //Varibles to set the speed in the X and Y directions 
  PImage squarePoints, squarePoints2; //Where the image will be stored 
  
  BonusSqaure (int x, int y, int speedY) //Constructor of the BonusSqaure
 {
   this.x = x; //The X, Y and speedY varibles will have their values set in the main page
   this.y = y;
   this.speedY = speedY;
   squarePoints = loadImage("point.png"); //Image is loaded
   squarePoints2 = loadImage("pointPlus.png");//Image is loaded
   squarePoints.resize(25,25); //Resize of the image 
   squarePoints2.resize(25,25); //Resize of the image 
 }
 
void move() //movement of the BonusSquare
 {
   if (this.y==0) //If Y is 0, then the BonusSqaure is at the top screen and then it should go back to the bottom and sprawned at random
   {
     this.y=height;
     x = postion[(int)random(0,4)];
   }
   else this.y -=1; // The direction of the BonusSqaure, it goes up the screen
   if (this.x <=width+120 || this.x >=width-120) // Does not go past these pixels on the screen, stays within the lanes 
   {
     speedX = -speedX; //speedX postion brings back within the distances 
   }
   x=x+speedX;
 }

void render() //The display method
{
  if ((timer >=0) && (timer<=15)) //When the timer is between 0 and 15, then show the green box image
  {
    image(squarePoints,x,y);
  }
   else if ((timer >15) && (timer <=30)) //When the the time is between 15 and 30 then show the plus in the green box image
  { 
    image(squarePoints2,x,y);
  }
  else
  {
    timer=0; 
    image(squarePoints2,x,y); //Wehn the timer is 0, it shows the plus in the green box image
  }
}
  
  
  

void delete() //The delete method
{ //this menthod is called upon when the player colided with BonusSpares then go forward by 200 in which that allow it to be sprawned at the bottom again at random
  this.y = -200; 
}

void update()//Method use to call the move and render
{ //This method is used so that whent the enmey car are called upon I won't have to write more lines of code, instead I just call the method 
   render();
   move();
 }
 
 
}//End of BonusSqaure Class




 
 
 
 
 

   
   
   
   
   
   

   
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
