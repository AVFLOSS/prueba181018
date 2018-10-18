//<>// //<>// //<>//

import processing.video.*; 
Movie peli;


void setup() {
  size(1280, 720);
  frameRate(30);
  peli = new Movie(this, "street.mp4");
  peli.loop();
  colorMode (HSB, 360, 100, 100);
  background(0);
}

void draw() {
  if (peli.available() == true) {
    peli.read();
    
    loadPixels();

    // We must also call loadPixels() on the PImage since we are going to read its pixels.
    peli.loadPixels();


    for (int y = 0; y < height; y++ ) {
      for (int x = 0; x < width; x++ ) {
        int loc = x + y*width;
        int loc5 = (x-5) + y*width;
        int loc4 = (x-4) + y*width;
        int loc3 = (x-3) + y*width;
        int loc2 = (x-2) + y*width;
        int loc1 = (x-1) + y*width;

        color co = peli.pixels [loc];
        float h = hue(co); 
        float s = saturation(co);
        float b = brightness(co);
        float a = alpha(co);

        // Image Processing would go here
        // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.
        if (b >45 && x > 5) {
          peli.pixels[loc5] = color(h, s, b);
          peli.pixels[loc4] = color(h, 90, b-10);
          peli.pixels[loc3] = color(h, 80, b-20);
          peli.pixels[loc2] = color(h, 70, b-30);
          peli.pixels[loc1] = color(h, 60, b-40);
          peli.pixels[loc] = color(h, 50, b-50);
        }



        // Set the display pixel to the image pixel
        //  color nuevoCol = color(100, s, b, 50);
        // pixels[loc] = nuevoCol;
      }
    }
    peli.updatePixels();

    updatePixels();

   image(peli, 0, 0);
  }
  // noLoop();
}
