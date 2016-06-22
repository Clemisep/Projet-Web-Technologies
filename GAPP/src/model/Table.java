package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Utils;

public abstract class Table
implements Serializable {
    private static final long serialVersionUID = -8754022998928748614L;
    private String tableName;
    private long id;

    public Table(String tableName, long id) {
        this.tableName = tableName;
        this.id = id;
    }

    public long getId() {
        return this.id;
    }

    private ResultSet getSelect(String attrName) throws SQLException {
    	PreparedStatement p = Utils.prepareStatement("SELECT " + attrName + " FROM " + this.tableName + " WHERE id_" + this.tableName + " = ?");    			p.setLong(1, this.id);
		ResultSet resultSet = p.executeQuery();
		resultSet.next();
		return resultSet;
    }

    public String getAttrString(String attrName) throws SQLException {
    	String attr;
    	ResultSet resultSet = getSelect(attrName);
    	try(Statement statement = resultSet.getStatement()) {
    		try(Connection connection = statement.getConnection()) {
    			attr = resultSet.getString(1);
    			return attr;
    		}
    	}
    }

    public void setAttrString(String attrName, String value) throws SQLException {
    	try(PreparedStatement p = Utils.prepareStatement("UPDATE " + this.tableName + " SET " + attrName + " = ? WHERE id_" + this.tableName + " = ?")){
    		try(Connection connection = p.getConnection()){
    			p.setString(1, value);
    			p.setLong(2, this.id);
    			p.executeUpdate();
    		}
    	}
    }

    public long getAttrLong(String attrName) throws SQLException {
    	ResultSet resultSet = getSelect(attrName);
    	try(Statement statement = resultSet.getStatement()) {
    		try(Connection connection = statement.getConnection()) {
    			return resultSet.getLong(1);
    		}
    	}
    }

    public void setAttrLong(String attrName, long value) throws SQLException {
    	try(PreparedStatement p = Utils.prepareStatement("UPDATE " + this.tableName + " SET " + attrName + " = ? WHERE id_" + this.tableName + " = ?")){
    		try(Connection connection = p.getConnection()){
    			p.setLong(1, value);
    			p.setLong(2, this.id);
    			p.executeUpdate();
    		}
    	}
    }

    public Date getAttrDate(String attrName) throws SQLException {
        ResultSet resultSet = getSelect(attrName);
    	try(Statement statement = resultSet.getStatement()) {
    		try(Connection connection = statement.getConnection()) {
    			return resultSet.getDate(1);
    		}
    	}
    }

    public void setAttrDate(String attrName, Date value) throws SQLException {
    	try(PreparedStatement p = Utils.prepareStatement("UPDATE " + this.tableName + " SET " + attrName + " = ? WHERE id_" + this.tableName + " = ?")){
    		try(Connection connection = p.getConnection()){
    			p.setDate(1, value);
    			p.setLong(2, this.id);
    			p.executeUpdate();
    		}
    	}
    }

    public void remove() throws SQLException {
    	try(PreparedStatement p = Utils.prepareStatement("DELETE FROM " + this.tableName + " WHERE id_" + this.tableName + " = ?")){
    		try(Connection connection = p.getConnection()){
    			p.setLong(1, this.id);
    			p.executeUpdate();
    		}
    	}
    }
}
