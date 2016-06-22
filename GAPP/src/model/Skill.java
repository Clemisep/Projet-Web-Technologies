package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.SkillGroup;
import model.Table;
import model.Utils;

public class Skill
extends Table
implements Serializable {
    private static final long serialVersionUID = -6897970698021020513L;

    private Skill(long idSkill) {
        super("skill", idSkill);
    }
    
    @Override
    public void remove() throws SQLException {
    	for (SkillInstance skillInstance : getSkillInstances()) {
			skillInstance.remove();
		}
    	super.remove();
    }
    
    public static Skill getSkill(long idSkill) {
    	return new Skill(idSkill);
    }
    
    public List<SkillInstance> getSkillInstances() throws SQLException {
    	LinkedList<SkillInstance> skillInstances = new LinkedList<SkillInstance>();
		try (PreparedStatement p =
				Utils.prepareStatement((String)"SELECT id_skill_instance FROM skill_instance WHERE id_skill = ?")) {
			p.setLong(1, getId());
			try (ResultSet resultSet = p.executeQuery()) {
				while (resultSet.next()) {
					skillInstances.add(new SkillInstance(resultSet.getLong(1)));
				}
			}
		}
		return skillInstances;
    }
    
    public SkillGroup getSkillGroup() throws SQLException {
    	return SkillGroup.getSkillGroup(getAttrLong("id_skill_group"));
    }

    public static Skill addSkill(SkillGroup skillGroup, String description) throws SQLException {
    	try(PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO skill(id_skill_group, description) VALUES(?,?)")) {
    		try(Connection connection = p.getConnection()) {
    			p.setLong(1, skillGroup.getId());
    			p.setString(2, description);
    			p.executeUpdate();
    			Skill skill = new Skill(Utils.getKey((PreparedStatement)p));
    			p.close();
    			return skill;
    		}
    	}
    }

    public String getDescription() throws SQLException {
        return this.getAttrString("description");
    }

    public void setDescription(String description) throws SQLException {
        this.setAttrString("description", description);
    }
}