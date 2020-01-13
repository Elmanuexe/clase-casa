package ejercicio09;

public class Ppal {

	public static void main(String[] args) {
		/*Haz un programa que calcule la longitud de una circunferencia de radio 3 metros y el �rea de
		un c�rculo de radio 5.2 metros.*/
		
		double radio1=3;
		double radio2=5.2;
		double longitud=0.0;
		double area=0.0;
		double eps=2;
		System.out.println("Vamos a calcular la longitud de una circunferencia de radio 3 y el área de un circulo de radio 5,2");
		
		longitud=Math.pow(radio1, eps)*Math.PI;
		area=Math.PI*Math.pow(radio2, eps);
		
		System.out.println("la longitud de la circunferencia es: "+longitud);
		System.out.println("el área del círculo es: "+area);
		
	}

}
