package ejercicio13;

public class Ppal {

	public static void main(String[] args) {
		/*Calcula la intensidad (I) que circulará por un circuito electrónico con una resistencia 
		eléctrica (R) de 20 KΩ al que se le aplica una tensión (V) de 250 voltios. La fórmula es 
		I=V/R. Da el resultado con dos decimales. (K=10 elevado a 3, busca la forma de escribir K sin necesidad
		de escribir1000)*/
		
		double I=0.0;
		double R=20;
		double V=250;
		System.out.println("En este programa vamos a calcular la intensidad que circula por un circuuito electrónico");
		
		I=V/R;
		System.out.printf("Dicho esto, la intensidad es: %.2f\n",I);
		System.out.println("No se para que es esto pero 10x10x10="+10*10*10);
		
	}

}
