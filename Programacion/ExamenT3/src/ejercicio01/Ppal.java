package ejercicio01;

import leer.Leer;

public class Ppal {

	public static void main(String[] args) {
		
		Piso p1[] = new Piso[3];
		p1[0]= new Piso("condes de boustillo, 17", 99.5, "El piso se encuentra en buen estado", 100.0);
		p1[1]= new Piso("condes de boustillo, 27", 100.5, "El piso ha tenido dias mejores", 200.5);
		p1[2]= new Piso("condes de boustillo, 32", 100.0, "El piso necesita de revision", 300.7);
		
		Inmobiliaria i1= new Inmobiliaria(1, p1, 0.0);
		
		System.out.print("Bienvenido ");
		do {
			System.out.println("¿Que desea hacer?");
			System.out.println("1. Actualizar el precio de un piso");
			System.out.println("2. Calcular el precio por metro cuadrado");
			System.out.println("3. Mostrar el precio en libras esterlinas");
			System.out.println("4. Calcular la cantidad que se llleva la inmobiliaria");
			System.out.println("5. Calcular las ganancias por la venta de todos los pisos");
			System.out.println("6. Mostrar pisos con 100 o mas metros cuadrados");
			
			switch(Leer.datoInt()) {
			case 1:
				System.out.println("Seleccione el piso del cual quiere cambiar el precio, luego especifique el porcentaje en decimales que va a restar al precio");
				System.out.println();
				for (int i = 0; i < p1.length; i++) {
					System.out.println((i+1)+". "+p1[i].toString());
				}
				p1[Leer.datoInt()-1].actualizarPrecioPiso();
				System.out.println("Precio actualizado");
				break;
			case 2:
				System.out.println("Seleccione el piso");
				for (int i = 0; i < p1.length; i++) {
					System.out.println((i+1)+". "+ p1[i].toString());
				}
				System.out.println("El precio de este piso por metro cuadrado es: "+ p1[Leer.datoInt()-1].calcularPrecioM2()+"€");
				break;
			case 3:
				System.out.println("Seleccione el piso");
				for (int i = 0; i < p1.length; i++) {
					System.out.println((i+1)+". "+p1[i].toString());
				}
				System.out.println("El precio de este piso en libras es: "+ p1[Leer.datoInt()-1].mostrarLibras());
				break;
			case 4:
				System.out.println("Seleccione el piso y el porcentaje en decimales que gana la inmobiliaria");
				for (int i = 0; i < p1.length; i++) {
					System.out.println((i+1)+". "+p1[i].toString());
				}
				System.out.println("La inmobiliaria se lleva por este piso: "+ i1.calcularCantidad());
				break;
			case 5:
				i1.calcularGananciaTotal();
				System.out.println("El total de ganancia es: "+ i1.getGananciaTotal());
				break;
			case 6:
				System.out.println("Los pisos con 100 metros cuadrados o más son: ");
				i1.mostrarPisos100();
				break;
			default:
				System.out.println("Numero incorrecto");
				break;
			}
			System.out.println("Pulse 0 para salir del programa");
		}while (Leer.datoInt()!=0);
	}

}
