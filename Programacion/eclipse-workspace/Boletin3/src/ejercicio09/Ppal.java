package ejercicio09;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {

		Alumno Alumno1 = new Alumno(0, 0, 0, 0, 0);
		int suspensos=0;

		System.out.println("Bienvenido, inserte las notas del alum1no");
		System.out.print("Entornos:");
		Alumno1.setEntornos(Leer.datoDouble());
			if(Alumno1.getEntornos()<5) {
				suspensos++;
			}
		System.out.print("Programacion:");
		Alumno1.setProgramacion(Leer.datoDouble());
			if(Alumno1.getProgramacion()<5) {
			suspensos++;
		}
		System.out.print("Bases de Datos:");
		Alumno1.setBaseDatos(Leer.datoDouble());
			if(Alumno1.getBaseDatos()<5) {
			suspensos++;
		}
		System.out.print("Lenguaje de Marcas:");
		Alumno1.setLenguaje(Leer.datoDouble());
			if(Alumno1.getLenguaje()<5) {
			suspensos++;
		}

		do {


			System.out.println("\n---¿Que quiere hacer ahora?---");
			System.out.println("1.Mostrar notas\n2.Modificar notas\n3.Ver media\n4.Ver suspensos");

			switch (Leer.datoInt()) {
			case 1:
				System.out.printf("\nEntornos: " + Alumno1.getEntornos() + "\nProgramacion: "
						+ Alumno1.getProgramacion() + "\nBases de Datos: " + Alumno1.getBaseDatos()
						+ "\nLenguaje de Marcas " + Alumno1.getLenguaje()+"\n");
				break;
			case 2:
				System.out.println("\n¿De que asignatura?");
				System.out.println("1.Entornos\n2.Programacion\n3.Bases de Datos\n4.Lenguaje de Marcas");

				switch (Leer.datoInt()) {
				case 1:
					Alumno1.setEntornos(Leer.datoDouble());
					break;
				case 2:
					Alumno1.setProgramacion(Leer.datoDouble());
					break;
				case 3:
					Alumno1.setBaseDatos(Leer.datoDouble());
					break;
				case 4:
					Alumno1.setLenguaje(Leer.datoDouble());
					break;
				}
			case 3:
				System.out.println("La media de este alumno es de: " + Alumno1.calcularMedia());
				break;
			case 4:
				System.out.println("El número de suspensos de este alumno es de: "+suspensos);
			}

		} while (1 > 0);
	}
}
