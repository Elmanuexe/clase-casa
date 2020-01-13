package ejercicio03;

import java.io.IOException;

public class Ppal {

	public static void main(String[] args) throws IOException {
		/*Leer un n�mero que ser� la cantidad de dinero que una persona quiere retirar de su cuenta
		bancaria. Mostrar un mensaje diciendo que �no es posible� si la cantidad que se quiere retirar
		es mayor que el saldo de la cuenta y el nuevo saldo si se ha podido retirar.*/
		
		double dineroS =0;
		dineroS = Leer.datoInt();
		double dinero = 1000;
		double dineroF =dinero-dineroS;
		
		if (dineroS>dinero) {
			System.out.println("No tiene' tando dinero makina");
		}
		else {
			System.out.println("Te quedan: "+dineroF+"� en la cuenta");
		}
		
		
	}
}
