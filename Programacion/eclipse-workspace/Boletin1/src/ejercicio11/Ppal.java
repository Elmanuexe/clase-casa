package ejercicio11;

public class Ppal {

	public static void main(String[] args) {
		/*Escribir un programa que sirva para calcular el precio final de un producto. El cliente se lleva
		4 unidades del producto por lo que se le aplica un descuento del 20 % al precio total.*/
		
		double precio=0.50;
		int uds=4;
		double descuento=20;
		double cien=100;
		double cuenta=0.0;
		double cuentadesc=0.0;
		double precior=0.0;
		System.out.println("Hola buenas tarde hoy vamos a calcular el descuento de cuatro pepinos");
		
		cuenta=uds*precio;
		cuentadesc=cuenta*descuento/cien;
		precior=cuenta-cuentadesc;
		System.out.println("El precio final del producto es: "+precior);
		System.out.println("Enga nos vemo");
		
	}

}
