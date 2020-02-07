package ejercicio08;

public class Ticket {

	// atributos
	private int numero;
	private double precio = 1.60, total = 0, pago = 0, vuelta = 0;

	public double getVuelta() {
		return vuelta;
	}

	public void setVuelta(double vuelta) {
		this.vuelta = vuelta;
	}

	public double getPago() {
		return pago;
	}

	public void setPago(double pago) {
		this.pago = pago;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	// constructor
	public Ticket(double precio, int numero) {
		this.numero = numero;
		this.precio = precio;
	}

	// metodos
	public double calcularTotal() {
		return total = precio * numero;
	}

	public double calcularVuelta() {
		return vuelta = pago - total;
	}
}
