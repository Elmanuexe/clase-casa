package ejercicio01_01;

public class Ppal {

	public static void main(String[] args) {
		/*
		 * (Array de objetos) Escriba una clase Producto, caracterizada por 5 atributos
		 * (uno de ellos debe ser precio de fábrica). En una clase Gestion, con un array
		 * de productos como atributo se podrá: listar datos de todos los productos,
		 * calcular el precio de venta al público, que será el precio de fábrica más un
		 * 50 %, comprobar si el producto es “frágil” o no, mediante un método que
		 * devuelva un tipo boolean y añadir un producto a la lista pasando como
		 * parámetro un producto. Crear un main de prueba.
		 */
		
		Producto[] p1  = new Producto[1];
		p1[0] = new Producto(1, "cepillo de dientes", 0.8, "Palo de plastico");
		
		Gestion g1 = new Gestion(p1);
		
		g1.listarProductos();
		
		System.out.println(g1.calcularPrecioventa());
	}

}
