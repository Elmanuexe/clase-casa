package arrays02;

public class Ppal {

	
	public static void main(String[] args) {
/*Implementar un programa que rellene automáticamente un array de enteros con 10
posiciones, cada elemento debe contener el valor del doble de su índice. Mostrar el
resultado por pantalla.*/
	
		int multi=2;
		int prod=0;
		
		int [] ent = new int [10];
		for(int i=0; i<ent.length; i++) {
			ent[i]=i*multi;
		
			prod=ent[i];
			
			System.out.println(prod);
		}
		
		
	}

}
