package ejemploCrud;

import java.util.List;

public class Crud {

	/*
	 * Buscar objeto pasandole por parametro el indice y me devuelva el objeto que
	 * este en esa posicion
	 */
	public Trabajador buscar(int indice, List<Trabajador> listaTrabajadores) {

		if (listaTrabajadores.size() > indice) {
			return listaTrabajadores.get(indice);
		}
		return null;
	}

	/*
	 * Buscar objeto pasandole por parametro el id_trabajador y que te devuelva el
	 * trabajador
	 */

	public Trabajador buscar(List<Trabajador> listaTrabajadores, String id_trabajador) {

		for (int i = 0; i < listaTrabajadores.size(); i++) {
			if (listaTrabajadores.get(i).getIdTrabajador().equalsIgnoreCase(id_trabajador)) {
				return listaTrabajadores.get(i);
			}
		}
		return null;
	}

	/*
	 * Buscar un objeto y devuelve si existe o no, pasandole el objeto como
	 * parametro
	 */

	public String existe(List<Trabajador> listaTrabajadores, Trabajador t) {
		String encontrado = "Existe";
		String noEncontrado = "No existe";

		for (int i = 0; i < listaTrabajadores.size(); i++) {
			if (listaTrabajadores.get(i) == t) {
				return encontrado;
			}
		}
		return noEncontrado;

	}

	/*
	 * Añadir un trabajador pasandole el trabajador como parametro
	 */

	public void agregarTrabajador(Trabajador t, List<Trabajador> listaTrabajadores) {

		listaTrabajadores.add(t);
	}

	/*
	 * Eliminar trabajdor pasandole como parametro un indice
	 */

	public void eliminarTrabajador(List<Trabajador> listaTrabajadores, int index) {

		listaTrabajadores.remove(index);
	}

	/*
	 * Eliminar trabajador pasandole como parametro un trabajador especifico
	 */

	public void eliminarTrabajador(List<Trabajador> listaTrabajadores, Trabajador t) {

		listaTrabajadores.remove(t);
	}

	/*
	 * Eliminar trabajador mediante el id_trabajador , lo pasamos como parametro
	 */

	public void eliminarTrabajador(List<Trabajador> listaTrabajadores, String id_trabajador) {
		for (int i = 0; i < listaTrabajadores.size(); i++) {
			if (listaTrabajadores.get(i).getIdTrabajador().equalsIgnoreCase(id_trabajador)) {
				listaTrabajadores.remove(i);
			}
		}
	}

	/*
	 * Cambiar el nombre de un trabajdor pasandole el indice como parametro de
	 * eleccion
	 */

	public void cambiarNombre(List<Trabajador> listaTrabajadores, String nombre, int opcion) {

		listaTrabajadores.get(opcion).setNombre(nombre);
	}

	/*
	 * Cambiar el nombre de un trabajador pasandole como parametro el id_trabajador
	 */

	public void cambiarNombre(List<Trabajador> listaTrabajadores, String id_trabajador, String nombre) {
		for (int i = 0; i < listaTrabajadores.size(); i++) {
			if (listaTrabajadores.get(i).getIdTrabajador().equalsIgnoreCase(id_trabajador)) {
				listaTrabajadores.get(i).setNombre(nombre);
			}
		}
	}

}