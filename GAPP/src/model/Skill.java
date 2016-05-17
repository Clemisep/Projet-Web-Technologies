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

    public Skill(long idSkill) {
        super("skill", idSkill);
    }

    public static Skill addSkill(SkillGroup skillGroup, String description) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO skill(id_skill_group, description) VALUES(?,?)");
        p.setLong(1, skillGroup.getId());
        p.setString(2, description);
        p.executeUpdate();
        return new Skill(Utils.getKey((PreparedStatement)p));
    }

    public String getDescription() throws SQLException {
        return this.getAttrString("description");
    }

    public void setDescription(String description) throws SQLException {
        this.setAttrString("description", description);
    }
}