class Box {

    PVector location;
    int rotationAngle;
    color baseColor;
    PVector dimensions;
    String type;
    ArrayList<PVector> corners = new ArrayList<PVector>();
    PVector corner1;
    PVector corner2;
    PVector corner3;
    PVector corner4;

    int distanceFromOrigin = width / 2;

    Box(color inputColor) {
        location = new PVector(0, 0);
        dimensions = new PVector();
        dimensions.x = 640;
        dimensions.y = dimensions.x / 2;
        location.x += random(distanceFromOrigin);
        location.y += random(distanceFromOrigin);
        corner1 = new PVector(location.x, location.y);
        corner2 = new PVector(location.x + dimensions.x, location.y);
        corner3 = new PVector(location.x, location.y + dimensions.y);
        corner4 = new PVector(location.x + dimensions.x, location.y + dimensions.y);
        corners.add(corner1);
        corners.add(corner2);
        corners.add(corner3);
        corners.add(corner4);

        for (PVector corner : corners) {
          if (corner.x > width || corner.x < 0) {
            if (corner.y > height || corner.y < 0) {
              // rotationAngle = 0;
            } else {
                // rotationAngle = floor(random(0, 90));
            }
          }
        }



        baseColor = inputColor;

        if (random(1) > 0.5) {
            type = "Striped";
        } else {
            type = "Solid";
        }

        println(type);

    }

    void show() {
        blendMode(MULTIPLY);
        fill(baseColor);
        if (type.equals("Solid")) {
            pushMatrix();
            transformations();
            rect(location.x, location.y, dimensions.x, dimensions.y);
            popMatrix();
        }

        if (type.equals("Striped")) {
            pushMatrix();
            transformations();
            for (int i = 0; i < dimensions.y / 2; i += 3) {
                rect(location.x, location.y + i * 2 - dimensions.y / 2, dimensions.x, 3);
            }
            popMatrix();
        }

    }

    void transformations() {
        rotate(radians(rotationAngle));
    }

}
