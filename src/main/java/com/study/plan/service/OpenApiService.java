package com.study.plan.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.study.plan.vo.ApiVO;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class OpenApiService {
    private static final String API_KEY = "Ph31LO%2B4ot2uxcuPde3w%2Bqum4o9RrULLSc8xwy7t%2BoUd08rMdChFiDGjiYrQgt%2BL2p7ibiNlOzmTs5ByuJ5HjQ%3D%3D"; // 공공데이터 포털에서 발급받은 API 키


    public List<ApiVO> getTourismData(String search) throws UnsupportedEncodingException, JsonProcessingException {
        try {
            String apiUrl = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1";
            String parameters = "?serviceKey=" + API_KEY + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=A&keyword=" + URLEncoder.encode(search, "UTF-8");
            System.out.println(API_KEY);
            RestTemplate restTemplate = new RestTemplate();
            String jsonData = restTemplate.getForObject(apiUrl + parameters, String.class);

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(jsonData);

            JsonNode itemsNode = rootNode.path("response").path("body").path("items").path("item");

            List<ApiVO> apiVOList = new ArrayList<>();

            for (JsonNode itemNode : itemsNode) {
                ApiVO apiVO = new ApiVO();
                apiVO.setAddr1(itemNode.path("addr1").asText());
                apiVO.setFirstImage(itemNode.path("firstimage").asText());
                apiVO.setTitle(itemNode.path("title").asText());

                apiVOList.add(apiVO);
            }

            return apiVOList;

        } catch (
                Exception e) {
            e.printStackTrace();
            // 예외 처리
            return Collections.emptyList();
        }
    }


}
