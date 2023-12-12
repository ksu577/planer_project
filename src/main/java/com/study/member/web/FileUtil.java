package com.study.member.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;
public class FileUtil {

    private static final String filePath = "/home/pc31/Docker/team3/imgDownload/";

//    @Value("#{util['file.upload.path']}")
//    private static String filePath;

    public static String modifyMember(MultipartHttpServletRequest Request) throws Exception {

        Iterator<String> iterator = Request.getFileNames();

        MultipartFile multipartFile = null;
        String originalFileName = "";
        String originalFileExtension = "";
        String storedFileName = "";

        String profile = "";


        File file = new File(filePath);
        if(file.exists() == false) {
            file.mkdirs();
        }

        while(iterator.hasNext()) {
            multipartFile = Request.getFile(iterator.next());
            if(multipartFile.isEmpty() == false) {
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = getRandomString() + originalFileExtension;
                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file);
                profile = storedFileName;
            }
        }
        return profile;
    }

    public static String getRandomString() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
}
