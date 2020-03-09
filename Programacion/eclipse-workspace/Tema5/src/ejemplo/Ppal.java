package ejemplo;

import java.util.ArrayList;
import java.util.List;

public class Ppal {

	public static void main(String[] args) {

		List<Integer> lista = new ArrayList<Integer>();
		List<String> listaNombres = new ArrayList<String>();
		List<Alumno> listaAlum = new ArrayList<Alumno>();

		Alumno a1 = new Alumno("Manuel", 18, 5.2);
		Alumno a2 = new Alumno("Antonio", 19, 7.5);
		lista.add(2);
		lista.add(3);
		listaNombres.add("Manuel");
		listaNombres.add("Antonio");
		listaNombres.add("Angel");

		for (String nom : listaNombres) {
			System.out.println(nom);
		}

		listaAlum.add(a1);
		listaAlum.add(a2);
		listaAlum.add(new Alumno("Angel", 34, 3.4));

		for (Alumno a : listaAlum) {
			System.out.println(a);
		}
		System.out.println(listaAlum.size());

		listaAlum.remove(2);
		for (Alumno a : listaAlum) {
			System.out.println(a);
		}
		System.out.println(listaAlum.size());
	}

}
