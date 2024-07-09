class Flower {
  PImage flower;  
  float x,y;
  Flower(float mx, float my){
    x=mx;
    y=my;
    flower = loadImage("flower.png");  
  }
  void show(){
    if(flowerSize<200){
      flowerSize+=10;
      if((mouseY-flowerSize/2)>120){
        image(flower, x-flowerSize/2, y-flowerSize/2,flowerSize,flowerSize);
      }
    }
  }
}
