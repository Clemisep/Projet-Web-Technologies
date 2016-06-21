package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.CourseType;
import model.KindOfApp;
import model.Utils;

public class Course extends Table
implements Serializable {
    private static final long serialVersionUID = -5241059839846933077L;

    private Course(long idCourse) {
    	super("course", idCourse);
    }
    
    public Date getDate() throws SQLException {
    	return getAttrDate("date");
    }
    
    public long getDuration() throws SQLException {
    	return getAttrLong("duration");
    }
    
    public CourseType getCourseType() throws SQLException {
    	return CourseType.valueOf(getAttrString("type"));
    }
    
    public GroupApp getGroupApp() throws SQLException {
    	return new GroupApp(getAttrLong("id_group_app"));
    }

    public static Course addCourse(CourseType courseType, Date date, long duration, KindOfApp groupApp) throws SQLException {
        PreparedStatement p = Utils.prepareStatementWithKey(
        		"INSERT INTO course(type, date, duration, idGroupApp)VALUES(?, ?, ?, ?)");
        p.setString(1, courseType.toString());
        p.setDate(2, date);
        p.setLong(3, duration);
        p.setLong(4, groupApp.getId());
        p.executeUpdate();
        long key = Utils.getKey(p);
        p.close();
        return new Course(key);
    }
}
