package ejercicio01;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Hacer un programa que calcule el área de un círculo cuando se le pasa al
		 * método como argumento el radio de este. En el main debemos crear un objeto
		 * tipo Círculo y llamar a dicho método.
		 */
		
		double radio=0;
		CalcularAea circulo=new CalcularAea();
		
		System.out.println("hola buenas por favor introduzca el radio de su circulo");
		
		radio=Leer.datoDouble();
		
		System.out.println("el area es: "+circulo.CalcularAreaCirculo(radio));
	}

}
