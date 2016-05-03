package model;

import java.sql.SQLException;
import java.util.List;

public class Group extends Table {
	
	public Group(long idGroup) {
		super("group", idGroup);
	}
	
	public List<User> getUsers() {
		return null; // TODO
	}
	
	public void addUser(User user) {
		// TODO
	}
	
	public void removeUser(User user) throws BadArgumentException {
		// TODO
	}
	
	public User.Responsible getResponsible() throws SQLException {
		return User.getResponsible(getAttrLong("id_responsible"));
	}
	
	public void setResponsible(User.Responsible responsible) throws BadArgumentException, SQLException {
		setAttrLong("id_responsible", responsible.getId());
	}
}
