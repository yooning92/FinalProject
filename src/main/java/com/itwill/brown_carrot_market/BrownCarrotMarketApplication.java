package com.itwill.brown_carrot_market;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@SpringBootApplication
public class BrownCarrotMarketApplication {

	public static void main(String[] args) {
		SpringApplication.run(BrownCarrotMarketApplication.class, args);
	}

	  @Bean public ServerEndpointExporter serverEndpointExporter() { return new
	  ServerEndpointExporter(); }

}
  