package ejercicio08;

public class Ticket {

	// atributos
	
	private static double precio = 1.60;

	public static double getPrecio() {
		return precio;
	}

	public static void setPrecio(double precio) {
		Ticket.precio = precio;
	}
	
	public double Ticket(double precio) {
		this.precio=precio;
	}
}
