///////////////////////////////////////////////
// Wave Particles Ver.1.00 @Astrisk_
///////////////////////////////////////////////

//---------------------------------------------
// Import
//---------------------------------------------
import com.jogamp.opengl.GL;
import com.jogamp.opengl.GL2ES2;

//---------------------------------------------
// Defined Class Instances 
//---------------------------------------------
PJOGL pgl;
GL2ES2 gl;

//---------------------------------------------
// Const Variable
//---------------------------------------------
public static final float RIGHT_VAL =  15;
public static final int   LINES_MAX = 120;
public static final int   RADIUS    =  20;

//---------------------------------------------
// Global Variable
//---------------------------------------------
public static float param;

//---------------------------------------------
// Setup
//---------------------------------------------
void setup() {
  size( 600, 600, P3D );
  background( 10, 20, 50 );
  hint( DISABLE_DEPTH_TEST ); // Disable to Z axis.
  blendMode( ADD ); // Add-mix.
}

//---------------------------------------------
// Draw
//---------------------------------------------
void draw() {
  background( 10, 20, 50 );
  stroke( random(50), random(240), random(240) );
  strokeWeight( 3 );

  translate( width / 2, height / 2 ); // Moving Center Position. 
  
  ///////////////// Using OpenGL ///////////////////////////////
  pgl = ( PJOGL )beginPGL();  
  gl  = pgl.gl.getGL2ES2();

  gl.glDisable( GL.GL_DEPTH_TEST );  
  gl.glEnable( GL.GL_BLEND );  
  gl.glBlendFunc( GL.GL_SRC_ALPHA, GL.GL_ONE );

  endPGL(); 
  //////////////////////////////////////////////////////////////
  
  for( int i = 0; i < LINES_MAX; i++ ){ 
    ellipse( midX( -param + i ), midY( -param + i ), RADIUS, RADIUS ); // Marks ∞
    ellipse( midX( -param + i ), midY( param + i ), RADIUS, RADIUS ); 
    ellipse( midX( param + i ), midY( -param + i ), RADIUS, RADIUS ); 
    
    strokeWeight( 2 );
    
    line( midX( -param + i ), midY( -param + i ), midX( param + i ), midY( param + i ) ); // Marks ∞
    line( midX( param + i ), midY( -param + i ), midX( -param + i ), midY( param + i ) ); // Marks ∞
  }
  param += 0.2;
}

//---------------------------------------------
// keyPressed
//---------------------------------------------
public void keyPressed(){  
  switch( key ){
    case 's': saveFrame("out-####.png"); break; 
    case 'e': exit(); 
    default : break;
  }
}

//-----------------------------------------------
// Function 
//-----------------------------------------------
public float startX( float param ) {
  return sin( param / RIGHT_VAL ) * 100 + sin( param / 5 ) * 20;
}

public float startY( float param ) {
  return cos( -param / RIGHT_VAL * 2 ) * 200;
}

public float midX( float param ) {
  param += param;
  return cos( param / RIGHT_VAL ) * 150 + cos( param / 5 ) * 20;
}

public float midY( float param ) {
  return sin( -param / RIGHT_VAL * 2) * 200;
}

public float endX( float param ) {
  return sin( -param / RIGHT_VAL ) * 100 + sin( param / 5 ) * 20;
}

public float endY( float param ) {
  return cos( param / RIGHT_VAL * 2 ) * 200;
}