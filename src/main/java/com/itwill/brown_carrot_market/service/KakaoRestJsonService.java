package com.itwill.brown_carrot_market.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class KakaoRestJsonService  {

	private final String GRANT_TYPE= "authorization_code";
    private final String CLIENT_ID = "28023bfb18a5c5340b26afd6befa9050";
    private final String REDIRECT_URI= "http://119.207.178.242/brown_carrot_market/user_kakaologin";
    //private final String CLIENT_SECRET= "지정안한 상태";
    private final String TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	
	
	public KakaoRestJsonService() throws Exception {
		System.out.println("KakaoRestJsonService() : 디폴트생성자 호출  ");
	}

	public String getAccessTokenJsonData(String code){
        RestTemplate restTemplate = new RestTemplate();

        // 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity request = new HttpEntity(headers);

        // URI 빌더 사용
        UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.fromHttpUrl(TOKEN_URL)
                .queryParam("grant_type", GRANT_TYPE)
                .queryParam("client_id", CLIENT_ID)
                .queryParam("redirect_uri", REDIRECT_URI)
                .queryParam("code", code)
                /*.queryParam("client_secret", CLIENT_SECRET)*/;

        // 요청 URI과 헤더를 같이 전송
        //RestTemplate의 exchange() 메소드-> URI와 헤더를 원하는 전송 방식으로 전송가능
        ResponseEntity<String> responseEntity = restTemplate.exchange(
                uriComponentsBuilder.toUriString(),
                HttpMethod.POST,
                request,
                String.class
        );

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            return responseEntity.getBody();
        }
        return "error";
    }
}
