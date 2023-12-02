//package com.study.property;
//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//@Configuration
//public class JasyptConfig {
//
//
////    https://velog.io/@iniestar/properties-encrypt 참고 블로그
//
//    @Value("${jasypt.encryptor.password}")
//    private String password;
//
//
//    @Bean("jasyptStringEncryptor")
//    public StringEncryptor stringEncryptor() {
//        PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
//        SimpleStringPBEConfig config = new SimpleStringPBEConfig();
//        config.setPassword(password); // 암호화 키 값
//        config.setAlgorithm("PBEWithMD5AndDES"); // 암호 알고리즘
//        config.setKeyObtentionIterations("1000"); // PBE 해쉬 횟수
//        config.setPoolSize("1");
//        config.setProviderName("SunJCE");
//        config.setSaltGeneratorClassName("org.jasypt.salt.RandomSaltGenerator");
//        config.setIvGeneratorClassName("org.jasypt.iv.NoIvGenerator");
//        config.setStringOutputType("base64");
//        encryptor.setConfig(config);
//        return encryptor;
//
//
//}
