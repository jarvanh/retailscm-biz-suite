package com.skynet.bootstrap;

import com.terapico.uccaf.UCInvocationServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.boot.autoconfigure.elasticsearch.rest.RestClientAutoConfiguration;
<<<<<<< HEAD
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
=======
import org.springframework.boot.autoconfigure.elasticsearch.rest.RestClientAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.kafka.KafkaAutoConfiguration;
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.servlet.DispatcherServlet;

<<<<<<< HEAD
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
=======
@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class, RestClientAutoConfiguration.class, KafkaAutoConfiguration.class})
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
@ImportResource(locations = {"classpath:/META-INF/spring.xml", "classpath:/META-INF/online-system.xml"})
@ServletComponentScan(basePackageClasses = {UCInvocationServlet.class})
public class AppEntrance {
    public static void main(String[] args) {
        SpringApplication.run(AppEntrance.class, args);
    }

<<<<<<< HEAD
    @Bean
    public ServletRegistrationBean dispatcherRegistration(DispatcherServlet dispatcherServlet) {
        ServletRegistrationBean reg = new ServletRegistrationBean(dispatcherServlet);
        reg.getUrlMappings().clear();
        reg.addUrlMappings("*.css");
        reg.addUrlMappings("*.txt");
        reg.addUrlMappings("*.js");
        reg.addUrlMappings("*.jpg");
        return reg;
    }
=======
>>>>>>> ea67698ef1c4e94c89147baaf9f93aa768973fbe
}
