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

    public static SkillGroup addSkillGroup(KindOfApp kindOfApp, String name) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO skill_group(id_kind_of_app, description) VALUES(?,?)");
        p.setLong(1, kindOfApp.getId());
        p.setString(2, name);
        p.executeUpdate();
        return new SkillGroup(Utils.getKey((PreparedStatement)p));
    }

    public List<Skill> getSkills() throws SQLException {
        LinkedList<Skill> skills = new LinkedList<Skill>();
        PreparedStatement p = Utils.prepareStatement((String)"SELECT id_skill FROM skill WHERE id_skill_group = ?");
        p.setLong(1, this.getId());
        ResultSet resultSet = p.executeQuery();
        while (resultSet.next()) {
            skills.add(new Skill(resultSet.getLong(1)));
        }
        return skills;
    }
}