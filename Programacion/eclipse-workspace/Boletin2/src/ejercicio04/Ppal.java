package ejercicio04;

import java.io.IOException;

import ejercicio03.Leer;

public class Ppal {

	public static void main(String[] args) throws IOException {
		/*Leer un n�mero y mostrar por la salida est�ndar si dicho n�mero es o no par.*/
		
		int n1=0;
		n1 = Leer.datoInt();
		
		if (n1%2 == 0) {
			System.out.println("Felicidades tu n�mero es par");
		}
		else {
			System.out.println("Tu n�mero NO es par");
		}

	}

}
