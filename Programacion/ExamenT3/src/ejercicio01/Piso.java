package ejercicio01;

import leer.Leer;

public class Piso {

	private String direccion;
	private double m2;
	private String descripcionEstado;
	private double precioVenta;
	
	public Piso(String direccion, double m2, String descripcionEstado, double precioVenta) {
		super();
		this.direccion = direccion;
		this.m2 = m2;
		this.descripcionEstado = descripcionEstado;
		this.precioVenta = precioVenta;
	}

	@Override
	public String toString() {
		return "Piso [direccion=" + direccion + ", m2=" + m2 + ", descripcionEstado=" + descripcionEstado
				+ ", precioVenta=" + precioVenta + "]";
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public double getM2() {
		return m2;
	}

	public void setM2(double m2) {
		this.m2 = m2;
	}

	public String getDescripcionEstado() {
		return descripcionEstado;
	}

	public void setDescripcionEstado(String descripcionEstado) {
		this.descripcionEstado = descripcionEstado;
	}

	public double getPrecioVenta() {
		return precioVenta;
	}

	public void setPrecioVenta(double precioVenta) {
		this.precioVenta = precioVenta;
	}
	
	public void actualizarPrecioPiso() {
		precioVenta = precioVenta - (Leer.datoDouble()/100);
	}
	public double calcularPrecioM2() {
		return precioVenta/m2;
	}
	public double mostrarLibras() {
		return precioVenta*0.7;
		
	}
}
