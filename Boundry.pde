class Boundry
{
  Body body;
  float x;
  float y;
  float w;
  float h;
  
  Boundry(float x_,float y_,float w_,float h_)
  {
    
    x=x_;
    y=y_;
    w=w_;
    h=h_;
    
    BodyDef bd=new BodyDef();
    bd.type=BodyType.STATIC;
    bd.position=box2d.coordPixelsToWorld(x,y);
    body=box2d.createBody(bd);
    
    PolygonShape pd=new PolygonShape();
    float box2dW=box2d.scalarPixelsToWorld(w/2);
    float box2dH=box2d.scalarPixelsToWorld(h/2);
    pd.setAsBox(box2dW,box2dH);
    body.createFixture(pd,1);
    body.setUserData(this);
  }
  
  void display()
  {
    fill(0);
    stroke(0);
    rect(x,y,w,h);
   }
  
}
