package model;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Table;
import model.User;
import model.Utils;

public class User
extends Table
implements Serializable {
	private static final long serialVersionUID = 7699319658256886957L;

	private User(long id) {
		super("user", id);
	}

	public static List<User> findUsers(String start) throws SQLException {
		LinkedList<User> users = new LinkedList<User>();
		try (PreparedStatement p =
				Utils.prepareStatement((String)"SELECT id_user FROM user WHERE CONCAT(last_name, CONCAT(' ', first_name)) LIKE CONCAT(?, '%')")) {
			p.setString(1, start);
			try (ResultSet resultSet = p.executeQuery()) {
				while (resultSet.next()) {
					users.add(new User(resultSet.getLong(1)));
				}
			}
		}
		return users;
		
	}
	
	public static User findUser(String pseudo) throws SQLException {
		User user = null;
		try (PreparedStatement p = Utils.prepareStatement("SELECT id_user FROM user WHERE pseudo = ?")) {
			p.setString(1, pseudo);
			try (ResultSet resultSet = p.executeQuery()) {
				resultSet.next();
				user = new User(resultSet.getLong(1));
			} catch(SQLException e) {
				return null;
			}
		}
		return user;
	}

	public static List<Student> findStudents(String start) throws SQLException {
		LinkedList<Student> students = new LinkedList<Student>();
		for (User user : User.findUsers(start)) {
			Student student = user.extractStudent();
			if (student == null) continue;
			students.add(student);
		}
		return students;
	}

	public String getLastName() throws SQLException {
		String lastName;
		try (PreparedStatement p = Utils.prepareStatement("SELECT last_name FROM user WHERE id_user = ?")) {
			p.setLong(1, this.getId());
			try (ResultSet resultSet = p.executeQuery()) {
				resultSet.next();
				lastName = resultSet.getString(1);
			}
		}
		return lastName;
	}

	public void setLastName(String lastName) throws SQLException {
		try (PreparedStatement p = Utils.prepareStatement("UPDATE user SET last_name = ? WHERE id_user = ?")) {
			p.setString(1, lastName);
			p.setLong(2, this.getId());
			p.executeUpdate();
		}
	}

	public String getFirstName() throws SQLException {
		String firstName;
		try (PreparedStatement p = Utils.getConnection().prepareStatement("SELECT first_name FROM user WHERE id_user = ?")) {
			p.setLong(1, this.getId());
			try (ResultSet resultSet = p.executeQuery()) {
				resultSet.next();
				firstName = resultSet.getString(1);
			}
		}
		return firstName;
	}

	public void setFirstName(String firstName) throws SQLException {
		try (PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET first_name = ? WHERE id_user = ?")) {
			p.setString(1, firstName);
			p.setLong(2, this.getId());
			p.executeUpdate();
		}
	}

	public Date getBirthDate() throws SQLException {
		Date date;
		try (PreparedStatement p = Utils.getConnection().prepareStatement("SELECT birth_date FROM user WHERE id_user = ?")) {
			p.setLong(1, this.getId());
			try (ResultSet resultSet = p.executeQuery()) {
				resultSet.next();
				date = resultSet.getDate(1);
			}
		}
		return date;
	}

	public void setBirthDate(Date date) throws SQLException {
		try (PreparedStatement p = Utils.prepareStatement("UPDATE user SET birth_date = ? WHERE id_user = ?")) {
			p.setDate(1, date);
			p.setLong(2, this.getId());
			p.executeUpdate();
		}
	}
	
	public String getEncryptedPassword() throws SQLException, NoSuchAlgorithmException {
		return getAttrString("password");
	}
	
	public void setPassword(String password) throws SQLException {
		setAttrString("password", CryptWithMD5.cryptWithMD5(password));
	}

	public static User addUser(String pseudo, String firstName, String lastName, Date birthDate, String password, String picture) throws SQLException {
		long key;
		try (PreparedStatement p = Utils.prepareStatementWithKey(
				(String)"INSERT INTO user(pseudo, first_name, last_name, birth_date, password, picture) VALUES(?, ?, ?, ?, ?,?)")) {
			p.setString(1, pseudo);
			p.setString(2, firstName);
			p.setString(3, lastName);
			p.setDate(4, birthDate);
			p.setString(5, CryptWithMD5.cryptWithMD5(password));
			p.setString(6, picture);
			p.executeUpdate();
			key = Utils.getKey((PreparedStatement)p);
		}
		return new User(key);
	}

	public Student extractStudent() throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT is_student, id_student FROM user WHERE id_user = ?");
		p.setLong(1, this.getId());
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		boolean isStudent = resultSet.getBoolean(1);
		if (isStudent) {
			long idStudent = resultSet.getLong(2);
			return new Student(idStudent);
		}
		return null;
	}

	public Student becomeStudent(String studentId, long promo) throws SQLException {
		assert (this.extractStudent() == null);
		PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO student(student_id, promo) VALUES(?,?)");
		p.setString(1, studentId);
		p.setLong(2, promo);
		p.executeUpdate();
		long idStudent = Utils.getKey((PreparedStatement)p);
		this.setAttrLong("is_student", 1);
		this.setAttrLong("id_student", idStudent);
		p.close();
		return new Student(idStudent);
	}
	
	public static List<User> getAllUsers() throws SQLException {
		LinkedList<User> users = new LinkedList<>();
		PreparedStatement p = Utils.prepareStatement("SELECT id_user FROM user");
		ResultSet resultSet = p.executeQuery();
		while(resultSet.next()) {
			users.add(new User(resultSet.getLong(1)));
		}
		return users;
	}
	
	public static List<Responsible> getAllResponsibles() throws SQLException {
		
		LinkedList<Responsible> responsibles = new LinkedList<Responsible>();
		
		for (User user : getAllUsers()) {
			Responsible responsible = user.extractResponsible();
			if(responsible != null)
				responsibles.add(responsible);
		}
		
		return responsibles;
	}
	
	
	public static List<Tutor> getAllTutors() throws SQLException {
		
		LinkedList<Tutor> tutors = new LinkedList<Tutor>();
		
		for (User user : getAllUsers()) {
			Tutor tutor = user.extractTutor();
			if(tutor != null)
				tutors.add(tutor);
		}
		
		return tutors;
	}
	

	public static Student getStudent(long idStudent) throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT id_user FROM user WHERE id_student = ?");
		p.setLong(1, idStudent);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		long idUser = resultSet.getLong(1);
		User user = new User(idUser);
		return user.extractStudent();
	}

	public static User.Tutor getTutor(long idTutor) throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT id_tutor FROM tutor WHERE id_tutor = ?");
		p.setLong(1, idTutor);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		long idUser = resultSet.getLong(1);
		User user = new User(idUser);
		return user.extractTutor();
	}
	
	public Admin extractAdmin() throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT is_admin, id_admin FROM user WHERE id_user = ?");
		p.setLong(1, this.getId());
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		boolean isAdmin = resultSet.getBoolean(1);
		if (isAdmin) {
			long idStudent = resultSet.getLong(2);
			return new Admin(idStudent);
		}
		return null;
	}

	public Admin becomeAdmin() throws SQLException {
		assert (this.extractAdmin() == null);
		PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO admin() VALUES()");
		p.executeUpdate();
		long idAdmin = Utils.getKey((PreparedStatement)p);
		setAttrLong("is_admin", 1);
		setAttrLong("id_admin", idAdmin);
		p.close();
		
		return new Admin(idAdmin);
	}

	public static Responsible getResponsible(long idResponsible) throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT id_user FROM user WHERE id_responsible = ?");
		p.setLong(1, idResponsible);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		long idUser = resultSet.getLong(1);
		User user = new User(idUser);
		return user.extractResponsible();
	}

	public Responsible extractResponsible() throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT is_responsible, id_responsible FROM user WHERE id_user = ?");
		p.setLong(1, this.getId());
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		boolean isResponsible = resultSet.getBoolean(1);
		if (isResponsible) {
			long idResponsible = resultSet.getLong(2);
			return new Responsible(idResponsible);
		}
		return null;
	}

	public Responsible becomeResponsible() throws SQLException {
		assert (this.extractResponsible() == null);
		PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO responsible() VALUES()");
		p.executeUpdate();
		long idResponsible = Utils.getKey((PreparedStatement)p);
		setAttrLong("is_responsible", 1);
		setAttrLong("id_responsible", idResponsible);
		p.close();
		return new Responsible(idResponsible);
	}

	public Tutor extractTutor() throws SQLException {
		PreparedStatement p = Utils.prepareStatement((String)"SELECT is_tutor, id_tutor FROM user WHERE id_user = ?");
		p.setLong(1, this.getId());
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		boolean isTutor = resultSet.getBoolean(1);
		if (isTutor) {
			long idTutor = resultSet.getLong(2);
			return new Tutor(idTutor);
		}
		return null;
	}

	public Tutor becomeTutor() throws SQLException {
		assert (this.extractTutor() == null);
		PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO tutor() VALUES()");
		p.executeUpdate();
		long idTutor = Utils.getKey((PreparedStatement)p);
		setAttrLong("is_tutor", 1);
		setAttrLong("id_tutor", idTutor);
		
		p.close();
		return new Tutor(idTutor);
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
			return this.idAdmin;
		}
	}

	public class Responsible {
		private long idResponsible;

		private Responsible(long idResponsible) {
			this.idResponsible = idResponsible;
		}

		public User getUser() {
			return User.this;
		}

		public long getId() {
			return this.idResponsible;
		}
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
			return this.idTutor;
		}
	}

	public class Student
	extends Table {
		private static final long serialVersionUID = 3775267000189437274L;

		private Student(long idStudent) throws SQLException {
			super("student", idStudent);
		}

		public User getUser() {
			return User.this;
		}

		public String getStudentId() throws SQLException {
			PreparedStatement p = Utils.prepareStatement((String)"SELECT student_id FROM student WHERE id_student = ?");
			p.setLong(1, this.getId());
			return Utils.execResult((PreparedStatement)p).getString(1);
		}

		public void setStudentId(String studentId) throws SQLException {
			PreparedStatement p = Utils.prepareStatement((String)"UPDATE student SET student_id = ? WHERE id_user = ?");
			p.setString(1, studentId);
			p.setLong(2, this.getId());
			p.executeUpdate();
		}

		public GroupApp getGroupApp() throws SQLException {
			long idGroupApp = this.getAttrLong("id_group_app");
			return new GroupApp(idGroupApp);
		}

		public void setGroupApp(GroupApp groupApp) throws SQLException {
			this.setAttrLong("id_group_app", groupApp.getId());
		}

		public List<SkillInstance> getSkillInstances() throws SQLException {
			LinkedList<SkillInstance> skillInstances = new LinkedList<SkillInstance>();
			PreparedStatement p = Utils.prepareStatement((String)"SELECT id_skill_instance FROM skill_instance WHERE id_student = ?");
			p.setLong(1, this.getId());
			ResultSet resultSet = p.executeQuery();
			while (resultSet.next()) {
				skillInstances.add(new SkillInstance(resultSet.getLong(1)));
			}
			return skillInstances;
		}
	}
}