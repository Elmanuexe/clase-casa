package ejemplocomparator;

import java.util.Comparator;

public class ComparaPorNombre implements Comparator <Corredor>{	
	
	public int compare (Corredor c1, Corredor c2) {
		
		//creamos las 2 variables tipo cadena 
		//(porque nombre es String) que vamos a comparar
		String nombrec1 = c1.getNombre();
		String nombrec2= c2.getNombre();
		
		//se retorna el int que devuelve la comparación del primero con el segundo
		//el metodo toLowerCase nos devuelve la cadena en minúsculas
		//el metodo compareTo es para comparar cadenas de manera natural, lexicográficamente
		return (nombrec1.toLowerCase().compareTo(nombrec2.toLowerCase()));
		
	}
	

	
	
}
