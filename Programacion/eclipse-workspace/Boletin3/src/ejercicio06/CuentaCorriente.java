package ejercicio06;

public class CuentaCorriente {


	private double saldo;
	
	public CuentaCorriente(double saldo) {
		this.saldo=saldo;
	}
	
	public void ingresar(double cantidad) {
		saldo = saldo+cantidad;
	}
	
	public void retirar(double cantidad) {
		saldo = saldo-cantidad;
	}
	
	public double mostrarSaldo() {
		return saldo;
	}
}
