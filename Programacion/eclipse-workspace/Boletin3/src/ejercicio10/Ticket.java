package ejercicio10;

public class Ticket {

	private double precio;
	private String id;
	private boolean libre;
	private String fyb;
	
	public Ticket(double precio, String id, boolean libre, String fyb) {
		super();
		this.precio = precio;
		this.id = id;
		this.libre = libre;
		this.fyb = fyb;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public boolean isLibre() {
		return libre;
	}

	public void setLibre(boolean libre) {
		this.libre = libre;
	}

	public String getFyb() {
		return fyb;
	}

	public void setFyb(String fyb) {
		this.fyb = fyb;
	}

	@Override
	public String toString() {
		return "Ticket [precio=" + precio + ", id=" + id + ", libre=" + libre + ", fyb=" + fyb + "]";
	}
	
}

