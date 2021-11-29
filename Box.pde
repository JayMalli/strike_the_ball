class Box
{
  float x;
  float y;
  float w;
  float h;
  Body body;
  color col=color(175);
  Box(float x_,float y_)
  {
    x=x_;
    y=y_;
    w=24;
    h=24;
    
    BodyDef bd=new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position=box2d.coordPixelsToWorld(x,y);
    body=box2d.createBody(bd);
    
    PolygonShape ps=new PolygonShape();
    float box2dW=box2d.scalarPixelsToWorld(w/2);
    float box2dH=box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
    FixtureDef fd=new FixtureDef();
    fd.shape=ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    body.setAngularVelocity(random(-5,5));
    body.setUserData(this);
  }
  

  void killBody()
  {
    //box2d.destroyBody(body);
  }
  
  void display()
  {
    Vec2 pos=box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rectMode(PConstants.CENTER);
    rotate(-a);
    fill(157);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
  }
  
   //boolean contains(float x, float y) {
   // Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
   // Fixture f = body.getFixtureList();
   // boolean inside = f.testPoint(worldPoint);
   // return inside;
   //}
 void changecol() {
    col = color(0,255, 255);
  }
}
