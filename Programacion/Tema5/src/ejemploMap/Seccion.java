package ejemploMap;

public class Seccion {

	private String nombre;

	@Override
	public String toString() {
		return "Seccion [nombre=" + nombre + "]\n";
	}

	public Seccion(String nombre) {
		super();
		this.nombre = nombre;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
}
