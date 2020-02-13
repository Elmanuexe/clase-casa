package ejercicio09;

public class Alumno {
	
	private double media;
	private double entornos;
	private double programacion;
	private double baseDatos;
	private double lenguaje;
	
	
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

	public Alumno(double media, double entornos, double programacion, double baseDatos, double lenguaje) {
		this.media=media;
		this.entornos=entornos;
		this.programacion=programacion;
		this.baseDatos=baseDatos;
		this.lenguaje=lenguaje;
	}
	
	public double calcularMedia() {
		return media= (entornos+programacion+baseDatos+lenguaje)/4;
	}
}
