package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User implements Serializable {
	
	private static final long serialVersionUID = 7699319658256886957L;
	private final long idUser;
	
	private User(long id) {
		this.idUser = id;
	}
	
	public String getLastName() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT last_name FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getString(1);
	}
	
	public void setLastName(String lastName) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET last_name = ? WHERE id_user = ?");
		p.setString(1, lastName);
		p.setLong(2, idUser);
		p.executeUpdate();
	}
	
	public String getFirstName() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT first_name FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getString(1);
	}
	
	public void setFirstName(String firstName) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET first_name = ? WHERE id_user = ?");
		p.setString(1, firstName);
		p.setLong(2, idUser);
		p.executeUpdate();
	}
	
	public Date getBirthDate() throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("SELECT birth_date FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet.getDate(1);
	}
	
	public void setBirthDate(Date date) throws SQLException {
		PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET birth_date = ? WHERE id_user = ?");
		p.setDate(1, date);
		p.setLong(2, idUser);
		p.executeUpdate();
	}
	
	public static User addUser(String firstName, String lastName, Date birthDate) throws SQLException {
		
		PreparedStatement p = Utils.prepareStatementWithKey(
				"INSERT INTO user(first_name, last_name, birthDate)"
				+ "VALUES(?, ?, ?)"
				);
		p.setString(1, firstName);
		p.setString(2, lastName);
		p.setDate(3, birthDate);
		p.executeUpdate();
		long key = Utils.getKey(p);
		return new User(key);
	}

	public Student extractStudent() throws SQLException {
		PreparedStatement p = Utils.prepareStatement("SELECT is_student, id_student FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		
		boolean isStudent = resultSet.getBoolean(1);
		
		if(isStudent) {
			long idStudent = resultSet.getLong(2);
			return new Student(idStudent);
		} else {
			return null;
		}
	}
	
	/**
	 * The user must not be a student already.
	 * @param studentId
	 * @return
	 * @throws SQLException
	 */
	public Student becomeStudent(String studentId) throws SQLException {
		assert extractStudent() == null;
		PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO student(student_id) VALUES(?)");
		p.setString(1, studentId);
		p.executeUpdate();
		long idStudent = Utils.getKey(p);
		return new Student(idStudent);
	}
	
	public class Student {
		
		private long idStudent;
		
		private Student(long idStudent) throws SQLException {
			this.idStudent = idStudent;
		}
		
		public User getUser() {
			return User.this;
		}
		
		public String getStudentId() throws SQLException {
			PreparedStatement p = Utils.prepareStatement("SELECT student_id FROM student WHERE student_id = ?");
			p.setLong(1, idStudent);
			return Utils.execResult(p).getString(1);
		}
		
		public void setStudentId(String studentId) throws SQLException {
			PreparedStatement p = Utils.prepareStatement("UPDATE student SET student_id = ? WHERE id_user = ?");
			p.setString(1, studentId);
			p.setLong(2, idStudent);
			p.executeUpdate();
		}

		public long getId() {
			return idStudent;
		}
	}
	
	public Admin extractAdmin() throws SQLException {
		PreparedStatement p = Utils.prepareStatement("SELECT is_admin, id_admin FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		
		boolean isAdmin = resultSet.getBoolean(1);
		
		if(isAdmin) {
			long idStudent = resultSet.getLong(2);
			return new Admin(idStudent);
		} else {
			return null;
		}
	}
	
	public Admin becomeAdmin() throws SQLException {
		assert extractAdmin() == null;
		PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO admin() VALUES()");
		p.executeUpdate();
		long idAdmin = Utils.getKey(p);
		return new Admin(idAdmin);
	}
	
	public class Admin {
		
		private long idAdmin;
		
		private Admin(long idAdmin) {
			this.idAdmin = idAdmin;
		}
		
		public User getUser() {
			return User.this;
		}
		
		public long getId() {
			return idAdmin;
		}
	}
	
	public static Responsible getResponsible(long idResponsible) throws SQLException {
		PreparedStatement p = Utils.prepareStatement("SELECT id_user FROM user WHERE id_responsible = ?");
		p.setLong(1, idResponsible);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		long idUser = resultSet.getLong(1);
		User user = new User(idUser);
		return user.extractResponsible();
	}
	
	public Responsible extractResponsible() throws SQLException {
		PreparedStatement p = Utils.prepareStatement("SELECT is_responsible, id_responsible FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		
		boolean isResponsible = resultSet.getBoolean(1);
		
		if(isResponsible) {
			long idResponsible = resultSet.getLong(2);
			return new Responsible(idResponsible);
		} else {
			return null;
		}
	}
	
	public Responsible becomeResponsible() throws SQLException {
		assert extractResponsible() == null;
		PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO responsible() VALUES()");
		p.executeUpdate();
		long idResponsible = Utils.getKey(p);
		return new Responsible(idResponsible);
	}
	
	/**
	 * Responsible of an APP.
	 * @author Clement
	 *
	 */
	public class Responsible {
		private long idResponsible;
		
		private Responsible(long idResponsible) {
			this.idResponsible = idResponsible;
		}
		
		public User getUser() {
			return User.this;
		}
		
		public long getId() {
			return idResponsible;
		}
	}
	
	public Tutor extractTutor() throws SQLException {
		PreparedStatement p = Utils.prepareStatement("SELECT isTutor, idTutor FROM user WHERE id_user = ?");
		p.setLong(1, idUser);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		
		boolean isTutor = resultSet.getBoolean(1);
		
		if(isTutor) {
			long idTutor = resultSet.getLong(2);
			return new Tutor(idTutor);
		} else {
			return null;
		}
	}
	
	public Tutor becomeTutor() throws SQLException {
		assert extractTutor() == null;
		PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO tutor() VALUES()");
		p.executeUpdate();
		long idTutor = Utils.getKey(p);
		return new Tutor(idTutor);
	}
	
	public class Tutor {
		private long idTutor;
		
		private Tutor(long idTutor) {
			this.idTutor = idTutor;
		}
		
		public User getUser() {
			return User.this;
		}
		
		public long getId() {
			return idTutor;
		}
	}
}
