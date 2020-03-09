package ejercicio09;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Crear un programa para poner las notas de un alumno. El programa debe poder
		 * poner notas a un solo alumno, mostrar todas sus notas por pantalla, modificar
		 * una nota, calcular la media y dar su número de suspensos. Se puede sin usar
		 * arrays o guardando las notas en un array de doubles en lugar de una variable
		 * para cada nota. (Opcional) Se puede añadir al programa la posibilidad de usar
		 * el programa para varios alumnos, con lo que debemos usar arrays de alumnos
		 * (arrays de objetos tipo Alumno)
		 */

		Asignatura listaAs[] = new Asignatura[4];

		listaAs[0] = new Asignatura("Entornos", 6.5);
		listaAs[1] = new Asignatura("Programacion",7.3);
		listaAs[2] = new Asignatura("Base de Datos", 4.0);
		listaAs[3] = new Asignatura("Lenguaje de marcas", 4.0);

		Alumno Alumno1 = new Alumno("Manuel", listaAs, 0.0, 0);
		
		do {
			System.out.println("\n===¿Que quiere hacer ahora?===");
			System.out.println("1.Mostrar notas\n2.Modificar notas\n3.Ver media\n4.Ver suspensos");

			switch (Leer.datoInt()) {
			case 1:// Mostrar las notas de un alumno
				System.out.println("Las notas de alumno "+ Alumno1.getNombre());
					Alumno1.mostrarNotas();
				break;
			case 2:// Modificar las notas de un alumno
					// Elegir la asignatura a modificar su nota
					System.out.println("\n¿De que asignatura?");
					for (int i = 0; i < listaAs.length; i++) {
						System.out.println((i + 1) + ". " + listaAs[i].getNombre());
					}
					System.out.println("A continuacion inserte el número de asignatura y la nota por ese orden");
					
					
					listaAs[Leer.datoInt()-1].setNota(Leer.datoDouble());
				break;
			case 3:// Mostrar la media de un alumno
				System.out.println("La media de este alumno es de: " + Alumno1.calcularMedia());
				break;
			case 4:// Calcular y mostrar suspensos de un alumno
				
				System.out.println("El número de suspensos de este alumno es de: " + Alumno1.calcularSuspenso());
			}
			System.out.println(" ");
			System.out.println("Introduzca un 0 para seguir con el programa (CUALQUIER otro número hará que el programa PARE)");
		} while (Leer.datoInt() == 0);
	}
}
