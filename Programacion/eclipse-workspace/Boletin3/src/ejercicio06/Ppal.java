package ejercicio06;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Se desea llevar un control del estado de una cuenta corriente; la cuenta
		 * corriente está caracterizada por su saldo y el nombre del titular y sobre
		 * ella se pueden realizar tres tipos de operaciones: 
		 * • comprobarSaldo: Devuelve el saldo de la cuenta. 
		 * • Ingresar (cantidad): ingresa en la cuenta una cantidad de dinero dada por el usuario. No imprime de nuevo el saldo, pero sí lo actualiza. 
		 * • Retirar (cantidad): Debe comprobar si queda suficiente saldo y si es así, disminuye la cuenta una determinada cantidad de dinero especificada por el usuario. No imprime de nuevo el saldo, pero sí lo
		 * actualiza. 
		 * Supón que la cuenta inicialmente tiene un saldo de cero. Escribe
		 * una clase CuentaCorriente que implemente las funcionalidades descritas y un main con un menú para probarlas.
		 */

		double total;
		int num=0;
		
		CuentaCorriente Cuenta1;
		Cuenta1 =new CuentaCorriente(0.0);
		
		
		System.out.println("Bienvenido, elija que quiere hacer");
		while(1>num) {
		System.out.println("1.Mostrar total en la cuenta");
		System.out.println("2.Ingresar dinero");
		System.out.println("3.Retirar dinero");
		
		switch(Leer.datoInt()) {
		case 1:
			total = Cuenta1.mostrarSaldo();
			System.out.println("En la cuenta hay "+total+"€");
			break;
			
		case 2:
			System.out.println("Cuanto dinero quiere ingresar en la cuenta?");
			double ingreso=Leer.datoDouble();
			System.out.println("Se van a ingresar "+ingreso+"€");
			Cuenta1.ingresar(ingreso);
			break;
			
		case 3:
			System.out.println("Cuanto dinero quiere retirar de la cuenta?");
			double retiro=Leer.datoDouble();
			System.out.println("Se van a retirar "+retiro+"€");
			Cuenta1.retirar(retiro);
			break;
			
		default:
			System.out.println("Iinsterte un número del 1 al 3 por favor");
			break;
			
		}
		System.out.println("pulse 0 para repetir el programa");
		num=Leer.datoInt();
		}
	}

}
