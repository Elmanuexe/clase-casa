package ejercicio01_01;

public class Producto {
	
	private int id;
	private String nombre;
	private double precioFabrica;
	private String descripcion;
	
	public Producto(int id, String nombre, double precioFabrica, String descripcion) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.precioFabrica = precioFabrica;
		this.descripcion = descripcion;
	}
	
	
	@Override
	public String toString() {
		return "Producto [id=" + id + ", nombre=" + nombre + ", precioFabrica=" + precioFabrica + ", descripcion="
				+ descripcion + "]";
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
	public double getPrecioFabrica() {
		return precioFabrica;
	}
	public void setPrecioFabrica(double precioFabrica) {
		this.precioFabrica = precioFabrica;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	

}
