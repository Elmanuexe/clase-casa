package ejercicio10;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {

		/*
		 * Hacer un programa para gestionar un cine con una sola sala. Cada entrada de
		 * cine tendrá un número identificativo, precio, si está libre o vendida, número
		 * de la fila y de butaca.
		 * 
		 * Todas las funcionalidades estarán en la clase Sala.
		 * 
		 * Se darán al usuario las siguientes opciones en un switch: 
		 * Ver cartelera que mostrará el título de la película proyectada ese día.
		 * Comprar entrada (una o varias) comprobando si una localidad está vendida ya anteriormente.
		 * Mostrar precio total a pagar.
		 * Calcular ganancias totales del día.
		 */

		do {
			System.out.println("Bienvenido a tu cine de confianza seleccione que quiere hacer");
			System.out.println("1. Ver cartelera");
			System.out.println("2. Comprar entrada/s");
			System.out.println("3. Mostrar precio a pagar");
			System.out.println("4. Calcular ganancias del dia");
			switch (Leer.datoInt()) {
			case 1:
				
				break;
			case 2:
				
				break;
			case 3:
				
				break;
			case 4:
				
				break;
			}

		} while (1 > 0);
	}

}
