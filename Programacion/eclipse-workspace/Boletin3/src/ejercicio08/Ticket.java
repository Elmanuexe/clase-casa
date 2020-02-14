package ejercicio08;

public class Ticket {

	// atributos
	
	private double precio;

	public double getPrecio() {
		return precio;
	}

	@Override
	public String toString() {
		return "Ticket [precio=" + precio + "]";
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public Ticket(double precio) {
		this.precio=precio;
	}

	public Ticket() {
		this.precio = precio;
	}
}
