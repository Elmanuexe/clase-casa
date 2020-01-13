package ejercicio08;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*Realizar un programa que nos ayude a calcular el dinero gastado en gasolina en un viaje.
		 * Para ello, daremos los kilómetros recorridos, el consumo del coche a los 100 Km y el precio por
		litro de gasolina */
		
		double km=0.0;
		double consumo100=0.0;
		double precioL=1.32;
		double consumototal=0.0;
		double gasto=0.0;
		
		System.out.println("Hey que tal estamo, hoy vamos a ver cuanto te has gastado iendo a la playa");
		System.out.println("Inserte cuantos Km ha recorrido y cuanto consume su choche cada 100Km (Por ese orden)");
		
		km=Leer.datoDouble()/100;
		consumo100=Leer.datoDouble();
	
		consumototal=km*consumo100;
		System.out.println("Has consumido un total de: "+consumototal+"L");
		gasto=consumototal*precioL;
		
		System.out.println("Te has gastado un total de "+gasto+"€ en tu viaje");
	}

}
