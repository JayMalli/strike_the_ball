import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;

Box2DProcessing box2d;

Box box;

ArrayList <Boundry> boundries;

ArrayList <Particle> particles;
float size;

Spring spring;

void setup()
{
  size(640,360);
  box2d=new Box2DProcessing(this);
  box2d.createWorld();
  box=new Box(width/2,height/2);
  particles=new ArrayList<Particle>();
  
  //Make a spring ,it does`nt intiallize until mouseis clicked 
  spring=new Spring();
  spring.bind(width/2,height/2,box);
  
  // Add a listener to listen for collisions!
  box2d.world.setContactListener(new CustomListener());
 
  boundries=new ArrayList<Boundry>();
  boundries.add(new Boundry(0,0,30,2*height));
  boundries.add(new Boundry(width,0,30,2*height));

}

// Perlin noise values
float xoff = 0;
float yoff = 1000;
void draw()
{
  background(255);
  box2d.step();
  //display rectangle
  box.display();
  
  //for particles
  if(random(2)<0.2)
  {
    size=random(4,8);
    
    particles.add(new Particle(width/2,-20,size));

  }
  
  for( int i=particles.size()-1;i>=0;i--)
  {
    Particle p=particles.get(i);
    p.display();
    if( p.done())
    {
      particles.remove(i);
    }
  }
  // Make an x,y coordinate out of perlin noise
  float x = noise(xoff)*width;
  float y = noise(yoff)*height;
  xoff += 0.01;
  yoff += 0.01;

  
  if(mousePressed)
  {
    spring.update(mouseX,mouseY);
  }
  else
  {
    spring.update(x,y);
  }
  
  for(Boundry b:boundries)
  {
    b.display();  
  } 
}
