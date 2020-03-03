package ejercicio09;

public class Alumno {

	private String nombre;
	private double media;
	private double entornos;
	private double programacion;
	private double baseDatos;
	private double lenguaje;
	private int suspensos;
	
	public int getSuspensos() {
		return suspensos;
	}

	public void setSuspensos(int suspensos) {
		this.suspensos = suspensos;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getMedia() {
		return media;
	}

	public void setMedia(double media) {
		this.media = media;
	}

	public double getEntornos() {
		return entornos;
	}

	public void setEntornos(double entornos) {
		this.entornos = entornos;
	}

	public double getProgramacion() {
		return programacion;
	}

	public void setProgramacion(double programacion) {
		this.programacion = programacion;
	}

	public double getBaseDatos() {
		return baseDatos;
	}

	public void setBaseDatos(double baseDatos) {
		this.baseDatos = baseDatos;
	}

	public double getLenguaje() {
		return lenguaje;
	}

	public void setLenguaje(double lenguaje) {
		this.lenguaje = lenguaje;
	}

	public Alumno(String nombre, double media, double entornos, double programacion, double baseDatos, double lenguaje, int suspensos) {
		this.nombre = nombre;
		this.media = media;
		this.entornos = entornos;
		this.programacion = programacion;
		this.baseDatos = baseDatos;
		this.lenguaje = lenguaje;
		this.suspensos = suspensos;
	}

	public double calcularMedia() {
		return media = (entornos + programacion + baseDatos + lenguaje) / 4;
	}
}
