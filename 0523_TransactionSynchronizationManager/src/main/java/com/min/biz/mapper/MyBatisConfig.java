package com.min.biz.mapper;

import java.io.IOException;
import java.io.Reader;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.mapper.MapperFactoryBean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.ibatis.common.resources.Resources;


@Configuration
@MapperScan("com.min.biz.mapper")
public class MyBatisConfig {
	
	 private static Logger log = LoggerFactory.getLogger(MyBatisConfig.class);
	 private static SqlSessionFactory factory;
	 
		static {
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
	    public static SqlSessionFactory getFactory() {
	        return factory;
	    }	  

	 
	 
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
		  
	        return jdbc;
	  }
	  

    
    // SqlSessionFactoryBean 빈 정의 예시
	    @Bean
	    public SqlSessionFactory sqlSessionFactory() throws Exception {
	        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
	        sessionFactory.setDataSource(dataSource());

	        Resource configLocation = new ClassPathResource("classpath:MyBatisConfig.xml");
	        sessionFactory.setConfigLocation(configLocation);

	        return sessionFactory.getObject();
	    }
	    
	    @Bean
	    public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
	        return new SqlSessionTemplate(sqlSessionFactory);
	    }
	    
	     
	    
	    
}