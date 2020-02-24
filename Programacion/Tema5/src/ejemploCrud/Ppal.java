package ejemploCrud;

import java.util.ArrayList;
import java.util.List;

public class Ppal {

	public static void main(String[] args) {

		
		//Instanciamos objetos del arraylist
		Trabajador t1 = new Trabajador("Manuel", "Fernandez Arjona", "1", 1200, "05/10/2001");
		Trabajador t2 = new Trabajador("Antonio", "Montero", "2", 1350, "10/06/2000");
		Trabajador t3 = new Trabajador("Angel", "Naranjo", "3", 1500, "03/04/1889");
		Trabajador t4 = new Trabajador("Juan", "Martinez", "4", 900, "09/10/2001");
		Trabajador t5 = new Trabajador("Felipe", "Carrasco", "5", 1900, "07/09/2001");

		//Declaramos el ArrayList de tipo Trabajador
		List<Trabajador> listaT = new ArrayList<Trabajador>();
		
		//Añadimos trabajadores al ArrayList
		listaT.add(t1);
		listaT.add(t2);
		listaT.add(t3);
		listaT.add(t4);
		listaT.add(t5);
	}

}
