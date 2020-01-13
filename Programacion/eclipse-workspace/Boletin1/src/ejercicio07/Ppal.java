package ejercicio07;

public class Ppal {

	public static void main(String[] args) {
		/*Realizar un programa que escriba el precio de un producto en una compra, una vez descontado
		el tanto por ciento de descuento, dando nosotros en la declaración de las variables el precio
		inicial y el tanto por ciento que se va a descontar. Ojo, el cálculo del tanto por ciento lo 
		debe hacer el programa no el usuario, por ejemplo:
		a) descuento= 20 %; y no descuento=0.2;*/
		
		double precio=1.40;
		double descuento=20;
		double cuenta=0.0;
		int cien=100;
		double precior=0.0;
		System.out.println("Hola buenas tarde hoy vamos a calcular el descuento de un pepino");
		
		
		cuenta=precio*descuento/cien;
		precior=precio-cuenta;
		
		/*%0.2f*/
		System.out.printf("El precio final del producto es %.2f € juuj8u: ",precior);
		System.out.println("El precio final del producto es: "+precior);
		System.out.println("enga nos vemo");

		
		
	}

}
