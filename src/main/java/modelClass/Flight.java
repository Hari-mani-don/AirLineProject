package modelClass;

public class Flight {
	private String flightName;
	private String flightNumber;
	private String flightsource;
	private String flightdestination;
	private String flightTimes;
	private int id;
	private double flightAmount;

	public Flight() {

	}

	public Flight(double flightAmount,int id, String flightName, String flightNumber, String flightsource, String flightdestination,
			String flightTimes) {
		super();
		this.flightAmount=flightAmount;
		this.id = id;
		this.flightName = flightName;
		this.flightNumber = flightNumber;
		this.flightsource = flightsource;
		this.flightdestination = flightdestination;
		this.flightTimes = flightTimes;
	}

	
	public double getFlightAmount() {
		return flightAmount;
	}

	public void setFlightAmount(double flightAmount) {
		this.flightAmount = flightAmount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getFlightsource() {
		return flightsource;
	}

	public void setFlightsource(String flightsource) {
		this.flightsource = flightsource;
	}

	public String getFlightdestination() {
		return flightdestination;
	}

	public void setFlightdestination(String flightdestination) {
		this.flightdestination = flightdestination;
	}

	public String getFlightTimes() {
		return flightTimes;
	}

	public void setFlightTimes(String flightTimes) {
		this.flightTimes = flightTimes;
	}

	@Override
	public String toString() {
		return "Flight [flightName=" + flightName + ", flightNumber=" + flightNumber + ", flightsource=" + flightsource
				+ ", flightdestination=" + flightdestination + ", flightTimes=" + flightTimes + ", id=" + id
				+ ", flightAmount=" + flightAmount + "]";
	}

	

}
