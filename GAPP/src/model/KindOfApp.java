package model;

import java.sql.SQLException;
import model.Table;
import model.User;

public class KindOfApp
extends Table {
    private static final long serialVersionUID = -5396406978403194651L;

    public KindOfApp(long idGroup) {
        super("group", idGroup);
    }

    public User.Responsible getResponsible() throws SQLException {
        return User.getResponsible((long)this.getAttrLong("id_responsible"));
    }

    public void setResponsible(User.Responsible responsible) throws SQLException {
        this.setAttrLong("id_responsible", responsible.getId());
    }
}
