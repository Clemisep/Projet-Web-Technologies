package model;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import model.GroupApp;
import model.Remark;
import model.Table;
import model.Utils;

public class GroupRemark
extends Table
implements Remark,
Serializable {
    private static final long serialVersionUID = -2472077889647449020L;

    public GroupRemark(long idRemark) {
        super("group_remark", idRemark);
    }

    public static GroupRemark addGroupRemark(GroupApp groupApp, String description) throws SQLException {
        PreparedStatement p = Utils.prepareStatement((String)"INSERT INTO group_remark(id_group_app, remark, date)");
        p.setLong(1, groupApp.getId());
        p.setString(2, description);
        p.setDate(3, new java.sql.Date(Calendar.getInstance().getTime().getTime()));
        p.executeUpdate();
        return new GroupRemark(Utils.getKey((PreparedStatement)p));
    }

    public String getDescription() throws SQLException {
        return this.getAttrString("description");
    }

    public void setDescription(String description) throws SQLException {
        this.setAttrString("description", description);
    }

    public GroupApp getGroupApp() throws SQLException {
        return new GroupApp(this.getAttrLong("id_group_app"));
    }

    public java.sql.Date getDate() throws SQLException {
        return this.getAttrDate("date");
    }
}
