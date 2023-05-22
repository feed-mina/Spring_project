package com.min.biz.cmm;

import org.hibernate.criterion.Example;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractServiceImpl {
	@Autowired(required=false)
	private Example e;
}
