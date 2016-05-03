package model;

import java.sql.SQLException;

public class SubSkill extends Table {
	
	public SubSkill(long idSubSkill) {
		super("sub_skill", idSubSkill);
	}
	
	public String getDescription() throws SQLException {
		return getAttrString("description");
	}
	
	public void setDescription(String description) throws SQLException {
		setAttrString("description", description);
	}
}
