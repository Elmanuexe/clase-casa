package ejercicio01;

import java.util.List;

public class CRUDnotas {

	public void agregarNota(Notas N, List <Notas> listaN) {
		listaN.add(N);
	}
	
	public void mostrarNotas() {
		for (Notas n :listaN) {
			System.out.println(n);
		}
	}
}
