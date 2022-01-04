class Car1 //This is the class for player (the user)
{ //Start of Car1 Class
  float x,y; //X and Y location, these are the varibles that I will pass through to the constructor so that I can set the values in my main page ("A1")
  PImage myCar, myCar2; // The car images are stored in these two varibles this is so that I can create animation for my car 
  
  Car1 (float x, float y)//This is the constructor for the car 
  {
    this.x = x; //On the main page I will need to set values for the x and y
    this.y = y;
    myCar = loadImage("myCarMainR.png"); //I have loaded my car image into myCar
    myCar2 = loadImage("myCarMainLights.png"); //I have loaded my second car image into myCar2, this is so that I can call upon the second image to create an animation effect
    myCar.resize(85,120); //I have resized both of the car images
    myCar2.resize(85,120);  
  }


void render() //This is method to display the cars on screen,
{ // The timer is a global varible set in the main page
  if((timer >=0) && (timer<=15)) //If the times is less than 15, then show image my first car image (myCar)
  {
    image(myCar,x,y);
  }
  else if ((timer >15) && (timer <=30)) //Else if the times is more than 15 but less than 30, then show image my second car image (myCar2)
  { 
    image(myCar2,x,y);
  }
  else
  {
    timer=0; //Else if the timer is 0 then show my second car images, the second car images has the lights coloured to show an animation effect of the car flickering on/off
    image(myCar2,x,y);
  }
}

boolean collide(BonusSqaure other) //The boolean crash will be used to perform the collision used to keep the scoring
  {
    return(abs(this.x-other.x)<35 && abs(this.y-other.y)<35);
  }
  
boolean collideNegative(NegativeSquares other) //the boolean crash will be used to perform the collision used to keep the scoring
  {
    return(abs(this.x-other.x)<35 && abs(this.y-other.y)<35);
  }


}//End of Car1 Class
  
  
