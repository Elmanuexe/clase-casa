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

		Alumno lista[] = new Alumno[3];
		int nAlumno = 0;
		lista[0] = new Alumno("Manuel", 0, 0, 0, 0, 0, 0);
		lista[1] = new Alumno("Angel", 0, 0, 0, 0, 0, 0);
		lista[2] = new Alumno("Antonio", 0, 0, 0, 0, 0, 0);

		for (int i = 0; i < lista.length; i++) {

			System.out.println("Bienvenido, inserte las notas de " + lista[i].getNombre());
			System.out.print("Entornos:");
			lista[i].setEntornos(Leer.datoDouble());
			if (lista[i].getEntornos() < 5) {
				lista[i].setSuspensos(+1);
			}
			System.out.print("Programacion:");
			lista[i].setProgramacion(Leer.datoDouble());
			if (lista[i].getProgramacion() < 5) {
				lista[i].setSuspensos(+1);;
			}
			System.out.print("Bases de Datos:");
			lista[i].setBaseDatos(Leer.datoDouble());
			if (lista[i].getBaseDatos() < 5) {
				lista[i].setSuspensos(+1);;
			}
			System.out.print("Lenguaje de Marcas:");
			lista[i].setLenguaje(Leer.datoDouble());
			if (lista[i].getLenguaje() < 5) {
				lista[i].setSuspensos(+1);;
			}
		}
		do {

			System.out.println("\n---¿Que quiere hacer ahora?---");
			System.out.println("1.Mostrar notas\n2.Modificar notas\n3.Ver media\n4.Ver suspensos");

			switch (Leer.datoInt()) {
			case 1:
				System.out.println("¿De que alumno?");
				for (int i = 0; i < lista.length; i++) {
					System.out.println(i + ". " + lista[i].getNombre());
				}
				nAlumno = Leer.datoInt();
				System.out.printf("\nEntornos: " + lista[nAlumno].getEntornos() + "\nProgramacion: "
						+ lista[nAlumno].getProgramacion() + "\nBases de Datos: " + lista[nAlumno].getBaseDatos()
						+ "\nLenguaje de Marcas " + lista[nAlumno].getLenguaje() + "\n");
				break;
			case 2:
				System.out.println("¿De que alumno?");
				for (int i = 0; i < lista.length; i++) {
					System.out.println(i + ". " + lista[i].getNombre());
				}
				nAlumno = Leer.datoInt();
				System.out.println("\n¿De que asignatura?");
				System.out.println("1.Entornos\n2.Programacion\n3.Bases de Datos\n4.Lenguaje de Marcas");

				switch (Leer.datoInt()) {
				case 1:
					lista[nAlumno].setEntornos(Leer.datoDouble());
					break;
				case 2:
					lista[nAlumno].setProgramacion(Leer.datoDouble());
					break;
				case 3:
					lista[nAlumno].setBaseDatos(Leer.datoDouble());
					break;
				case 4:
					lista[nAlumno].setLenguaje(Leer.datoDouble());
					break;
				}
			case 3:
				System.out.println("¿De que alumno?");
				for (int i = 0; i < lista.length; i++) {
					System.out.println(i + ". " + lista[i].getNombre());
				}
				nAlumno = Leer.datoInt();
				System.out.println("La media de este alumno es de: " + lista[nAlumno].calcularMedia());
				break;
			case 4:
				System.out.println("¿De que alumno?");
				for (int i = 0; i < lista.length; i++) {
					System.out.println(i + ". " + lista[i].getNombre());
				}
				nAlumno = Leer.datoInt();
				System.out.println("El número de suspensos de este alumno es de: " + lista[nAlumno].getSuspensos());
			}

		} while (1 > 0);
	}
}
