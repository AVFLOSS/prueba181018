 //<>// //<>// //<>//
PImage img;


void setup() {
  size(720, 960);
  img = loadImage("pixel_test.jpg");
  colorMode (HSB, 360, 100, 100);
  background(0);
}

void draw() {
  loadPixels();

  // We must also call loadPixels() on the PImage since we are going to read its pixels.
  img.loadPixels();
   
 
  for (int y = 0; y < height; y++ ) {
    for (int x = 0; x < width; x++ ) {
      int loc = x + y*width;
      int loc5 = (x-5) + y*width;
      int loc4 = (x-4) + y*width;
      int loc3 = (x-3) + y*width;
      int loc2 = (x-2) + y*width;
      int loc1 = (x-1) + y*width;

      color co = img.pixels [loc];
      float h = hue(co); 
      float s = saturation(co);
      float b = brightness(co);
      float a = alpha(co);

      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.
      if (b >52 && x > 5) {
        img.pixels[loc5] = color(h, s, b);
        img.pixels[loc4] = color(h, s, b-10);
        img.pixels[loc3] = color(h, s, b-20);
        img.pixels[loc2] = color(h, s, b-30);
        img.pixels[loc1] = color(h, s, b-40);
        img.pixels[loc] = color(h, s, b-50);
      }



      // Set the display pixel to the image pixel
    //  color nuevoCol = color(100, s, b, 50);
     // pixels[loc] = nuevoCol;
    }
  }
  img.updatePixels();

  updatePixels();

  image(img, 0, 0);
  noLoop();
}
