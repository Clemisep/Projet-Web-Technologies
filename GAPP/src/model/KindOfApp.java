package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Table;
import model.User;

public class KindOfApp
extends Table {
    private static final long serialVersionUID = -5396406978403194651L;

    public KindOfApp(long idGroup) {
        super("group", idGroup);
    }

    public User.Responsible getResponsible() throws SQLException {
        return User.getResponsible((long)this.getAttrLong("id_responsible"));
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
        PreparedStatement p = Utils.prepareStatement((String)"SELECT id_kind_of_app FROM kind_of_app");
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            kinds.add(new KindOfApp((long)resultSet.getLong(1)));
        }
        resultSet.close();
        p.close();
        return kinds;
    }
}
