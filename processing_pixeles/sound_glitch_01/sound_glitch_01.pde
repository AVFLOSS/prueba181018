
PImage img;


void setup() {
  size(640, 480);
  img = loadImage("pixel_test.jpg");
  colorMode (HSB,360, 100, 100);
  background(0);
  
  
}

void draw() {
  loadPixels();

  // Tambien cargamos píxeles de la imagen
    img.loadPixels();
 
    for (int i = 0; i< img.pixels.length; i++) {
      int co = img.pixels[i];
      
      float h = hue(co);
      float s = saturation(co);
      float b = brightness(co);
      float a = alpha(co);

      
      if( h > 0 && h < 30 ){
        color nuevoco = color( h, s, b, 0);
        img.pixels[i] = nuevoco;
      }
      
      
      
      
    }
      img.updatePixels();
     //<>//
  updatePixels();
  
  image(img, 0, 0); //<>//
  noLoop();
}
