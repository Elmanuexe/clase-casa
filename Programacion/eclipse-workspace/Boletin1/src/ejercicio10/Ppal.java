package ejercicio10;

public class Ppal {

	public static void main(String[] args) {
		/*A mi padre le gusta medir la capacidad de las personas que admite un lugar o evento en “el
		número de Navas (mi pueblo)”, en este caso, Navas sería una unidad de medida de número de
		personas que habría en un lugar, por ejemplo, si mi pueblo tiene 1500 habitantes, en un campo
		de futbol de 15000 espectadores, cabrían “10 Navas”.
		Calcular el número de Navas que entrarían en el Camp Nou, en el concierto de U2 del estadio
		Olímpico donde asistieron 65000 personas y en el teatro del colegio, que tiene 600 localidades.*/
		
		System.out.println("Vamos a ver cuantos navas (medida de personas) caben en X sitios");
		
		double navas=1500;
		double camp=100000;
		double estadio=65000;
		double teatro=600;
		double op1=0.000;
		double op2=0.000;
		double op3=0.000;
		
			
		op1=camp/navas;
		System.out.printf("En el camp nou caben %.3f Navas\n",op1);
		op2=estadio/navas;
		System.out.printf("En el estadio caben %.10f Navas\n",op2);
		op3=teatro/navas;
		System.out.printf("En el teatro caben %.1f Navas\n",op3);

		System.out.println("Buneno pues ya sabemos que un pueblo entero no cabe en un teatro");
	}

}
