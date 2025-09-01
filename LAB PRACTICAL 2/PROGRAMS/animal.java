package project1;

public class animal {
	void sound() {
		System.out.println("Animal makes a sound");
	}
}

class Dog extends animal{
	void sound() {
		System.out.println("Dog barks");
	}
	
	public static void main(String[]args) {
		Dog d = new Dog();
		d.sound();
	}
}
