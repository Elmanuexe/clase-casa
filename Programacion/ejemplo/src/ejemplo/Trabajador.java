package ejemplo;

public class Trabajador {

	private String nombre;
	private String Puesto;
	private String direccion;
	private String telefono;
	private String nSS; // N�mero Seguridad Social

	public Trabajador(String nombre, String puesto, String direccion,String
		telefono, String nSS) {
		this.nombre = nombre;
		this.Puesto = puesto;
		this.direccion = direccion;
		this.telefono = telefono;
		this.nSS = nSS;
		Trabajador
		* nombre
		* Puesto
		* direcci�n
		* tel�fono
		* nSS (N�mero Seguridad Social)
		__________________
		* equals ( )
		* toString ( )
		* calcularPaga ( )
		Empleado
		* sueldo
		* impuestos
		_______________
		* calcularPaga ( )
		* toString ( )
		Consultor
		* horas
		* tarifa
		________________
		* calcularPaga ( )
		* toString ( )
		}

	public Trabajador(String nombre, String nSS) {
		this.nombre = nombre;
		this.nSS = nSS;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPuesto() {
		return Puesto;
	}

	public void setPuesto(String puesto) {
		Puesto = puesto;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getnSS() {
		return nSS;
	}

	public void setNSS(String nSS) {
		nSS = nSS;
	}

	// Siempre es recomendable definir los m�todos equals ( ) y toString ( ),
	veremos m�s
	adelante por
	qu� motivos.
	// M�todo para comparar objetos (trabajadores) por el n�mero de la
	seguridad social, es decir,
	en este
	programa un
	trabajador es
	igual a
	otro
		cuando
	tienen el
	mismo n�mero
	de la
	seguridad social

	public boolean equals(Trabajador t) {
		return this.nSS.equals(t.nSS);
	}

	// M�todo para convertir un objeto en una cadena
	public String toString() {
		return nombre + " (NSS " + nSS + ")";
	}

	// No sabemos c�mo se calcula la paga para un trabajador gen�rico, por lo que ponemos el m�todo pero sin hacer ning�n c�lculo

	public double calcularPaga() {
		return 0.0;
	}
}
