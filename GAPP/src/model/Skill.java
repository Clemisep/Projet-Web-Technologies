package model;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
    
    public static Skill getSkill(long idSkill) {
    	return new Skill(idSkill);
    }
    
    public SkillGroup getSkillGroup() throws SQLException {
    	return SkillGroup.getSkillGroup(getAttrLong("id_skill_group"));
    }

    public static Skill addSkill(SkillGroup skillGroup, String description) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey("INSERT INTO skill(id_skill_group, description) VALUES(?,?)");
        p.setLong(1, skillGroup.getId());
        p.setString(2, description);
        p.executeUpdate();
        Skill skill = new Skill(Utils.getKey((PreparedStatement)p));
        p.close();
		return skill;
    }

    public String getDescription() throws SQLException {
        return this.getAttrString("description");
    }

    public void setDescription(String description) throws SQLException {
        this.setAttrString("description", description);
    }
}