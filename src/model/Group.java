package model;

import java.sql.SQLException;
import java.util.List;

public class Group {
	public List<User> getUsers() {
		return null; // TODO
	}
	
	public void addUser(User user) {
		// TODO
	}
	
	public void removeUser(User user) throws BadArgumentException {
		// TODO
	}
	
	public User getAppResp() {
		return null;
	}
	
	public void setAppResp(User user) throws BadArgumentException, SQLException {
		if(user.getRole() == Role.APP_RESP) {
			// TODO
		} else {
			throw new BadArgumentException("" + user + " is not an AppResp");
		}
	}
}
