package bikebuddy;

public class Booking {
    private String customerName;
    private String bookingType;
    private String customerMobile;
    private String customerEmail;
    private String bike;
    private String bookingDate;

    public Booking(String customerName, String bookingType, String customerMobile, String customerEmail, String bike, String bookingDate) {
        this.customerName = customerName;
        this.bookingType = bookingType;
        this.customerMobile = customerMobile;
        this.customerEmail = customerEmail;
        this.bike = bike;
        this.bookingDate = bookingDate;
    }

    public String getCustomerName() { return customerName; }
    public String getBookingType() { return bookingType; }
    public String getCustomerMobile() { return customerMobile; }
    public String getCustomerEmail() { return customerEmail; }
    public String getBike() { return bike; }
    public String getBookingDate() { return bookingDate; }
}
