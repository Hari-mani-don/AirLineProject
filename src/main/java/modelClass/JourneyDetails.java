package modelClass;

public class JourneyDetails {
	private int id;
	private String UserName;
	private String FlightNumber;
	private String FlightName;
	private String Destination;
	private String Source;
	private String Time;
	private String email;
	private String Process;
	private double Amount;

	public JourneyDetails() {

	}

	public JourneyDetails(int id, String userName, String flightNumber, String flightName, String destination,
			String source, String time, String email, String process, double amount) {
		super();
		this.id = id;
		UserName = userName;
		FlightNumber = flightNumber;
		FlightName = flightName;
		Destination = destination;
		Source = source;
		Time = time;
		this.email = email;
		Process = process;
		Amount = amount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getFlightNumber() {
		return FlightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		FlightNumber = flightNumber;
	}

	public String getFlightName() {
		return FlightName;
	}

	public void setFlightName(String flightName) {
		FlightName = flightName;
	}

	public String getDestination() {
		return Destination;
	}

	public void setDestination(String destination) {
		Destination = destination;
	}

	public String getSource() {
		return Source;
	}

	public void setSource(String source) {
		Source = source;
	}

	public String getTime() {
		return Time;
	}

	public void setTime(String time) {
		Time = time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProcess() {
		return Process;
	}

	public void setProcess(String process) {
		Process = process;
	}

	public double getAmount() {
		return Amount;
	}

	public void setAmount(double amount) {
		Amount = amount;
	}

	@Override
	public String toString() {
		return "JourneyDetails [id=" + id + ", UserName=" + UserName + ", FlightNumber=" + FlightNumber
				+ ", FlightName=" + FlightName + ", Destination=" + Destination + ", Source=" + Source + ", Time="
				+ Time + ", email=" + email + ", Process=" + Process + ", Amount=" + Amount + "]";
	}

}
