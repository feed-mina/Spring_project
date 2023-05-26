package com.min.biz.mapper;

import java.io.IOException;
import java.io.Reader;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.ibatis.common.resources.Resources;

// @MapperScan("com.min.biz.mapper")

@PropertySource("classpath:/datasource.properties")
@Configuration
@ComponentScan(basePackages = {"com.min","com.min.biz.board"})
public class MyBatisConfig {

	@Autowired
	 private ApplicationContext applicationContext;

	 private static Logger log = LoggerFactory.getLogger(MyBatisConfig.class);
	 

	 /*
	  * 		static {
	        try {
	        	String resource = "./MyBatisConfig.xml";
	        	Reader reader = Resources.getResourceAsReader(resource);
	            factory = new SqlSessionFactoryBuilder()
	                    .build(reader);
	        } catch (IOException e) {
	            log.info(">>> Mybatis configuration Error");
	            e.printStackTrace();
	        }
	    }

	  * */
	 
	    /*
    @Bean
    public org.apache.ibatis.session.Configuration myBatisConfiguration() throws Exception {
    	String configFile = "mybatis-config.xml"; // 설정 파일의 경로 또는 파일 이름
    	ClassPathResource resource = new ClassPathResource(configFile); // 설정 파일을 읽을 수 있는 ClassPathResource 객체 생성
    	InputStream inputStream = resource.getInputStream(); // 설정 파일의 InputStream을 가져옴

    	// 첫 번째 인수: 설정 파일을 읽을 수 있는 InputStream
    	// 두 번째 인수: 설정 파일의 경로 또는 파일 이름

    	
    	XMLConfigBuilder configBuilder = new XMLConfigBuilder(inputStream, configFile);
        return configBuilder.parse();
    }
    

	// 세 번째 인수: 추가적인 MyBatis 구성을 위한 프로퍼티 (옵션)

	// 필요에 따라 configBuilder를 사용하여 MyBatis 구성을 수정하거나 정보를 추출할 수 있음
	 **/
	  
	@Bean
	    public DataSource dataSource() {
	        DriverManagerDataSource jdbc = new DriverManagerDataSource();
	        		jdbc.setDriverClassName("org.h2.Driver");
	        		jdbc.setUrl("jdbc:h2:tcp://localhost/~/test");
	        		jdbc.setUsername("sa");
	        		jdbc.setPassword("");
	        		
	        		System.out.println(jdbc);
	        return jdbc;
	  }
	  

    
    // SqlSessionFactoryBean 빈 정의 예시
	// 마이바티스 설정1: SqlSessionFactory <-- SqlSessionFactoryBean
	/*
	 * 	SqlSessionFactory 객체 생성 <-- SqlSessionFactoryBean
 	이때 데이터소스 객체를 넘겨 받아서 처리해도 되고 아니면 setDataSource(DataSource())이렇게 해줘도 됨.
 	기본적인 설정 3가지
	setDataSource : 빌드된 DataSource를 셋팅
	setMapperLocations: SQL 구문이 작성된 *Mapper.xml의 경로를 정확히 등록.
	setTypeAliasesPackage : 인자로 Alias 대상 클래스가 위치한 패키지 경로 
	주의사항 ! 
	SqlSessionFactory에 저장할 Config 설정시 MApper 에서 사용하고자 하는 DTO, VO, Entity에 대해서 setTypeAliasesPackage 지정 필요
	만약 지정해주지 않는다면 aliases 찾지 못한다는 오류가 발생할 수 있음
	

	매퍼에 대한 리소스는 어디에서 가져오는지 ? ApplicationContext객체에서 가져올 수 있다. ApplicationContext는 쉽게 말해서 프레임워크 컨테치너라고 생각하면 됨. ApplicationContext는 애플리케이션이 스타트해서 끝나는 그 순간까지 이 애플리케이션에서 필요한 모든 자원들을 모아놓고 관리. 
	"classpath:/" java/main/resources 까지 다. 
	**/	
	
	
	    @Bean
	    public SqlSessionFactory sqlSessionFactory() throws Exception {
	        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource());
	        sessionFactory.setMapperLocations(applicationContext.getResources("classpath:/mappings/**/*Mapper.xml"));
	        sessionFactory.setTypeAliasesPackage("com.min.biz.mapper");
			
	      //  Resource configLocation = new ClassPathResource("classpath:MyBatisConfig.xml");
	      //  sessionFactory.setConfigLocation(configLocation);

    		System.out.println(sessionFactory.getObject());
	        return sessionFactory.getObject();
	    }
	    
	    @Bean
	    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) throws Exception{
 
	        return new SqlSessionTemplate(sqlSessionFactory);
	    }
	    
	     
	    
	    
}