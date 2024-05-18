package modelClass;

public class TicketBooking {
	private String fullName;
	private String email;
	private long phone;
	private String panCard;
	private long aadhaarNumber;
	private String destination;
	private String source;
	private String passport;
	private double amount;
	private String time;
	private String flightNumber;
	private String flightName;

	public TicketBooking() {

	}

	public TicketBooking(String fullName, String email, long phone, String panCard, long aadhaarNumber,
			String destination, String source, String passport, double amount, String time, String flightNumber,
			String flightName) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.phone = phone;
		this.panCard = panCard;
		this.aadhaarNumber = aadhaarNumber;
		this.destination = destination;
		this.source = source;
		this.passport = passport;
		this.amount = amount;
		this.time = time;
		this.flightNumber = flightNumber;
		this.flightName = flightName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getPanCard() {
		return panCard;
	}

	public void setPanCard(String panCard) {
		this.panCard = panCard;
	}

	public long getAadhaarNumber() {
		return aadhaarNumber;
	}

	public void setAadhaarNumber(long aadhaarNumber) {
		this.aadhaarNumber = aadhaarNumber;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getFlightName() {
		return flightName;
	}

	public void setFlightName(String flightName) {
		this.flightName = flightName;
	}

	@Override
	public String toString() {
		return "TicketBooking [fullName=" + fullName + ", email=" + email + ", phone=" + phone + ", panCard=" + panCard
				+ ", aadhaarNumber=" + aadhaarNumber + ", destination=" + destination + ", source=" + source
				+ ", passport=" + passport + ", amount=" + amount + ", time=" + time + ", flightNumber=" + flightNumber
				+ ", flightName=" + flightName + "]";
	}

}
