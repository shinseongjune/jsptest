package jsptest;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("shinseongjune.dev", "816438sa!!");
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}
