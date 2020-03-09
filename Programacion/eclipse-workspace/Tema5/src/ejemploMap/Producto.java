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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		long temp;
		temp = Double.doubleToLongBits(precioB);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Producto other = (Producto) obj;
		if (id != other.id)
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (Double.doubleToLongBits(precioB) != Double.doubleToLongBits(other.precioB))
			return false;
		return true;
	}
	
	
}
