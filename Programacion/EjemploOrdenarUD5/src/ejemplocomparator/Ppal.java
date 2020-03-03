package ejemplocomparator;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Ppal {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int opcionUser;
		List<Corredor> corredores = new ArrayList<Corredor>();
		
		corredores.add(new Corredor(4, 1.43, "Jesse Owens"));
		corredores.add(new Corredor(8, 1.11, "Ángel Naranjo"));
		corredores.add(new Corredor(3, 2.23, "Abel Antón"));
		corredores.add(new Corredor(1, 1.12, "Luis Miguel López"));
		corredores.add(new Corredor(6, 1.14, "Miguel Campos"));
		corredores.add(new Corredor(5, 1.13, "Rafa Villar"));
		corredores.add(new Corredor(7, 2.11, "Emil Zatopek"));
		corredores.add(new Corredor(2, 2.35, "Carl Lewis"));

		
		System.out.println("\tCORREDORES");
		System.out.println();
		
		for(Corredor con : corredores){
			System.out.println(con);
		}	
		
		do {
		System.out.println();
		System.out.println("ELIJA UNA OPCION");
		System.out.println("0.Salir");
		System.out.println("1.Ordenar por nombre");
		System.out.println("2.Ordenar por dorsal");
		System.out.println("3.Ganadores");
		opcionUser=Leer.datoInt();
		
		switch(opcionUser){
		case 1:
			//******************
			//ordenamos todos los corredores por nombre
			System.out.println();
			System.out.println("\tCORREDORES (ordenados alfabéticamente, fíjate en la Á con tilde)");
			//Al método sort de Collections se le pueden pasar dos argumentos
			//La lista a ordenar, en este caso corredores
			//De tipo List es hija de Colletions y 
			//cómo ordenar, en este caso, un objeto de la clase
			//que implemente el método que vamos a usar para ordenar
			Collections.sort(corredores, new ComparaPorNombre());
			System.out.println();
			for(Corredor con : corredores){
				System.out.println(con);
			}
			break;
			
		case 2:
			//******************
			//ordenamos todos los corredores por número de dorsal de forma natural, de menor a mayor
			System.out.println();
			System.out.println("\tCORREDORES (por número de dorsal de menor a mayor)");
			Collections.sort(corredores);
			System.out.println();
			for(Corredor con : corredores){
				System.out.println(con);
			}
			break;
			
		case 3: 
			//******************
			//imprimimos los 3 primeros con marca más baja
			System.out.println();
			System.out.println("\tGANADORES");
			Collections.sort(corredores, new ComparaPorMarca());
			System.out.println();
			
			int i=0;
			for(Corredor con : corredores){
				if(i==0){
					System.out.println("ORO --> "+con);
				}
				if(i==1){
					System.out.println("PLATA --> "+con);
				}
				if(i==2){
					System.out.println("BRONCE --> "+con);
				}
				i++;
			}
			break;
			
		default: 
			System.out.println("Opción no válida");
			break;
		}
		
		}while(opcionUser!=0);
	}
				
}


