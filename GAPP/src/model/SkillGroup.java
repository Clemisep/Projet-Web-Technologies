package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import model.KindOfApp;
import model.Skill;
import model.Table;
import model.Utils;

public class SkillGroup
extends Table {
    private static final long serialVersionUID = 54922831052286921L;

    public SkillGroup(long id) {
        super("skill_group", id);
    }
    
    public String getDescription() throws SQLException {
    	return getAttrString("description");
    }

    public static SkillGroup addSkillGroup(String name, KindOfApp kindOfApp) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO skill_group(id_kind_of_app, description) VALUES(?, ?)");
        p.setLong(1, kindOfApp.getId());
        p.setString(2, name);
        p.executeUpdate();
        long key = Utils.getKey(p);
        p.close();
		return new SkillGroup(key);
    }

    public List<Skill> getSkills() throws SQLException {
        LinkedList<Skill> skills = new LinkedList<Skill>();
        PreparedStatement p = Utils.prepareStatement("SELECT id_skill FROM skill WHERE id_skill_group = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            skills.add(Skill.getSkill(resultSet.getLong(1)));
        }
        return skills;
    }
    
    public static List<SkillGroup> getSkillGroups() throws SQLException {
    	LinkedList<SkillGroup> skillGroups = new LinkedList<>();
    	try(PreparedStatement p = Utils.prepareStatement("SELECT id_skill_group FROM skill_group")) {
	    	ResultSet resultSet = p.executeQuery();
	    	while(resultSet.next()) {
	    		skillGroups.add(new SkillGroup(resultSet.getLong(1)));
	    	}
    	}
    	return skillGroups;
    }
}