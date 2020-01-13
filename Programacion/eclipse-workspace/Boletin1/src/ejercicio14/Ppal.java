package ejercicio14;

public class Ppal {

	public static void main(String[] args) {
		/*. Imprime por pantalla un ticket de una tienda. El empleado se llama “John Snow”, y el 
		cliente ha comprado dos latas de Coca Cola a 70 céntimos, una bolsa de pipas de 0.40 €
		y una espada llamada “Garra” que cuesta 150 €. No hace falta calcular le devolución de
		la compra.*/
		
		String bebida="coca cola";
		double precioU=0.70;
		double precioFU=0.70*2;
		int cant=2;
		
		System.out.println("LA TIENDA DEL NORTE");
		System.out.println("");
		System.out.println(cant+" "+bebida+"\t"+precioU);
		System.out.println("Cant. Descripcion    Precio Imp");
		System.out.println("2 Coca Cola          0.70€ 1.40€");
		System.out.println("1 Pipas Reyes        0.40€ 0.40€");
		System.out.println("1 Espada Garra        150€  150€");
		System.out.println("");
		System.out.println("ATENDIDO POR:........JHON SNOW");
	}

}
