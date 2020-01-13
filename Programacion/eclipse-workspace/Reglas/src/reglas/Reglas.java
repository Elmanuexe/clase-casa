package reglas;

public class Reglas {

	public static void mostrarReglas() {

	System.out.println("El objetivo de las blancas es que el rey llegue a una de las cuatro esquinas");
	System.out.println("También pueden ganar si se comen todas las piezas negras");
	System.out.println(" ");
	System.out.println("Las piezas negras ganarán si matan al rey, lo bloquean o matan a todas las blancas");
	System.out.println(" ");
	System.out.println("Las fichas mueren si se ven acorraladas por dos flancos(si una pieza pasa entre otras dos no cuenta como acorralar)");
	System.out.println("Las casillas a las que tiene que llegar el rey y en la que está, cuentan como hostiles para todas(si una pieza se encuentra entre una de estas y otra del otro color muere)");
	System.out.println("Las piezas no pueden quedarse en la casilla de origen del rey");
	System.out.println(" ");
	System.out.println("Todas las piezas pueden moverse libremente tanto horizontal como verticalmente(como el caballo del ajedrez)");
	System.out.println("Las piezas no pueden saltarse unas a otras");
	System.out.println("El rey no puede matar");
	System.out.println(" ");
	System.out.println("Puedes comer más de una pieza en el mismo turno");
	System.out.println(" ");
	System.out.println("No se puede hacer el mismo movimiento 3 veces");

	}
}
