package ejercicio01_01;

import java.util.Arrays;

import leer.Leer;

public class Gestion {
	private Producto[] lista;
	private int nProdVenta;
	
	public Gestion(Producto[] lista) {
		super();
		this.lista = lista;
	}
	

	@Override
	public String toString() {
		return "Gestion [lista=" + Arrays.toString(lista) + "]";
	}
	

	public Producto[] getLista() {
		return lista;
	}

	public void setLista(Producto[] lista) {
		this.lista = lista;
	}


	public void listarProductos() {
		for (int i = 0; i < lista.length; i++) {
			System.out.println("Nombre:              "+lista[i].getNombre());
			System.out.println("Id:                  "+lista[i].getId());
			System.out.println("Descripción:         "+lista[i].getDescripcion());
			System.out.println("Precio de fabrica:   "+lista[i].getPrecioFabrica());
		}	
	}
	public double calcularPrecioventa() {
			nProdVenta=Leer.datoInt()-1;
			return (lista[nProdVenta].getPrecioFabrica() + lista[nProdVenta].getPrecioFabrica()/2);
		}
	
	public void agregarProducto(Producto[]lista) {
		System.out.println("Inserte el id, nombre, precio de fabricacion, y descripción del nuevo producto");
	}
}


