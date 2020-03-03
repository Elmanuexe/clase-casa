package ejemplocomparator;

import java.util.Comparator;

public class ComparaPorMarca implements Comparator <Corredor> {

	
	//comparamos 2 objetos
	public int compare (Corredor c1, Corredor c2) {
			
	//creamos las 2 variables tipo double (marca es double) que vamos a comparar
	double marcac1 = c1.getMarca();
	double marcac2 = c2.getMarca();

	//si el 1º es menor que el segundo devuelve -1, si es mayor 1 y si son iguales 0
	if(marcac1 < marcac2)
		return -1;

	else
		if (marcac1 > marcac2)
		return 1;
	return 0;
	}
}
