package ejercicio06;

public class Ppal {

	public static void main(String[] args) {
		/*Crear un programa donde se declare una variable que será una cantidad de euros, y mostrar
		por pantalla su cambio a dólares americanos. Se debe tener otra variable cuyo valor será el
		valor de 1 dólar en euros y otra para guardar el resultado (podéis inventar el valor del cambio
		o buscarlo en internet).*/ 
		
		double euro=1.0;
		double dolar=1.10;
		double eurdol=0, resultado=0.0;
		
		System.out.println("Bienvenido a este programa para calcular el cambio de euro a dolar, éstá guapo eh?♥");
		
		eurdol=euro*dolar;
		
		System.out.println(euro+"€ serán "+eurdol+"$");
		System.out.println("Pos ya estaría");
	}

}
