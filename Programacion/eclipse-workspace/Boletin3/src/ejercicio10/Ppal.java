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

		
		Sala s1= new Sala();
		Ticket t1 = new Ticket(3.2, "1", true, "0A");
		s1.getPelicula()[0] = "Star wars";
		s1.getPelicula()[1] = "Piratas del caribe";
		s1.getPelicula()[2] = "Jurassic park";
		s1.getPelicula()[3] = "Regreso al futuro";
		s1.getPelicula()[4] = "El viaje de chihiro";
		
		do {
			System.out.println("\nBienvenido a tu cine de confianza seleccione que quiere hacer");
			System.out.println("1. Ver cartelera");
			System.out.println("2. Comprar entrada/s");
			System.out.println("3. Mostrar precio a pagar");
			System.out.println("4. Calcular ganancias del dia\n");
			switch (Leer.datoInt()) {
			case 1:
				s1.mostrarCartel();
				break;
			case 2:
				System.out.println("¿Cuantas entradas quieres?");
				s1.setNumero(Leer.datoInt());
				break;
			case 3:
				System.out.println("Precio por las entradas: ");
				System.out.println(s1.calcularTotal(t1)+"€");
				
				System.out.println("Inserte el dinero que va a introducir");
				s1.setPago(Leer.datoDouble());
				s1.sumaRecaudacion(t1);

				System.out.printf("Aquí está su vuelta %.2f\n", s1.calcularVuelta(t1));
				break;
			case 4:
				System.out.println("Se ha recaudado hoy un total de: "+s1.getRecaudacion());
				break;
			}

		} while (1 > 0);
	}

}
