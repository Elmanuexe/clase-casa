package ejercicio02;

import java.util.Random;

import ejercicio01.Leer;

public class Ppal {

	public static void main(String[] args) {
		int tiradas = 15, rep = 0, tirada = 0, n5 = 0;

		do {
			for (int i = 0; i < tiradas; i++) {
				Random rnd = new Random();
				tirada = rnd.nextInt(20) + 1;
				System.out.print(tirada+"   ");
				if(i==4) {
					System.out.println(" ");
				}
				if(i==9) {
					System.out.println(" ");
				}
				if(i==14) {
					System.out.println(" ");
				}
				if (tirada == 5) {
					n5++;
				}
			}
			System.out.println("\nHa salido " + n5 + " veces el número 5");
			System.out.println("Repetir programa?");
			System.out.println("1.SI 0.NO");
			rep = Leer.datoInt();
		} while (0 < rep);
	}

}
