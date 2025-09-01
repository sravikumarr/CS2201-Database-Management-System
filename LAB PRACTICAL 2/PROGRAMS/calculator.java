package project1;

public class calculator {
	int add(int a, int b) {
		return a+b;
	}
	
	int subtract(int a , int b) {
		return a-b;
	}
	
	public static void main(String[]args) {
		calculator calc = new calculator();
		System.out.println("Addition:" + calc.add(10, 5));
		System.out.println("Subtration:" + calc.subtract(10, 5));
	}
}
