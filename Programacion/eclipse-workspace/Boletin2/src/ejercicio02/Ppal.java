package ejercicio02;

public class Ppal {

	public static void main(String[] args) {
		/*Leer dos n�meros. Vamos a dividir el primero entre el segundo y se debe mostrar un mensaje
		de error si el segundo es cero antes de hacer la operaci�n. Mostrar el resultado de la divisi�n
		con dos decimales si no lo es*/
		
		double n1=2;
		double n2=1;
		
		if (n2<=0){
			System.out.println("Error: eres tonto colega q no se pue dividir por 0 xD");
		}
		else {
			System.out.printf("Esta es la soluci�n: %.2f",n1/n2);
		}
				
	}		
}


