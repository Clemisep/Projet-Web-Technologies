package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Table;
import model.User;
import model.Utils;

public class GroupApp
extends Table {
    private static final long serialVersionUID = -2752434798960535732L;

    private GroupApp(long id) {
        super("group_app", id);
    }
    
    public static GroupApp getGroupApp(long id) {
    	return new GroupApp(id);
    }

    public void addStudent(User.Student student) throws SQLException {
        student.setGroupApp(this);
    }

    public void removeUser(User.Student student) throws SQLException {
        student.setGroupApp(null);
    }

    public List<User.Student> getStudents() throws SQLException {
    	LinkedList<User.Student> users = new LinkedList<User.Student>();
    	try(PreparedStatement p = Utils.prepareStatement("SELECT id_student FROM student WHERE id_group_app = ?")) {
    		try(Connection connection = p.getConnection()) {
    			p.setLong(1, this.getId());
    			ResultSet resultSet = p.executeQuery();
    			while (resultSet.next()) {
    				users.add(User.getStudent(resultSet.getLong(1)));
    			}
    		}
        }
        return users;
    }

    public static List<GroupApp> getGroups() throws SQLException {
    	LinkedList<GroupApp> groups = new LinkedList<>();
    	try(PreparedStatement p = Utils.prepareStatement("SELECT id_group_app FROM group_app")) {
    		try(Connection connection = p.getConnection()) {
    			try(ResultSet resultSet = p.executeQuery()) {
    				while (resultSet.next()) {
    					groups.add(new GroupApp(resultSet.getLong(1)));
    				}
    			}
    		}
    	}
    	return groups;
    }
    
    public static GroupApp addGroupApp (long id_tutor, String name, KindOfApp kindOfApp) throws SQLException{
    	long key;
    	try (PreparedStatement p = Utils.prepareStatementWithKey(
    			(String)"INSERT INTO group_app(id_tutor, name, id_kind_of_app) VALUES(?, ?, ?)")) {
    		try(Connection connection = p.getConnection()) {
    			p.setLong(1, id_tutor);
    			p.setString(2, name);
    			p.setLong(3, kindOfApp.getId());
    			p.executeUpdate();
    			key = Utils.getKey((PreparedStatement)p);
    			return new GroupApp(key);
    		}
    	}
    }
    
    public static GroupApp addGroupApp(User.Tutor tutor, String name, KindOfApp kindOfApp) throws SQLException {
    	return addGroupApp(tutor.getId(), name, kindOfApp);
    }
    
    public String getName() throws SQLException {
    	return getAttrString("name");
    }
    
    public User.Tutor getTutor() throws SQLException {
    	System.out.println(getAttrLong("id_tutor"));
    	return User.getTutor(getAttrLong("id_tutor"));
    }
    
    public KindOfApp getKindOfApp() throws SQLException {
    	return KindOfApp.getKindOfApp(getAttrLong("id_kind_of_app"));
    }
    
    
}
