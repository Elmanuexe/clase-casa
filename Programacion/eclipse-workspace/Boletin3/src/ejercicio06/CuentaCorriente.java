package ejercicio06;

public class CuentaCorriente {

	//atributo
	private double saldo;
	
	public double getSaldo() {
		return saldo;
	}
	public void setSaldo(double saldo) {
		this.saldo = saldo;
	}
	
	//constructor
	public CuentaCorriente(double saldo) {
		this.saldo=saldo;
	}
	
	//metodos
	public double ingresar(double cantidad) {
		saldo = saldo+cantidad;
		return saldo;
	}
	public void retirar(double cantidad) {
		saldo = saldo-cantidad;
	}
}
