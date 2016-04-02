package model;

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
	
	public void setAppResp(User user) throws BadArgumentException {
		if(user.getRole() == Role.APP_RESP) {
			// TODO
		} else {
			throw new BadArgumentException("" + user + " is not an AppResp");
		}
	}
}
