package model;

import java.sql.Date;
import java.sql.SQLException;

public interface Remark {
	public String getDescription() throws SQLException;
	public void setDescription(String description) throws SQLException;
	public Date getDate();
}
