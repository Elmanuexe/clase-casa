package ejercicio08;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * Crear un programa que emule una máquina vendedora de tickets de metro.
		 * Tendremos que crear la clase Ticket (Clase POJO), la clase Maquina (donde
		 * estarán todos los métodos con funcionalidad) y la clase principal o de
		 * prueba. Podremos: • Comprar uno o varios billetes teniendo en cuenta si hay
		 * que devolver cambio o no. • Imprimir por pantalla el billete. Solo uno. Si se
		 * han comprado “x” debemos mostrar en el ticket el mensaje “válido para x
		 * personas”.
		 * 
		 * Además, al final de la jornada, el operario que lleva el mantenimiento de la
		 * máquina, debe tener disponible un método que le ofrezca el saldo total de la
		 * recaudación de la máquina en ese día (no es necesario usar fechas) y ponga a
		 * cero el contador. Por último, también debe contar con la posibilidad de
		 * cambiar el precio de los billetes ya que estos suelen subir todos los años.
		 * Las operaciones para el operario se harán solo si se introduce la contraseña
		 * adecuada. Estas últimas funcionalidades también se harán con métodos dentro
		 * de la clase Maquina.
		 */

		Ticket Ticket1 = new Ticket(1.60, 0);

		System.out.println("¿Eres cliente o revisor?");
		System.out.println("1.Cliente\n2.Revisor");

		switch (Leer.datoInt()) {
		case 1:
			System.out.println("¿Cuantos tickets quiere comprar?");
			Ticket1.setNumero(Leer.datoInt());
			
			System.out.println("Su cobro es de " + Ticket1.calcularTotal());
			
			System.out.println("Inserte el dinero que va a introducir");
			Ticket1.setPago(Leer.datoDouble());
			
			System.out.printf("Aquí está su vuelta %.2f\n",Ticket1.calcularVuelta());
			
			break;

		case 2:

			System.out.println("¿Qué quiere hacer?");
			System.out.println("1.Ver recaudación");
			System.out.println("2.Cambiar el precio");

		}

	}

}
