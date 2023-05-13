package com.min.project.common;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// SqlSession은 무조건 마이바티스가 사용하는구나 라고 자동적으로 생각하기 ! FactoryBean은 공장, 마이바티스 컨테이너를 만드는 공장 하나를 만든다는 의미
public class SqlSessionFactoryBean {
	private static SqlSessionFactory sessionFactory = null;
	// 마이바티스는 아이바티스 패키지에서 나온것
	// static 변수는 전체 시스템 메모리에 딱 하나만 존재하는걸 의미, 
	
	static {
		try {
			if(sessionFactory == null) {
				Reader reader = Resources.getResourceAsReader("sql-map-config.xml");
				sessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	// org.apache.ibatis.io : Resources 의 getResourceAsReader 매서드를 통해 메인 환경설정파일을 가져온다. 
	// 마이바티스 공장 생성 : SqlSessionFactoryBuilder 매서드를 통해 공장을 생성한다. 앞의 설정파일를 읽어들어 입력스트림을 설정한다.
	// sal-map-config 1) 데이터 소스 - 무슨 DB랑 연결할것인가? 2) SQL 맵파일을 설정 - 어떤 SQL을 사용할 수 있는지 가 마이바티스 메인설정파일에 적혀있다.
	
	// sqlSession은 마이바티스 컨테이너이다. 
	public static SqlSession getSqlSessionInstance() {
		return sessionFactory.openSession();
	}
}


// 외부에서 sqlsessionFactoryBean.getSqlSessionInstance 를 사용해서 CRUD를 사용할 수 있게 한다. 