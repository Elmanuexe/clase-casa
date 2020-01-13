package ejercicio09;

import ejercicio03.Leer;

public class Ppal {

	public static void main(String[] args) {
/*Se desea realizar un programa que gestione las notas de un alumno del centro. Para ello, se
necesita leer las notas de las 6 asignaturas de un solo alumno y mostrar por pantalla al final,
la nota media y el número de suspensos que tiene. No usar una variable para cada nota, ni es
necesario mostrar las notas de cada asignatura, solo la media y el número de suspensos.*/
		
		int salir=0, susp=0, asig=6;
		double notas=0.0, total=0.0, media=0.0;
		
		do {
			System.out.println("Por favor introduzca las 6 notas del alumno");
			
			for(int i=0; i<asig; i++) {
				notas = Leer.datoInt();
				
				total=total+notas;
				
				if (notas<5) {
					susp++;
				}
					
			}
			media=total/asig;
		}while(salir != 0);
		
		System.out.printf("La nota media es %.2f \n",media);
		System.out.println("Ha suspendido "+susp+" asignaturas");
		
	}

}
