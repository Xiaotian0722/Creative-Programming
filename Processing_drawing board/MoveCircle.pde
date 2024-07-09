class MoveCircle{
 float x,y,x1,y1;
 float xspeed,yspeed;
 color circleColor;
 int size;
 MoveCircle(float a,float b,color c,int d){
   x=a;
   y=b;
   circleColor=c;    
   size=d+1;      
   xspeed=random(-1,1);
   yspeed=random(-1,1);
 }
 void move(){
   if(millis()%1000<10||millis()%1000>990&&millis()%1000<1000){
       xspeed=random(-1,1);
       yspeed=random(-1,1);
     }
   x+=xspeed;
   y+=yspeed;
   fill(backColor);
   ellipse(x1,y1,10*size+2,size*10+2);  
   if(y-25>140){
     fill(circleColor);
     ellipse(x,y,size*10,size*10);
     x1=x;y1=y;
   }
 }
}
