package model;

import java.sql.SQLException;
import java.util.List;

public class Skill extends Table {
	
	public Skill(long idSkill) {
		super("skill", idSkill);
	}
	
	public List<SubSkill> getSubSkills() {
		return null; // TODO
	}
	
	public SubSkill addSubSkill() {
		return null; // TODO
	}
	
	public String getDescription() throws SQLException {
		return getAttrString("description");
	}
	
	public void setDescription(String description) throws SQLException {
		setAttrString("description", description);
	}
}
