package ejercicio01;

import java.util.ArrayList;
import java.util.List;
import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Realizar un programa que permita gestionar las notas de texto como las de un
		 * m�vil. Usaremos la clase ArrayList y el listado debe guardar objetos tipo
		 * Notas. 
		 * 
		 * Debe permitir almacenar un n�mero infinito de notas (significa que se deben usar colecciones), 
		 * 
		 * se podr�n mostrar de manera individual (mostrar una nota busc�ndola), 
		 * 
		 * dar informaci�n del n�mero de notas guardadas
		 * 
		 * agregar una nueva nota, 
		 * 
		 * Un m�todo que borre una de las notas guardadas comprobando antes que la lista no est� vac�a. 
		 * Se borrar� por n�mero (la nota 1, la 2...), por
		 * lo que habr� que mostrarle al usuario la lista con todas las notas (en un
		 * m�todo) y su n�mero correspondiente, el usuario introducir� el n�mero de la que quiera borrar. 
		 * 
		 * Realmente, esto se debe hacer buscando la nota, pero al
		 * ser el primer ejercicio, no es necesario hacer los m�todos buscar.
		 */
		
		CRUDnotas c1 = new CRUDnotas();
		Notas n1 = new Notas(1, "Compra", "Huevos, leche, patata, mantequila");
		Notas n2 = new Notas(2, "Fiesta", "Cubiertos plastico, Carne, carbon, platos plastico");
		Notas n3 = new Notas(3, "Examen programacion", "Estudiar para el examen del viernes el tema 5");
		
		String nota;
		String texto;
		int contador=4;

		List<Notas> listaN = new ArrayList<Notas>();
		
		listaN.add(n1);
		listaN.add(n2);
		listaN.add(n3);

		do {
			System.out.println("Seleccione que quiere hacer");
			System.out.println("1.Agregar una nota");
			System.out.println("2.Borrar una nota");
			System.out.println("3.Mostrar notas");
			switch(Leer.datoInt()) {
			case 1:
				System.out.println("introduzca la nota");
				nota=Leer.dato();
				System.out.println("introduzca el texto de la nota");
				texto=Leer.dato();
				Notas ncontador = new Notas(contador, nota, texto);
				contador++;				
				c1.agregarNota(ncontador, listaN);
			break;
			case 2:
				
			break;
			}
		}while(1>0);
	}

}
