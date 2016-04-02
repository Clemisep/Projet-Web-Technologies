package model;

public class BadArgumentException extends Exception {
	private static final long serialVersionUID = 8059329475865916108L;
	
	public BadArgumentException(String description) {
		super(description);
	}
}
