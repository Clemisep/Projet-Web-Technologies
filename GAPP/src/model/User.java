package model;

import java.sql.Date;
import java.util.List;

public class User {
	
	private User() {}
	
	public String getLastName() {
		return ""; // TODO
	}
	
	public void setLastName(String lastName) {
		// TODO
	}
	
	public String getFirstName() {
		return ""; // TODO
	}
	
	public void setFirstName(String firstName) {
		// TODO
	}
	
	public Date getBirthDate() {
		return null; // TODO
	}
	
	public void setBirthDate(Date date) {
		// TODO
	}
	
	public Role getRole() {
		return null; // TODO
	}
	
	public void setRole(Role role) {
		// TODO
	}
	
	public long getStudentId() throws RoleException {
		return 0; // TODO
	}
	
	public void setStudentId(long id) throws RoleException {
		// TODO
	}
	
	public int getMark() throws RoleException {
		return 0; // TODO
	}
	
	public void setMark(int mark) throws RoleException {
		// TODO
	}
	
	public List<Group> getGroups() throws RoleException {
		return null;
	}
	
	public void removeUser() throws RoleException {
		
	}
	
	public static User addUser() {
		// TODO
		return new User();
	}
}
