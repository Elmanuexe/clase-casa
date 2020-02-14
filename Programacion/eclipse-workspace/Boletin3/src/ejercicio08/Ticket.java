package ejercicio08;

public class Ticket {

	// atributos
	
	private static double precio = 1.60;

	public static double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		Ticket.precio = precio;
	}
	
	public Ticket(double precio) {
		this.precio=precio;
	}
}
