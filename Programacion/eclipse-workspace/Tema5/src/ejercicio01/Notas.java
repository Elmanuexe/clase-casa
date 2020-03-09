package ejercicio01;

public class Notas {

	private int id;
	private String nombre;
	private String texto;
	
	public Notas(int id, String nombre, String texto) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.texto = texto;
	}

	@Override
	public String toString() {
		return "Notas [id=" + id + ", nombre=" + nombre + ", texto=" + texto + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}
	
	
}
