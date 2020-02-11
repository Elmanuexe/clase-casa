package ejercicio08;

public class Maquina {

	private int numero;
	private double recaudacion;
	private double total = 0;
	private double pago = 0;
	private double vuelta = 0;

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public double getRecaudacion() {
		return recaudacion;
	}

	public void setRecaudacion(double recaudacion) {
		this.recaudacion = recaudacion;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public double getPago() {
		return pago;
	}

	public void setPago(double pago) {
		this.pago = pago;
	}

	public double getVuelta() {
		return vuelta;
	}

	public void setVuelta(double vuelta) {
		this.vuelta = vuelta;
	}

	public Maquina(int numero, double recaudacion, double total, double pago, double vuelta) {
		this.numero=numero;
		this.recaudacion=recaudacion;
		this.total=total;
		this.pago=pago;
		this.vuelta=vuelta;
	}
	
	public double calcularTotal() {
		return total = Ticket.getPrecio() * numero;
	}

	public double calcularVuelta() {
		return vuelta = pago - total;
	}
	
	public void sumaRecaudacion() {
		recaudacion = recaudacion + Ticket.getPrecio()*getNumero();
	}
}
