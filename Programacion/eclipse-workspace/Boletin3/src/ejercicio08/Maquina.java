package ejercicio08;

public class Maquina {

	private int numero;
	private double recaudacion;
	private double pago = 0;
	private String contrasena = "1234";
	private Ticket ticketMaquina;

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

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

	public double getPago() {
		return pago;
	}

	public void setPago(double pago) {
		this.pago = pago;
	}

	@Override
	public String toString() {
		return "Maquina [numero=" + numero + ", recaudacion=" + recaudacion + ", pago=" + pago
				+ ", contrasena=" + contrasena + ", ticketMaquina=" + ticketMaquina + "]";
	}

	public Maquina(int numero, double recaudacion, double total, double pago, double vuelta, String contrasena,
			Ticket ticketMaquina) {
		this.numero = numero;
		this.recaudacion = recaudacion;
		this.pago = pago;
		this.contrasena = contrasena;
		this.ticketMaquina = ticketMaquina;
	}

	public double calcularTotal() {

		/*
		 * Tenemos varias posibilidades 
		 * OP1)
		 * 
		 * total=ticketMaquina.getPrecio() * numero; sin devolver nada 
		 * OP2)
		 * 
		 * return ticketMaquina.getPrecio() * numero;
		 * 
		 * op3)En este caso en el que tenemos total como atributo, guardamos y
		 * devolvemos
		 * 
		 * total=ticketMaquina.getPrecio() * numero; return total;
		 */
		return ticketMaquina.getPrecio() * numero;		
	}

	public double calcularVuelta() {

		return pago - calcularTotal();
	}

	public void sumaRecaudacion() {
		recaudacion = recaudacion + calcularTotal();
	}

	public void mostrarTicket() {
		System.out.println(" ______________________________");
		System.out.println("|                              |");
		System.out.println("|     Ticket metro Sevilla     |");
		System.out.println("|                              |");
		System.out.println("|                              |");
		System.out.println("|                              |");
		System.out.println("|         Válido para:         |");
		System.out.println("|         " + getNumero() + " Personas           |");
		System.out.println("|                              |");
		System.out.println("|                              |");
		System.out.println("|  "+calcularTotal()+" €                       |");
		System.out.println("|______________________________|");
	}
}
