package ejercicio3;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Realizar un programa que calcule el volumen de un cilindro. Vosotros debéis
		 * decidir qué método usar y qué valores pasarle.
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
