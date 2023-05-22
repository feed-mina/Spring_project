package com.min.biz.cmm;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class AucSessionManager implements HttpSessionBindingListener {

	private static AucSessionManager sessionManager = null;

	@SuppressWarnings("rawtypes")
	private static Hashtable loginMembers = new Hashtable();

	private AucSessionManager() {
		super();
	}

	public static synchronized AucSessionManager getInstance() {
		if (sessionManager == null) {
			sessionManager = new AucSessionManager();
		}
		return sessionManager;
	}

	public boolean isLogIn(String sessionUniqId, String memberID) {

		boolean isLogIn = false;
		Enumeration<?> e = loginMembers.keys();

		String key = null;
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			String[] subKey = ((String) loginMembers.get(key)).split("@");
			if (subKey.length == 2) {
				if (memberID.equals(subKey[0]) && sessionUniqId.equals(subKey[1])) {
					isLogIn = true;
					break;
				}
			}
		}
		return isLogIn;
	}

	public boolean isUsing(String memberID) {
		boolean isUsing = false;
		Enumeration<?> e = loginMembers.keys();

		String key = null;
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			String[] subKey = ((String) loginMembers.get(key)).split("@");
			if (subKey.length == 2) {
				if (memberID.equals(subKey[0])) {
					isUsing = true;
					break;
				}
			}
		}

		return isUsing;
	}

	public boolean isOutUsing(String memberID) {
		boolean isOutUsing = false;
		Enumeration<?> e = loginMembers.keys();

		String key = null;
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			String[] subKey = ((String) loginMembers.get(key)).split("@");
			if (subKey.length == 2) {
				if (memberID.equals(subKey[0])) {
					loginMembers.remove(key);
					isOutUsing = true;
					break;
				}
			}
		}
		return isOutUsing;

	}

	@SuppressWarnings({ "static-access", "unchecked" })
	public void setSession(HttpSession session, String memberID) {
		loginMembers.put(session.getId(), memberID + "@" + session.getId());
		session.setAttribute("login", this.getInstance());
	}

	public void valueBound(HttpSessionBindingEvent event) {
	}
 


	public void valueUnbound(HttpSessionBindingEvent event) {
		loginMembers.remove(event.getSession().getId());

	}
}
