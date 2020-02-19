package ejemplo;

public class Alumno {
	
	private String nombre;
	private int edad;
	 {
		// TODO Auto-generated constructor stub
	}

	public String getNombre() {
		return nombre;
	}
	
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public double getNota() {
		return nota;
	}
	public void setNota(double nota) {
		this.nota = nota;
	}
	private double nota;
	
	@Override
	public String toString() {
		return "Alumno [nombre=" + nombre + ", edad=" + edad + ", nota=" + nota + "]";
	}
	
	public Alumno(String nombre, int edad, double nota) {
		this.nombre=nombre;
		this.edad=edad;
		this.nota=nota;
	}

}
