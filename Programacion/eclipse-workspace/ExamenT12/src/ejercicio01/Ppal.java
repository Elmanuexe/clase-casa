package ejercicio01;

public class Ppal {

	public static void main(String[] args) {
		int nhijos = 0, hijo=0, rep=0;
		double dineroi = 0.0, dineromas=0.0, total=0.0;
		double hijos[];
		do {
		
		System.out.println("Cuantos hijos tiene?");
		nhijos = Leer.datoInt();
		hijos = new double[nhijos];
		for (int i = 0; i < hijos.length; i++) {
			System.out.println("cuanto dinero le va a dar al hijo " + (i + 1));
			dineroi = Leer.datoDouble();
			hijos[i] = dineroi;
			total=hijos[i]+total;
		}
		System.out.println("A que hijo quiere añadir dinero?");
		hijo=Leer.datoInt()-1;
		System.out.println("Cuanto dinero?");
		dineromas=Leer.datoDouble();
		hijos[hijo]=hijos[hijo]+dineromas;
		total=hijos[hijo]+total;
		
		for (int j = 0; j < hijos.length; j++) {
			System.out.println("El hijo "+(j+1)+" lleva: "+hijos[j]);
			if(hijos[j]>50.0) {
				System.out.println("");
				System.out.println("OJO que el hijo "+(j+1)+" lleva más de 50€");
				System.out.println("");
			}
		}
		System.out.println("En total los niños llevan "+total+"€ gastado");
		System.out.println("");
		System.out.println("La media por cada hijo es de: "+(total/hijos.length)+"€");
		System.out.println("");
		System.out.println("Repetir programa?");
		System.out.println("1.SI 0.NO");
		rep=Leer.datoInt();
		}while(0<rep);
	}

}
