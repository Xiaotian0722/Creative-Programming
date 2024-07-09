String pic_name="line";          
PFont font;            
int strokeSize=1;       
color strokeColor;    
color backColor;  
int key_d_=0;      
String filename;    
float x1,x2,y1,y2;      
int j1=0;      
int j2=0;      
int d_;        
int move_circle_d=0;        
float rcx1,rcx2,rcy1,rcy2;      
int rcj1=0;      
int rcj2=0;      
int rcd_;  
float csx,csy;
int csj=0;
int csd_;
int line_count=6;      
float flowerSize=50;  
PShape s;    
float jiaodu;    
float size=0;    
color colora=color(random(0,120),random(0,120),random(0,100));    
PImage[] img=new PImage[13];
MoveCircle[] mcs=new MoveCircle[0];

void setup(){
  background(255);
  colorMode(HSB, 100);    
  backColor=color(0,0,120);      
  fill(backColor);
  rect(-1,121,1001,680);
  size(1000,800);
  font=createFont("KaiTi-48.vlw",30);    
  textFont(font);        
  textSize(30);
  frameRate(30);
  for(int i=0;i<13;i++){
    img[i]=loadImage(i+".png");
  }

  s=createShape();
  s.beginShape();
  s.fill(0);
  s.noStroke();
  for(int i=-40;i<=40;i++){
   s.vertex(i,-i*i/10*0.6); 
  }
  for(int i=40;i>=-40;i--){
   jiaodu=map(i,40,-40,30,150);
   s.vertex(i,-112-40*(sin(radians(jiaodu))-0.5));
  }
  s.endShape();

  fill(0);
  line(0,120,1000,120);
  line(210,0,210,120);
  line(210,60,500,60);
  line(500,0,500,120);
  line(750,0,750,120);
  line(610,0,610,120);
  line(860,0,860,120);
  image(img[1],110,15,90,90);   
  image(img[2],220,5,50,50);    
  image(img[3],275,5,50,50);    
  image(img[4],330,5,50,50);    
  image(img[5],385,5,50,50);    
  image(img[6],440,5,50,50);    
  image(img[7],220,65,50,50);   
  image(img[8],275,65,50,50);   
  image(img[9],330,65,50,50);    
  image(img[10],510,10,90,90);   
  image(img[11],760,10,90,90);  

  noFill();
  rect(385,60,105,60);
  text("  Help",385,100);

  strokeColor=color(0,0,0);

  for (int i = 0; i < 120; i++) {
    for (int j = 0; j < 100; j++) {
      stroke(i, j, 120);
      point(620+i, 10+j);
    }
  }
  for (int i = 0; i < 120; i++) {
    for (int j = 0; j < 100; j++) {
      stroke(i, j, 120);
      point(870+i, 10+j);
    }
  }
}
void draw(){
  fill(0,0,120);
  noStroke();
  rect(0,0,52,52);
  image(img[0],10,15,90,90);    //save
  ShapeType st=new ShapeType(pic_name);    
  st.drawShape();     
  mouseStyle();
}
void mouseReleased()  {
//change the pic_name and the button's color when clicking it
  if(mouseX>220&&mouseX<270&&mouseY>5&&mouseY<55){
    pic_name="line";              
  }else if(mouseX>275&&mouseX<325&&mouseY>5&&mouseY<55){
    pic_name="random_circle";      
  }else if(mouseX>330&&mouseX<380&&mouseY>5&&mouseY<55){
   pic_name="move_circle";       
  }else if(mouseX>385&&mouseX<435&&mouseY>5&&mouseY<55){
   pic_name="rect";              
  }else if(mouseX>440&&mouseX<490&&mouseY>5&&mouseY<55){
   pic_name="radius_rect";     
  }else if(mouseX>220&&mouseX<270&&mouseY>65&&mouseY<115){
   pic_name="center_shape";   
  }else if(mouseX>275&&mouseX<325&&mouseY>65&&mouseY<115){
   pic_name="flower";          
  }else if(mouseX>330&&mouseX<380&&mouseY>65&&mouseY<115){
   pic_name="color_flower";      
  }
  else if(mouseX>870&&mouseX<990&&mouseY>10&&mouseY<110){
    strokeColor=color(mouseX-870,mouseY-10,120);      
  }else if(mouseX>620&&mouseX<740&&mouseY>10&&mouseY<110&&key_d_==0){     
   backColor=color(mouseX-620,mouseY-10,120); 
   fill(backColor);
   noStroke();
   rect(-1,121,1001,680); 
   mcs=new MoveCircle[0];    
  }else if(mouseX>385&&mouseX<490&&mouseY>60&&mouseY<120){
   openHelp();               
  }else if(mouseX>120&&mouseX<210&&mouseY>15&&mouseY<105){
    selectOutput("Please select a folder:","selectFile");        
  }else if(mouseX>10&&mouseX<100&&mouseY>15&&mouseY<105){
    if(filename==null){
      selectOutput("Please select a folder:","selectFile_");      
    }else{
      save(filename); 
    }
  }
}

