package com.devpro.conf;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * Sử dụng mô hình MVC<Model, View, Controller>.
 * 
 * @author admin
 *
 */
@Configuration // -> tạo ra 1 bean tên webConf và được spring-container quản lí.
				// -> đồng thời module web sẽ biết được đây là file cấu hình của web.
public class WebConf implements WebMvcConfigurer {

	// cấu hình cho MVC biết chỗ folder để lấy view trả về cho Browser.
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/"); // thư mục gốc chứa các file jsp.
		bean.setSuffix(".jsp");
		return bean;
	}

	/**
	 * Hàm này sẽ báo cho module web biết nơi để View(Jsp) biết load static
	 * resources(css, js) classpath: <-> src/main/resources
	 */
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/css/**").addResourceLocations("classpath:/META-INF/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("classpath:/META-INF/js/");
		registry.addResourceHandler("/image/**").addResourceLocations("classpath:/META-INF/image/");
		registry.addResourceHandler("/vendor/**").addResourceLocations("classpath:/META-INF/vendor/");
		registry.addResourceHandler("/assets/**").addResourceLocations("classpath:/META-INF/assets/");
		registry.addResourceHandler("/summernote/**").addResourceLocations("classpath:/META-INF/summernote/");
		registry.addResourceHandler("/admins/**").addResourceLocations("classpath:/META-INF/admin/");
		registry.addResourceHandler("/file/upload/**").addResourceLocations("file:D:\\Template\\Java_Web_DevPro\\com.devpro.shop11\\upload\\");
	}
	
}
