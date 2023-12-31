package com.study.product.service;

import com.study.common.vo.PagingVO;
import com.study.common.vo.SearchVO;
import com.study.member.vo.MemberVO;
import com.study.product.dao.BuyingDao;
import com.study.product.dao.ProductDao;
import com.study.product.vo.ProductVO;
import com.study.product.vo.SaveCartVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductServiceImple implements IproductService {

    @Autowired
    ProductDao productDao;

    @Autowired
    BuyingDao buyingDao;


    @Value("#{util['file.upload.path']}")
    private String filePath;

    // 1. 상품 추가
    @Override
    public void insert(ProductVO productVO, MultipartFile imgFile) throws IOException {
        String oriImgName = imgFile.getOriginalFilename();
        String imgName = "";

        // UUID 를 이용하여 파일명 새로 생성
        // UUID - 서로 다른 객체들을 구별하기 위한 클래스
        UUID uuid = UUID.randomUUID();

        String savedFileName = uuid + "_" + oriImgName; // 파일명 -> imgName

        imgName = savedFileName;

        File saveFile = new File(filePath, imgName);

        imgFile.transferTo(saveFile);

        productVO.setImg(imgName);
        productVO.setImgPath("/imgDownload");

        System.out.println(productVO);

        productDao.insertproduct(productVO);
    }

    // 2. 상품 목록 ( 미니샾 )
    @Override
    public List<ProductVO> getprodList(PagingVO paging, SearchVO search) {
        int totalRowCount = productDao.getTotalRowCount(paging, search);

        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        return productDao.getprodList(paging, search);

    }

    // 3. 상품 지우기
    @Override
    public void delete(int productId) {
        productDao.delete(productId);
    }

    // 4. 상품 수정
    @Override
    public void updateproduct(ProductVO productVO, MultipartFile imgFile) throws IOException {

        String oriImgName = imgFile.getOriginalFilename();
        String imgName = "";

        String projectPath = System.getProperty("user.dir") + "/imgDownload/";

        // UUID 를 이용하여 파일명 새로 생성
        // UUID - 서로 다른 객체들을 구별하기 위한 클래스
        UUID uuid = UUID.randomUUID();

        String savedFileName = uuid + "_" + oriImgName; // 파일명 -> imgName

        imgName = savedFileName;

        File saveFile = new File(projectPath, imgName);

        imgFile.transferTo(saveFile);

        productVO.setImg(imgName);
        productVO.setImgPath("/imgDownload");

        System.out.println(productVO);

        productDao.updateproduct(productVO);
    }

    // 5. 상품 상세
    @Override
    public ProductVO getproduct(int productId) {
        return productDao.getproduct(productId);
    }

    @Override
    public void getSave(SaveCartVO saveCartVO) throws Exception {

        int sibalSeGGi = productDao.getSaveCartKey();
        saveCartVO.setSaveNum(sibalSeGGi);

        productDao.insertSaveCart(saveCartVO);
        productDao.updateProductBuy(saveCartVO);
    }


    //여기서부터 11월 23일
    @Override
    public SaveCartVO viewUserInfo(String id) {
        SaveCartVO userinfo = productDao.selectUserInfo(id);
        return userinfo;
    }

    @Override
    public List<ProductVO> viewProductInfo(String productid) {
        List<ProductVO> productinfo = productDao.selectProductInfo(productid);
        return productinfo;
    }

    @Override
    public List<SaveCartVO> buyingMemberInfo(PagingVO paging, SearchVO search) {
        int totalRowCount = buyingDao.getTotalRowCount(paging, search);
        paging.setTotalRowCount(totalRowCount);
        paging.pageSetting();
        List<SaveCartVO> buyingMemberList = buyingDao.getsavecartList(paging, search);
        return buyingMemberList;
    }

}
