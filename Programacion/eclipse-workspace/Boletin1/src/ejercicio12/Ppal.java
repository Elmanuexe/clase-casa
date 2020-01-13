package ejercicio12;

public class Ppal {

	public static void main(String[] args) {
/*. ¡Qué follón! Mi pueblo ha tenido cortes de agua este verano debido a la sequía. Han tenido
que abrir pozos. La capacidad de sacar agua de los pozos se cuenta por litros por segundo y
la capacidad del depósito para guardar el agua en metros cúbicos. Serías capaz de crear un
programa que calcule cuantos metros cúbicos se sacan de uno de los pozos que tiene un caudal
de 8 litros por segundo si está conectado 24 horas.*/
		
		double Ls=8.0;
		double H=24.0;
		double m3=0.0;
		double segundos=0.0;
		double Litros=0.0;
		double segundo=60;
		double conv=0.001;
		
		System.out.println("Vamos a calcular cuantos metros cúbicos se sacan de uno de los pozos");
		
		segundos =H*segundo*segundo;
		System.out.println("Empezamos averiguando los segundos que ha estado sacando agua, en este"
				+ " caso: "+segundos+"s");
		
		Litros=segundos*Ls;
		System.out.println("Ahora multiplicamos los litros por segundo por los segundos conectados: "+Litros+"L");
		
		m3=Litros*conv;
		System.out.println("Para finalizar pasamos los litros totales a metros cúbicos y queda el siguiente resultado: "+m3+" metros cúbicos");
		
	}


}
