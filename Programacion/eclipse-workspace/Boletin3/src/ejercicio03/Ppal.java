package ejercicio03;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Realizar un programa que calcule el volumen de un cilindro. Vosotros deb�is
		 * decidir qu� m�todo usar y qu� valores pasarle.
		 */
		double radio=0;
		double altura=0;
		CalcularArea cilindro=new CalcularArea();
		
		System.out.println("hola buenas por favor introduzca el radio y altura de su cilindro");
		
		radio=Leer.datoDouble();
		altura=Leer.datoDouble();
		
		System.out.println("el area de su cilindro es: "+cilindro.CalcularAreaCilindro(radio, altura));
		
	}

}
