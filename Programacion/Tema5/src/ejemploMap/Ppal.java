package ejemploMap;

import java.util.HashMap;
import java.util.Map;

public class Ppal {

	public static void main(String[] args) {

		Producto p1 =new Producto ("Patatas", 15, 2.5);
		Producto p2 =new Producto ("PatatasDeluxe", 16, 4.5);
		Producto p3 =new Producto ("HuevosXXL", 18, 3.5);
		Producto p4 =new Producto ("Sudadera", 20, 20.99);
		
		Seccion s1 = new Seccion ("Alimentacion");
		Seccion s2 = new Seccion ("Ropa");
		
		Map <Integer, Producto> listado = new HashMap <Integer,Producto> ();

		Map <Producto, Seccion> listado2 = new HashMap <Producto , Seccion> ();
		
		listado.put(1, p1);
		listado.put(2, p2);
		System.out.println(listado);
		
		listado2.put(p3, s1);
		listado2.put(p4, s2);
		System.out.println(listado2);
	}

}
