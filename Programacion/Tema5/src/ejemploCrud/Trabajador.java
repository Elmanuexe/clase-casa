package ejemploCrud;

public class Trabajador {
	
	private String nombre;
	private String apellidos;
	private String idTrabajador;
	private double sueldo;
	private String fechaNacimiento;
	
	

	public Trabajador(String nombre, String apellidos, String idTrabajador, double sueldo, String fechaNacimiento) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.idTrabajador = idTrabajador;
		this.sueldo = sueldo;
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getIdTrabajador() {
		return idTrabajador;
	}

	public void setIdTrabajador(String idTrabajador) {
		this.idTrabajador = idTrabajador;
	}

	public double getSueldo() {
		return sueldo;
	}

	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	@Override
	public String toString() {
		return "Trabajador [nombre=" + nombre + ", idTrabajador=" + idTrabajador + ", sueldo=" + sueldo + ", apellidos="
				+ apellidos + ", fechaNacimiento=" + fechaNacimiento + "]";
	}
	
}
