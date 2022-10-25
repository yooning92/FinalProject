package com.itwill.brown_carrot_market.upload_file.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceChat;

@Controller
public class FileControllerChat {
	@Autowired
	@Qualifier(value="FilesStorageServiceImplChat")
	FilesStorageServiceChat storageService;
	
	@GetMapping("/chat_photo")
	public String chat_image_form() {
		return "chat_photo";
	}
	
	@GetMapping("/chat_image_sizeUp")
	public String chat_image_sizeUp() {
		return "chat_img_sizeUp";
	}
	
	@PostMapping("/chat_upload")
	public ResponseEntity<Map<String,Object>> uploadFiles(
			@RequestParam("files") MultipartFile[] files) {
		
		Map<String,Object> result = new HashMap();
		
		System.out.println(files.length);
		// storageService.deleteAll();
		// storageService.init();
		String message = "";
		String newFileName= "";
		try {
			List<String> fileNames = new ArrayList<>();

			for (MultipartFile file : files) {
				System.out.println(file.isEmpty());
				if (!file.isEmpty()) {
					newFileName= storageService.save(file);
					fileNames.add(file.getOriginalFilename());
				}
			}
			
			message = "Uploaded the files successfully (CHAT): " + fileNames+" newFileName"+newFileName;
			
			result.put("message", message);
			result.put("newFileName", newFileName);
			
			//return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			return ResponseEntity.status(HttpStatus.OK).body(result);
		
		} catch (Exception e) {
			e.printStackTrace();
			message = "Fail to upload files!";
			result.put("message", message);
			
			//return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
			return ResponseEntity.status(HttpStatus.OK).body(result);
		}
	}

}
