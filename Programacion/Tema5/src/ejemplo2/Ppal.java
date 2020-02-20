package ejemplo2;

import java.util.HashSet;
import java.util.Set;

public class Ppal {

	public static void main(String[] args) {

		Set <String> primerSet = new HashSet<String>();
		primerSet.add("one");
		primerSet.add("second");
		primerSet.add("3rd");
		primerSet.add(new Integer(4));
		primerSet.add(new Float(5.0F));
		primerSet.add("second"); // duplicado, no se agrega
		primerSet.add(new Integer(4)); // duplicado, no se agrega
		/*
		 * en la siguiente línea, se imprime el objeto set como salida estándar. Esto
		 * funciona porque la clase HashSet anula el método heredado toString y crea una
		 * secuencia separada por comas con los elementos delimitados por los corchetes
		 * inicial y final
		 */
		System.out.println(primerSet);
	}
}
// Ojo, pues los elementos no aparecen en el mismo orden
// en que se agregan