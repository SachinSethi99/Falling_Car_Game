class EnmeyCar //This is my EnemyCar class and it contains the cars that the player has to void
{//Start of the EnmeyCar Class
  float x; //X location, aribles I have set, in which I will pass the x and y through the constructor
  float y; //Y loation
  //float size; 
  PImage carImg; //The images of the car will be stored in carImg
  int imageCounter; //I used an image counter to allow me to load the images under one varible
  float speed; // I have set the speed 1, if I pass it through the constructor only one set of cars would appear 
  float w; //Varibles used to store the image height and width for my collsion method
  float h;
  
  EnmeyCar(float x,float y) //The constructor for EnmeyCar
  {
    this.x = x; //X and Y values I will set in the main page
    this.y = y;
    speed = 1; //I have set the speed of the EnmeyCars to 1
    imageCounter = (int)random(2,6); //The imagecounter allows the varible carImg to load which ever car to show at random becuase the car images are in number format
    carImg = loadImage("car" + imageCounter + ".png"); //Images car loaded at random 
    carImg.resize(90,120); //All images are resized to these values
    w=carImg.width; //I image width and height are stored here and will be used to prevent overlapping (this is show in the main page)
    h=carImg.height; 
  }

void move() //The movement method
{
  y+= speed;  //Goes down by 1, in the Y direction going down
  if (y >height) //If the image goes to the bottom of the screen then set it back to 0 and the cars sprawn at random again
  {
    y= 0;
    x=carPostion[(int)random(0,4)];
  } 
}
  
void render() //The display method
{ //If the image counter less than 20, then show the image of the enmey car
  if (imageCounter <= 20)
  image(carImg,x,y);
}

void update() //Method use to call the move and render
{ //This method is used so that whent the enmey car are called upon I won't have to write more lines of code, instead I just call the method 
  move();
  render();
}


}//End of the EnmeyCar Class








  
  
  
  
 
