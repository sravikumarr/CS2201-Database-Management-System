package project1;

public class AreaCalculator {
	    // Method to calculate the area of a square
	    public int calculateArea(int side) {
	        return side * side;
	    }

	    // Overloaded method to calculate the area of a rectangle
	    public int calculateArea(int length, int width) {
	        return length * width;
	    }

	    public static void main(String[] args) {
	        AreaCalculator calculator = new AreaCalculator();

	        // Calculate the area of a square
	        System.out.println("Area of square: " + calculator.calculateArea(5));  // Calls calculateArea(int side)

	        // Calculate the area of a rectangle
	        System.out.println("Area of rectangle: " + calculator.calculateArea(5, 7));  // Calls calculateArea(int length, int width)
	    }
	}