void selectFile(File selection){
  if(selection==null){
  }else{    
    if(selection.getAbsolutePath().indexOf(".")>0){  
      save(selection.getAbsolutePath());       
    }else{
      save(selection.getAbsolutePath()+".jpg");  
    }
  }
}

void selectFile_(File selection){
  if(selection==null){
  }else{    
    if(selection.getAbsolutePath().indexOf(".")>0){   
      save(selection.getAbsolutePath());       
      filename=selection.getAbsolutePath();      
    }else{
      save(selection.getAbsolutePath()+".jpg");    
      filename=selection.getAbsolutePath()+".jpg";     
    }
  }
}

//keyboard
void keyReleased(){
  char k=key;
  switch(k){
    case 'c':
      fill(backColor);
      noStroke();
      rect(-1,121,1001,680); 
      mcs=new MoveCircle[0];
      break;
    case 'C':
      fill(backColor);
      noStroke();
      rect(-1,121,1001,680); 
      mcs=new MoveCircle[0];
      break;
    case 'h':
      openHelp();
      break;
    case 'H':
      openHelp();
      break;
    case '0':
      strokeSize=0;
      break;
    case '1':
      strokeSize=1;
      break;
    case '2':
      strokeSize=2;
      break;
    case '3':
      strokeSize=3;
      break;
    case '4':
      strokeSize=4;
      break;
    case '5':
      strokeSize=5;
      break;
    case '6':
      strokeSize=6;
      break;
    case '7':
      strokeSize=7;
      break;
    case '8':
      strokeSize=8;
      break;
    case '9':
      strokeSize=9;
      break;
    case 'w':
      line_count+=1;
      break;
    case 's':
      line_count-=1;
      break;
  }
}

//open and close help
void openHelp(){
  if(key_d_==0){
        //Use a rectangle to cover the area with the background color, and then load the helper image on it
        noStroke();
        fill(0,0,120);
        rect(510,0,230,120);
        image(img[12],510,10,230,100);
        key_d_=1; 
      }
   else{
        noStroke();
        fill(0,0,120);
        rect(510,10,230,110);
        stroke(0,0,0);
        strokeWeight(1);
        line(610,0,610,120);
        for (int i = 0; i < 120; i++) {
          for (int j = 0; j < 100; j++) {
            stroke(i, j, 120);
            point(620+i, 10+j);
          }
        }
        image(img[10],510,10,90,90);    
        key_d_=0; 
      }
}

//mouseStyle
void mouseStyle(){
  if(mouseX>220&&mouseX<270&&mouseY>5&&mouseY<55){
    cursor(HAND);
  }else if(mouseX>275&&mouseX<325&&mouseY>5&&mouseY<55){
    cursor(HAND);
  }else if(mouseX>330&&mouseX<380&&mouseY>5&&mouseY<55){
   cursor(HAND);
  }else if(mouseX>385&&mouseX<435&&mouseY>5&&mouseY<55){
   cursor(HAND);
  }else if(mouseX>440&&mouseX<490&&mouseY>5&&mouseY<55){
   cursor(HAND);
  }else if(mouseX>220&&mouseX<270&&mouseY>65&&mouseY<115){
   cursor(HAND);
  }else if(mouseX>275&&mouseX<325&&mouseY>65&&mouseY<115){
   cursor(HAND);
  }else if(mouseX>330&&mouseX<380&&mouseY>65&&mouseY<115){
   cursor(HAND);
  }else if(mouseX>870&&mouseX<990&&mouseY>10&&mouseY<110){
    cursor(CROSS);
  }else if(mouseX>620&&mouseX<740&&mouseY>10&&mouseY<110&&key_d_==0){      
   cursor(CROSS);
  }else if(mouseX>385&&mouseX<490&&mouseY>60&&mouseY<120){
   cursor(HAND); 
  }else if(mouseX>120&&mouseX<210&&mouseY>15&&mouseY<105){
    cursor(HAND);
  }else if(mouseX>10&&mouseX<100&&mouseY>15&&mouseY<105){
    cursor(HAND);
  }else{
   cursor(ARROW); 
  }
}
