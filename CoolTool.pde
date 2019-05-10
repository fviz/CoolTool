ArrayList<Box> boxesList;
float increment = 0.02;

void setup() {
        size(1024, 1024);
        frameRate(60);
        pixelDensity(2);
        noStroke();
        // translate(width/2, height/2);
        background(255);
        colorMode(HSB);

        boxesList = new ArrayList<Box>();

        color colorA = color(random(255), 255, random(50) + 150);
        color colorB = color(random(255), 255, random(50) + 150);


        for (int i = 0; i < 4; i++) {
                Box newBox;
                if (random(1) > 0.5) {
                        newBox = new Box(colorA);
                } else {
                        newBox = new Box(colorB);
                }
                boxesList.add(newBox);
        }

        float hue = hue(colorA);
        fill(hue, 30, 255);
        rect(20+random(-5, 5), 20+random(-5, 5), width-40, height-40);


        println(boxesList.size());
}

void draw() {
        noLoop();

        pushMatrix();
        for (Box currentBox : boxesList) {
                currentBox.show();
        }
        popMatrix();

        loadPixels();

        float xoff = 0.0; // Start xoff at 0
        float detail = map(mouseX, 0, width, 0.1, 0.6);
        noiseDetail(8, detail);

        // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
        for (int x = 0; x < width; x++) {
                xoff += increment; // Increment xoff
                float yoff = 0.0; // For every xoff, start yoff at 0
                for (int y = 0; y < height; y++) {
                        yoff += increment; // Increment yoff

                        // Calculate noise and scale by 255
                        float bright = noise(xoff, yoff) * 255;

                        // Try using this line instead
                        // float bright = random(0,255);

                        // Set each pixel onscreen to a grayscale value

                }
        }

        updatePixels();
}
