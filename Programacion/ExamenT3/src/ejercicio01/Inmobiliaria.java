package ejercicio01;

import java.util.Arrays;

import leer.Leer;

public class Inmobiliaria {

	private int Id;
	private Piso[] lista;
	private double gananciaTotal;
	
	public Inmobiliaria(int id, Piso[] lista, double gananciaTotal) {
		super();
		Id = id;
		this.lista = lista;
		this.gananciaTotal = gananciaTotal;
	}

	@Override
	public String toString() {
		return "Inmobiliaria [Id=" + Id + ", lista=" + Arrays.toString(lista) + ", gananciaTotal=" + gananciaTotal
				+ "]";
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public Piso[] getLista() {
		return lista;
	}

	public void setLista(Piso[] lista) {
		this.lista = lista;
	}

	public double getGananciaTotal() {
		return gananciaTotal;
	}

	public void setGananciaTotal(double gananciaTotal) {
		this.gananciaTotal = gananciaTotal;
	}
	public double calcularCantidad() {
		return lista[Leer.datoInt()-1].getPrecioVenta()*(Leer.datoDouble()/100);
	}
	public void calcularGananciaTotal() {
		for (int i = 0; i < lista.length; i++) {
			gananciaTotal = gananciaTotal + lista[i].getPrecioVenta();
		}
	}
	public void mostrarPisos100() {
		for (int i = 0; i < lista.length; i++) {
			if(lista[i].getM2()>=100.0) {
				System.out.println(lista[i].toString());
			}
		}

	}
	
}
