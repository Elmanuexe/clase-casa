package ejercicio10;

import java.util.Arrays;

public class Sala {
	
	private String pelicula[];
	private int numero;
	private double recaudacion;
	private double pago = 0;
	
	public Sala(String[] pelicula, int numero, double recaudacion, double pago) {
		super();
		this.pelicula = pelicula;

		this.numero = numero;
		this.recaudacion = recaudacion;
		this.pago = pago;
	}
	
	public Sala() {
		super();
		this.pelicula= new String[5];
	}


	public String[] getPelicula() {
		return pelicula;
	}



	public void setPelicula(String[] pelicula) {
		this.pelicula = pelicula;
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
		return "Sala [pelicula=" + Arrays.toString(pelicula) + ", numero=" + numero + ", recaudacion="
				+ recaudacion + ", pago=" + pago + "]";
	}

	public double calcularTotal(Ticket t1) {
		return t1.getPrecio() * numero;
	}

	public double calcularVuelta(Ticket t1) {

		return pago - calcularTotal(t1);
	}

	public void sumaRecaudacion(Ticket t1) {
		recaudacion = recaudacion + calcularTotal(t1);
	}

	public void mostrarCartel() {
		for (int i = 0; i < pelicula.length; i++) {
			System.out.println(pelicula[i]);
			
		}
		
	}
}
