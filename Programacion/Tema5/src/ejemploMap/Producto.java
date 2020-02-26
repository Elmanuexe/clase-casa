package ejemploMap;

public class Producto {
	
	private String nombre;
	private int id;
	private double precioB;
	
	public Producto(String nombre, int id, double precioB) {
		super();
		this.nombre = nombre;
		this.id = id;
		this.precioB = precioB;
	}

	@Override
	public String toString() {
		return "Producto [nombre=" + nombre + ", id=" + id + ", precioB=" + precioB + "]";
	}

	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPrecioB() {
		return precioB;
	}

	public void setPrecioB(double precioB) {
		this.precioB = precioB;
	}
	
	
}
