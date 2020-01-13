package ejercicio05;

import java.io.IOException;

public class Ppal {

	public static void main(String[] args) throws IOException {
		/*
		 * Mostrar en pantalla un menú de un cine con 4 salas y las películas que se
		 * proyectan en cada una. Se debe leer la sala deseada y mostrar: a. Un mensaje
		 * con el precio de la entrada, que será diferente en cada sala (por ejemplo,
		 * sala vip, sala 3D, sala normal y sala para niños). b. Pedir el número de
		 * entradas. c. Calcular el precio final y mostrarlo.
		 */

		int pelicula = 0;
		int sala = 0;
		int cant = 0;
		double precio = 0.0;
		double VIP = 9.0;
		double D3 = 7.0;
		double NORMAL = 5.0;
		double NINOS = 3.0;

		
		do {
			System.out.println("SELECCIONA UNA PELÍCULA:");
			System.out.println("0. SALIR DEL PROGRAMA");
			System.out.println("1. PIRATAS DEL CARIBE");
			System.out.println("2. STAR WARS");
			System.out.println("3. JURASSIC PARK");
			System.out.println("4. REGRESO AL FUTURO");
			
			pelicula = Leer.datoInt();
			switch (pelicula) {
			case 0:
				System.out.println("SALIENDO DEL PROGRAMA...\n");
				break;
			case 1:
				System.out.println("SELECCIONE UNA SALA PARA PIRATAS DEL CARIBE:");
				break;
			case 2:
				System.out.println("SELECCIONE UNA SALA PARA STAR WARS:");
				break;
			case 3:
				System.out.println("SELECCIONE UNA SALA PARA JURASSIC PARK:");
				break;
			case 4:
				System.out.println("SELECCIONE UNA SALA PARA REGRESO AL FUTURO:");
				break;
			default:
				System.out.println("Por favor inserte un número del 1 al 4");
			}
		} while ( pelicula != 0);
		
		
		
		
		
		
		
		/*

		System.out.println("1. SALA VIP " + VIP + "€");
		System.out.println("2. SALA 3D " + D3 + "€");
		System.out.println("3. SALA NORMAL " + NORMAL + "€");
		System.out.println("4. SALA PARA NI�OS " + NINOS + "€");

		do {
			sala = Leer.datoInt();
			switch (sala) {
			case 1:
				precio = VIP;
				break;
			case 2:
				precio = D3;
				break;
			case 3:
				precio = NORMAL;
				break;
			case 4:
				precio = NINOS;
				break;
			default:
				System.out.println("Por favor inserte un número del 1 al 4");
			}
		} while (sala > 4);

		System.out.println("CUANTAS ENTRADAS QUIERE?");
		cant = Leer.datoInt();

		System.out.println("EL TOTAL A PAGAR ES DE: " + cant * precio + "€");
		
		*/
	}
}
