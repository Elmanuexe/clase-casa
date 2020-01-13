package ejercicio08;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {

		/*
		 * Leer una secuencia de 10 números y mostrar solo la suma y el producto de
		 * todos ellos.
		 */

		int n1;
		int suma = 0;
		int prod = 1;

		int salir = 0;
		do {
			System.out.println(
					"Este preograma muestra la suma y el producto de 10 números, por favor introduce dichos números");

			for (int i = 0; i < 10; i++) {
				n1 = Leer.datoInt();
				suma = suma + n1;
				prod = prod * n1;

			}

			System.out.println("Esta es la suma de tus 10 números: " + suma);
			System.out.println("Este es el producto de tus 10 números: " + prod);
			System.out.println("PARA SALIR DEL PROGRAMA PULSE: 0");
			salir = Leer.datoInt();

		} while (salir != 0);

	}

}
