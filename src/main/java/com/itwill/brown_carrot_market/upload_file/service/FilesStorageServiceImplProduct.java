package com.itwill.brown_carrot_market.upload_file.service;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.brown_carrot_market.dao.ProductImageDao;
import com.itwill.brown_carrot_market.dto.ProductImage;

@Service(value="FilesStorageServiceImplProduct")
public class FilesStorageServiceImplProduct implements FilesStorageServiceProduct{
	
	@Value("${product_img.dir}")
	private Path root;
	/*
	@Autowired
	@Qualifier("productImageDaoImpl")
	private ProductImageDao productImageDao;
	
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductImageDao productDao;
	*/
	public FilesStorageServiceImplProduct() throws Exception {
		System.out.println("#### FilesStorageServiceImplTest() : 디폴트생성자 호출  ");
	}

	@Override
	public void init() {
		try {
			Files.createDirectory(root);
		} catch (IOException e) {
			throw new RuntimeException(
					"Could not initialize folder for upload!");
		}
		
	}

	@Override
	public String save(MultipartFile file) {
		try {
			
			String newFileName=System.currentTimeMillis()+file.getOriginalFilename();
			
			//int p_no =productDao.insertProduct(map); 맵을 어떻게 꺼내오지?
			//productImageDao.insertProductImg(new ProductImage(0, newFileName, p_no));
			
			Files.copy(file.getInputStream(), this.root.resolve(newFileName),
					StandardCopyOption.REPLACE_EXISTING);
			return newFileName;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(
					"Could not store the file. Error: " + e.getMessage());
		}
	}

	@Override
	public Resource load(String filename) {
		try {
			Path file = root.resolve(filename);
			Resource resource = new UrlResource(file.toUri());

			if (resource.exists() || resource.isReadable()) {
				return resource;
			} else {
				throw new RuntimeException("Could not read the file!");
			}
		} catch (MalformedURLException e) {
			throw new RuntimeException("Error: " + e.getMessage());
		}
	}

	@Override
	public boolean delete(String filename) {
		File deleteFile = new File(root+"/"+filename);
		
		if(deleteFile.exists()) {
			System.out.println("삭제성공 : "+filename);
			return deleteFile.delete();
		}else {
			System.out.println("삭제실패 : "+filename);
			return false;
		}
	}
	

	@Override
	public void deleteAll() {
		FileSystemUtils.deleteRecursively(root.toFile());
		
	}

	@Override
	public Stream<Path> loadAll() {
			try {
				return Files.walk(this.root, 1)
						.filter(path -> !path.equals(this.root))
						.map((path) -> this.root.relativize(path));
			} catch (IOException e) {
				throw new RuntimeException("Could not load the files!");
			}
	}
	
	
	
	
}
