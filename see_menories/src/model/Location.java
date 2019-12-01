package model;

public class Location {
	
	private int count;
	private String location_name;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getLocation_name() {
		return location_name;
	}
	public void setLocation_name(String location_name) {
		this.location_name = location_name;
	}
	public Location() {
		super();
	}
	public Location(int count, String location_name) {
		super();
		this.count = count;
		this.location_name = location_name;
	}
	@Override
	public String toString() {
		return "Location [count=" + count + ", location_name=" + location_name + "]";
	}
	
	

}
