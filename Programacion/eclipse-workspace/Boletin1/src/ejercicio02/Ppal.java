package ejercicio02;

public class Ppal {

	public static void main(String[] args) {
		/*Calcula y muestra en pantalla el área de una piscina olímpica (50 m de largo por 21 de
		ancho). ¿Cuántos litros de agua hacen falta para llenarla si tiene 2,50 m de profundidad?
		¿Cuánto costará llenarla si el metro cúbico cuesta 1,80 €?*/
		
		int largo=50;
		int ancho=21;
		double profundo=2.50;
		double valor=1.80;
		
		int area= largo * ancho;
		double vol= area * profundo;
		double agua= vol * valor;
		
		System.out.println("El área es de: "+area+"m");
		System.out.println("Hacen falta "+vol+" metros cúbicos");
		System.out.println("Cosará "+agua+"€");
		
	}

}
