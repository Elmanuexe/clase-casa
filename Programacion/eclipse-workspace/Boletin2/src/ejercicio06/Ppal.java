package ejercicio06;

import java.io.IOException;

public class Ppal {

	public static void main(String[] args) throws IOException {
		/*
		 * Realizar un programa dirigido por men�s que solicite el peso de una persona,
		 * y escriba por pantalla su peso en cualquier planeta del Sistema Solar. Las
		 * equivalencias son las siguientes (basta con multiplicar el peso de la persona
		 * en la tierra por la constante de equivalencia): PLANETA Mercurio Venus Tierra
		 * Marte J�piter Saturno Urano Neptuno EQUIVALENCIA 0.38 0.91 1.00 0.38 2.53
		 * 1.06 0.92 1.2
		 */

		double pesoMer = 0.38;
		double pesoVen = 0.91;
		double pesoTie = 1.00;
		double pesoMar = 0.38;
		double pesoJup = 2.53;
		double pesoSat = 1.06;
		double pesoUra = 0.92;
		double pesoNep = 1.2;
		int planeta;


		do {
		System.out.println(
				"Este programa sirve para calcular la equivalencia de tu peso en los diferentes planetas del Sistemas Solar");
		System.out.println("Por favor introduzca su peso...");

		double peso = 0.0;
		peso = Leer.datoDouble();

		System.out.println(
				"Ahora introduzca el planeta: 1.Mercurio 2.Venus 3.Tierra 4.Marte 5.Júpiter 6.Saturno 7.Urano 8.Neptuno");


			planeta = Leer.datoInt();

			switch (planeta) {
			case 0:
				
				break;
			case 1:
				System.out.println("Tu peso en Mercurio sería de: " + peso * pesoMer + "Kg\n");
				break;
			case 2:
				System.out.println("Tu peso en Venus sería de: " + peso * pesoVen + "Kg\n");
				break;
			case 3:
				System.out.println("Tu peso en la Tierra sería de: " + peso * pesoTie + "Kg\n");
				break;
			case 4:
				System.out.println("Tu peso en Marte sería de: " + peso * pesoMar + "Kg\n");
				break;
			case 5:
				System.out.println("Tu peso en Jupiter sería de: " + peso * pesoJup + "Kg\n");
				break;
			case 6:
				System.out.println("Tu peso en Saturno sería de: " + peso * pesoSat + "Kg\n");
				break;
			case 7:
				System.out.println("Tu peso en Urano sería de: " + peso * pesoUra + "Kg\n");
				break;
			case 8:
				System.out.println("Tu peso en Neptuno sería de: " + peso * pesoNep + "Kg\n");
				break;

			default:
				System.out.println("Selecciona uno de los planetas por favor");
			}
		} while (planeta != 0);
	}
}
