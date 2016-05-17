package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Skill;
import model.Table;
import model.User;
import model.Utils;

public class SkillInstance
extends Table {
    private static final long serialVersionUID = -1120931527679582275L;

    public SkillInstance(long id) {
        super("skill_instance", id);
    }

    public static SkillInstance addSkillInstance(User.Student student, Skill skill, long level) throws SQLException {
        PreparedStatement p = Utils.prepareStatement((String)"INSERT INTO skill_instance(id_skill, id_student, id_level, tutor_comment, student_comment) VALUES(?,?,?,?,?)");
        p.setLong(1, skill.getId());
        p.setLong(1, student.getId());
        p.setLong(3, level);
        p.setString(4, "");
        p.setString(5, "");
        p.executeUpdate();
        return new SkillInstance(Utils.getKey((PreparedStatement)p));
    }
}