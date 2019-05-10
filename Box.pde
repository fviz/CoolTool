class Box {

    PVector location;
    int rotationAngle;
    color baseColor;
    PVector dimensions;
    String type;

    int distanceFromOrigin = width / 2;

    Box(color inputColor) {
        location = new PVector(0, 0);
        dimensions = new PVector();
        dimensions.x = 640;
        dimensions.y = dimensions.x / 2;
        location.x += random(distanceFromOrigin);
        location.y += random(distanceFromOrigin);
        if (location.x + dimensions.x > width) {
            rotationAngle = 0;
        } else if (location.x + dimensions.x * 1.5 < 0) {
            rotationAngle = 0;
        } else {
            rotationAngle = floor(random(0, 90));
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
