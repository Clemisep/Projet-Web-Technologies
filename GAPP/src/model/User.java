package model;

import java.io.Serializable;
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
        PreparedStatement p = Utils.prepareStatement((String)"SELECT id_user FROM user WHERE CONCAT(last_name, CONCAT(' ', first_name)) LIKE CONCAT(?, '%')");
        p.setString(1, start);
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            users.add(new User(resultSet.getLong(1)));
        }
        return users;
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
        PreparedStatement p = Utils.getConnection().prepareStatement("SELECT last_name FROM user WHERE id_user = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        resultSet.next();
        return resultSet.getString(1);
    }

    public void setLastName(String lastName) throws SQLException {
        PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET last_name = ? WHERE id_user = ?");
        p.setString(1, lastName);
        p.setLong(2, this.getId());
        p.executeUpdate();
    }

    public String getFirstName() throws SQLException {
        PreparedStatement p = Utils.getConnection().prepareStatement("SELECT first_name FROM user WHERE id_user = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        resultSet.next();
        return resultSet.getString(1);
    }

    public void setFirstName(String firstName) throws SQLException {
        PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET first_name = ? WHERE id_user = ?");
        p.setString(1, firstName);
        p.setLong(2, this.getId());
        p.executeUpdate();
    }

    public Date getBirthDate() throws SQLException {
        PreparedStatement p = Utils.getConnection().prepareStatement("SELECT birth_date FROM user WHERE id_user = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        resultSet.next();
        return resultSet.getDate(1);
    }

    public void setBirthDate(Date date) throws SQLException {
        PreparedStatement p = Utils.getConnection().prepareStatement("UPDATE user SET birth_date = ? WHERE id_user = ?");
        p.setDate(1, date);
        p.setLong(2, this.getId());
        p.executeUpdate();
    }

    public static User addUser(String firstName, String lastName, Date birthDate) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO user(first_name, last_name, birth_date)VALUES(?, ?, ?)");
        p.setString(1, firstName);
        p.setString(2, lastName);
        p.setDate(3, birthDate);
        p.executeUpdate();
        long key = Utils.getKey((PreparedStatement)p);
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
            return new Student(this, idStudent, null);
        }
        return null;
    }

    public Student becomeStudent(String studentId) throws SQLException {
        assert (this.extractStudent() == null);
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO student(student_id) VALUES(?)");
        p.setString(1, studentId);
        p.executeUpdate();
        long idStudent = Utils.getKey((PreparedStatement)p);
        this.setAttrLong("is_student", 1);
        this.setAttrLong("id_student", idStudent);
        return new Student(this, idStudent, null);
    }

    public List<Student> getAllStudents() throws SQLException {
        LinkedList<Student> students = new LinkedList<Student>();
        PreparedStatement p = Utils.prepareStatement((String)"SELECT id_student FROM student");
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            students.add(new Student(this, resultSet.getLong(1), null));
        }
        return students;
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

    public Admin extractAdmin() throws SQLException {
        PreparedStatement p = Utils.prepareStatement((String)"SELECT is_admin, id_admin FROM user WHERE id_user = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        resultSet.next();
        boolean isAdmin = resultSet.getBoolean(1);
        if (isAdmin) {
            long idStudent = resultSet.getLong(2);
            return new Admin(this, idStudent, null);
        }
        return null;
    }

    public Admin becomeAdmin() throws SQLException {
        assert (this.extractAdmin() == null);
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO admin() VALUES()");
        p.executeUpdate();
        long idAdmin = Utils.getKey((PreparedStatement)p);
        return new Admin(this, idAdmin, null);
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
            return new Responsible(this, idResponsible, null);
        }
        return null;
    }

    public Responsible becomeResponsible() throws SQLException {
        assert (this.extractResponsible() == null);
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO responsible() VALUES()");
        p.executeUpdate();
        long idResponsible = Utils.getKey((PreparedStatement)p);
        return new Responsible(this, idResponsible, null);
    }

    public Tutor extractTutor() throws SQLException {
        PreparedStatement p = Utils.prepareStatement((String)"SELECT isTutor, idTutor FROM user WHERE id_user = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        resultSet.next();
        boolean isTutor = resultSet.getBoolean(1);
        if (isTutor) {
            long idTutor = resultSet.getLong(2);
            return new Tutor(this, idTutor, null);
        }
        return null;
    }

    public Tutor becomeTutor() throws SQLException {
        assert (this.extractTutor() == null);
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO tutor() VALUES()");
        p.executeUpdate();
        long idTutor = Utils.getKey((PreparedStatement)p);
        return new Tutor(this, idTutor, null);
    }

    public class Admin {
        private long idAdmin;
        final /* synthetic */ User this$0;

        private Admin(User user, long idAdmin) {
            this.this$0 = user;
            this.idAdmin = idAdmin;
        }

        public User getUser() {
            return this.this$0;
        }

        public long getId() {
            return this.idAdmin;
        }

        /* synthetic */ Admin(User user, long l, Admin admin) {
            Admin admin2;
            admin2(user, l);
        }
    }

public class Admin {
    private long idAdmin;
    final /* synthetic */ User this$0;

    private User.Admin(User user, long idAdmin) {
        this.this$0 = user;
        this.idAdmin = idAdmin;
    }

    public User getUser() {
        return this.this$0;
    }

    public long getId() {
        return this.idAdmin;
    }

    /* synthetic */ User.Admin(User user, long l, User.Admin admin) {
        User.Admin admin2;
        admin2(user, l);
    }
}

public class Responsible {
    private long idResponsible;
    final /* synthetic */ User this$0;

    private User.Responsible(User user, long idResponsible) {
        this.this$0 = user;
        this.idResponsible = idResponsible;
    }

    public User getUser() {
        return this.this$0;
    }

    public long getId() {
        return this.idResponsible;
    }

    /* synthetic */ User.Responsible(User user, long l, User.Responsible responsible) {
        User.Responsible responsible2;
        responsible2(user, l);
    }
}

public class Student
extends Table {
    private static final long serialVersionUID = 3775267000189437274L;
    final /* synthetic */ User this$0;

    private User.Student(User user, long idStudent) throws SQLException {
        this.this$0 = user;
        super("student", idStudent);
    }

    public User getUser() {
        return this.this$0;
    }

    public String getStudentId() throws SQLException {
        PreparedStatement p = Utils.prepareStatement((String)"SELECT student_id FROM student WHERE student_id = ?");
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
        long idGroupApp = this.getAttrLong("group_app");
        return new GroupApp(idGroupApp);
    }

    public void setGroupApp(GroupApp groupApp) throws SQLException {
        this.setAttrLong("group_app", groupApp.getId());
    }

    public List<SkillInstance> getSkillInstances() throws SQLException {
        LinkedList<SkillInstance> skillInstances = new LinkedList<SkillInstance>();
        PreparedStatement p = Utils.prepareStatement((String)"SELECT id_skill_instance FROM skill_instance WHERE id_user = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            skillInstances.add(new SkillInstance(resultSet.getLong(1)));
        }
        return skillInstances;
    }

    /* synthetic */ User.Student(User user, long l, User.Student student) throws SQLException {
        User.Student student2;
        student2(user, l);
    }

public class Tutor {
    private long idTutor;
    final /* synthetic */ User this$0;

    private User.Tutor(User user, long idTutor) {
        this.this$0 = user;
        this.idTutor = idTutor;
    }

    public User getUser() {
        return this.this$0;
    }

    public long getId() {
        return this.idTutor;
    }

    /* synthetic */ User.Tutor(User user, long l, User.Tutor tutor) {
        User.Tutor tutor2;
        tutor2(user, l);
    }
}
}