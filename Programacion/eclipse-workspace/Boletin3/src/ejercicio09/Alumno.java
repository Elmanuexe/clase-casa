package ejercicio09;

public class Alumno {

	private String nombre;
	private Asignatura lista[];
	private double media;
	private int suspensos;
	
	
	public Alumno(String nombre, Asignatura[] lista, double media, int suspensos) {
		super();
		this.nombre = nombre;
		this.lista = lista;
		this.media = media;
		this.suspensos = suspensos;
	}

	public Alumno() {
		
	}
	
	
	public Asignatura[] getLista() {
		return lista;
	}

	public void setLista(Asignatura[] lista) {
		this.lista = lista;
	}

	public int getSuspensos() {
		return suspensos;
	}

	public void setSuspensos(int suspensos) {
		this.suspensos = suspensos;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getMedia() {
		return media;
	}

	public void setMedia(double media) {
		this.media = media;
	}
	
	public void mostrarNotas() {
		for (int i = 0; i < lista.length; i++) {
			System.out.println(lista[i].getNombre()+": "+ lista[i].getNota());
		}
	}
	
	public double calcularMedia() {
		for (int i = 0; i < lista.length; i++) {
			media = media + lista[i].getNota();
		}
		return  media / lista.length;
	}
	
	public int calcularSuspenso() {
		for (int i = 0; i < lista.length; i++) {
			if(lista[i].getNota() < 5) {
				suspensos ++;
			}
		}
		return suspensos;
	}
}
