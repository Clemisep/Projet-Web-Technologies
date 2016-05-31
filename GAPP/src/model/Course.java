package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.CourseType;
import model.KindOfApp;
import model.Utils;

public class Course
implements Serializable {
    private static final long serialVersionUID = -5241059839846933077L;
    private long idCourse;

    private Course(long idCourse) {
        this.idCourse = idCourse;
    }

    public long getId() {
        return this.idCourse;
    }

    public static Course addCourse(CourseType courseType, Date date, long duration, KindOfApp groupApp) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey((String)"INSERT INTO course(type, date, duration, idGroupApp)VALUES(?, ?, ?, ?)");
        p.setString(1, courseType.toString());
        p.setDate(2, date);
        p.setLong(3, duration);
        p.setLong(4, groupApp.getId());
        p.executeUpdate();
        long key = Utils.getKey((PreparedStatement)p);
        p.close();
        return new Course(key);
    }
}
