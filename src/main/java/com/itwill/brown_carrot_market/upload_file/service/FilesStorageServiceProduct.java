package com.itwill.brown_carrot_market.upload_file.service;

import java.nio.file.Path;
import java.util.stream.Stream;

import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

public interface FilesStorageServiceProduct {
	
	  public void init();

	  public String save(MultipartFile file);

	  public Resource load(String filename);

	  public boolean delete(String filename);
	  
	  public void deleteAll();

	  public Stream<Path> loadAll();
}
