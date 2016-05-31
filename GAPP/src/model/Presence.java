package model;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.Course;
import model.User;
import model.Utils;

public class Presence {
    private long idPresence;

    private Presence(long idPresence) {
        this.idPresence = idPresence;
    }

    public static Presence addPresence(Course course, User.Student student, boolean isPresent, String remark) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO presence(id_course, id_student, is_present, remark)VALUES(?, ?, ?, ?)");
        p.setLong(1, course.getId());
        p.setLong(2, student.getId());
        p.setBoolean(3, isPresent);
        p.setString(5, remark);
        p.executeUpdate();
        long key = Utils.getKey((PreparedStatement)p);
        p.close();
        return new Presence(key);
    }

    public long getId() {
        return this.idPresence;
    }
}