class Spring
{
  //this is box2d object,we need to create
  MouseJoint mousejoint;
  
  Spring()
  {
    //at first it does`nt exist
    mousejoint=null;
  }
  
  //If it exist , we set to  target at muse location
  void update(float x,float y)
  {
      if(mousejoint!=null)
      {
        //convert to world coordintes
        Vec2 mouseworld=box2d.coordPixelsToWorld(x,y);
        mousejoint.setTarget(mouseworld);
      }
  }
  
  //this is th key function where spring attch the x,y location and Box object`s location
  void  bind(float x,float y,Box box)
  {
    //define the joint
    MouseJointDef md=new MouseJointDef();
    // Body A is just a fake ground body for simplicity (there isn't anything at the mouse)
    md.bodyA=box2d.getGroundBody();
    //body b is the box body
    md.bodyB=box.body;
    //get the mouselocation in world coordinatees
    Vec2 mp=box2d.coordPixelsToWorld(x,y);
    //and that is target
    md.target.set(mp);
    // Some stuff about how strong and bouncy the spring should be
    md.maxForce = 1000.0f * box.body.m_mass;
    md.frequencyHz = 5.0f;
    md.dampingRatio = 0.9f;
   
    //make the joint
    mousejoint=(MouseJoint) box2d.world.createJoint(md);
  
  }
  
  void display()
  {
    if(mousejoint!=null)
    {
      //we can get two anchor points
      Vec2 v1=null;
      mousejoint.getAnchorA(v1);
      Vec2 v2=null;
      mousejoint.getAnchorB(v2);
       //Convert them to screen coordinates
      v1 = box2d.coordWorldToPixels(v1);
      v2 = box2d.coordWorldToPixels(v2);
       //And just draw a line
      stroke(0);
      strokeWeight(1);
      
      line(v1.x,v1.y,v2.x,v2.y);
        
    }
  }
  //we can red of the joint when mouse is realesed
  void destroy()
  {
    if(mousejoint!=null)
    {
      box2d.world.destroyJoint(mousejoint);
      mousejoint=null;
    }
  }
}
