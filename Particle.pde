class Particle
{
  Body body;
  float x;
  float y;
  float r;
  color col=color(175);
  Particle(float x_,float y_,float r_)
  {
    x=x_;
    y=y_;
    r=r_;
    
    BodyDef bd=new BodyDef();
    bd.type=BodyType.DYNAMIC;
    bd.position=box2d.coordPixelsToWorld(x,y);
    body=box2d.createBody(bd);
    
   CircleShape cs=new CircleShape();
    cs.m_radius=box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd=new FixtureDef();
    fd.shape=cs;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;

    body.createFixture(fd);
    body.setAngularVelocity(random(-10,10));
    body.setUserData(this);
  }
  
  void display()
  {
    Vec2 pos=box2d.getBodyPixelCoord(body);
    float a=body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    line(0,0,r,0);
    popMatrix();
  }
  
  
  
  void killBody()
  {
    box2d.destroyBody(body);
  }
  
  boolean done()
  {
    Vec2 pos=box2d.getBodyPixelCoord(body);
    if(pos.y>height+r*2)
    {
      killBody();
      return true;
    }
    return false;
  }
  
  void change() {
    col = color(255, 0, 0);
  }
  
  void changecol() {
    col = color(0,255, 0);
  }
  
}
