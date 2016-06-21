package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Table;
import model.User;
import model.User.Responsible;

public class KindOfApp
extends Table {
    private static final long serialVersionUID = -5396406978403194651L;

    public KindOfApp(long idGroup) {
        super("group", idGroup);
    }
    
    public String getName() throws SQLException {
    	return getAttrString("name");
    }

    public User.Responsible getResponsible() throws SQLException {
        return User.getResponsible(this.getAttrLong("id_responsible"));
    }

    public void setResponsible(User.Responsible responsible) throws SQLException {
        this.setAttrLong("id_responsible", responsible.getId());
    }
    
    public List<SkillGroup> getSkillGroups() throws SQLException {
    	LinkedList<SkillGroup> skillGroups = new LinkedList<>();
    	try(PreparedStatement p = 
    			Utils.prepareStatement("SELECT id_skill_group FROM skill_group WHERE id_kind_of_app = ?")) {
	    	try(ResultSet resultSet = p.executeQuery()) {
		    	while(resultSet.next()) {
		    		skillGroups.add(new SkillGroup(resultSet.getLong(1)));
		    	}
	    	}
    	}
    	return skillGroups;
    }
    
    public static List<KindOfApp> getKindOfApps() throws SQLException {
    	LinkedList<KindOfApp> kinds = new LinkedList<>();
        PreparedStatement p = Utils.prepareStatement("SELECT id_kind_of_app FROM kind_of_app");
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            kinds.add(new KindOfApp(resultSet.getLong(1)));
        }
        resultSet.close();
        p.close();
        return kinds;
    }
    
    public static KindOfApp addKindOfApp (String name, String description, long id_responsible) throws SQLException{
    	long key;
    	try (PreparedStatement p = Utils.prepareStatementWithKey(
				(String)"INSERT INTO kind_of_app(id_responsible, name, description) VALUES(?, ?, ?)")) {
			p.setLong(1, id_responsible);
			p.setString(2, name);
			p.setString(3, description);
			p.executeUpdate();
			key = Utils.getKey((PreparedStatement)p);
			return new KindOfApp(key);
		}
    }
    
    public static KindOfApp addKindOfApp (String name, String description, User.Responsible responsible) throws SQLException{
    	return addKindOfApp(name, description, responsible.getId());
    }
}
