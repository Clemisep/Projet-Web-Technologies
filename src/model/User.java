package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.mysql.jdbc.Statement;

public class User {
	
	private final long id;
	
	private User(long id) {
		this.id = id;
	}
	
	public String getLastName() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT lastName FROM user WHERE idUser = ?");
		p.setLong(1, id);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getString(1);
	}
	
	public void setLastName(String lastName) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET lastName = ? WHERE idUser = ?");
		p.setString(1, lastName);
		p.setLong(2, id);
		p.executeUpdate();
	}
	
	public String getFirstName() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT firstName FROM user WHERE idUser = ?");
		p.setLong(1, id);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getString(1);
	}
	
	public void setFirstName(String firstName) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET firstName = ? WHERE idUser = ?");
		p.setString(1, firstName);
		p.setLong(2, id);
		p.executeUpdate();
	}
	
	public Date getBirthDate() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT birthDate FROM user WHERE idUser = ?");
		p.setLong(1, id);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getDate(1);
	}
	
	public void setBirthDate(Date date) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET birthDate = ? WHERE idUser = ?");
		p.setDate(1, date);
		p.setLong(2, id);
		p.executeUpdate();
	}
	
	public Role getRole() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT role FROM user WHERE idUser = ?");
		p.setLong(1, id);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return Role.valueOf(resultSet.getString(1));
	}
	
	public void setRole(Role role) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET role = ? WHERE idUser = ?");
		p.setString(1, role.name());
		p.setLong(2, id);
		p.executeUpdate();
	}
	
	public String getStudentId() throws RoleException, SQLException {
		if(getRole() == Role.STUDENT) {
			PreparedStatement p = Utils.getConnection().prepareStatement("SELECT studentId FROM user WHERE idUser = ?");
			p.setLong(1, id);
			ResultSet resultSet = p.executeQuery();
			resultSet.next();
			return resultSet.getString(1);
		} else {
			throw new RoleException("Can't get the student id of a user who is not a student.");
		}
	}
	
	public void setStudentId(String studentId) throws RoleException, SQLException {
		if(getRole() == Role.STUDENT) {
			PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET studentId = ? WHERE idUser = ?");
			p.setString(1, studentId);
			p.setLong(2, id);
			p.executeUpdate();
		} else {
			throw new RoleException("Can't set the student id of a user who is not a student.");
		}
	}
	
	public int getMark() throws RoleException, SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT mark FROM user WHERE idUser = ?");
		p.setLong(1, id);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getInt(1);
	}
	
	public void setMark(int mark) throws RoleException, SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET mark = ? WHERE idUser = ?");
		p.setInt(1, mark);
		p.setLong(2, id);
		p.executeUpdate();
	}
	
	public List<Group> getGroups() throws RoleException {
		return null;
	}
	
	public void removeUser() throws RoleException {
		
	}
	
	public static User addUser(String firstName, String lastName, Date birthDate, Role role, String studentId) throws SQLException {
		
		PreparedStatement p = Utils.getConnection().prepareStatement(
				"INSERT INTO user(firstName, lastName, birthDate, role, studentId, mark)"
				+ "VALUES(?, ?, ?, ?, ?, ?)",
				Statement.RETURN_GENERATED_KEYS
				);
		p.setString(1, firstName);
		p.setString(2, lastName);
		p.setDate(3, birthDate);
		p.setString(4, role.name());
		p.setString(5, studentId);
		p.setLong(6, 0);
		
		p.executeUpdate();
		ResultSet keys = p.getGeneratedKeys();
		keys.next();
		
		long key = keys.getLong(1);
		System.out.println(key);
		return new User(key);
	}
}
