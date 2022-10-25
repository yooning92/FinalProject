package com.itwill.brown_carrot_market.upload_file.controller;

import java.net.URL;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import com.itwill.brown_carrot_market.dto.ReviewImage;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.upload_file.message.ResponseMessage;
import com.itwill.brown_carrot_market.upload_file.model.FileInfo;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageService;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceUser;

@Controller
public class FilesControllerReview {

	@Autowired
	@Qualifier(value = "FilesStorageServiceImplReview")
	FilesStorageServiceUser storageService;

	@GetMapping("/test/multipart_form_dragndrop")
	public String mutipart_form() {
		return "multipart_form";
	}

	@PostMapping("/review/upload")
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
			List<ReviewImage> reviewImageList = new ArrayList<>();

			for (MultipartFile file : files) {
				System.out.println(file.isEmpty());
				if (!file.isEmpty()) {
					fileNames.add(file.getOriginalFilename());
					newFileName= storageService.save(file);
					
					ReviewImage reviewImage = new ReviewImage();
					reviewImage.setReview_img_name(newFileName);
					reviewImageList.add(reviewImage);

					message = "Uploaded the files successfully: " + fileNames+" newFileName: "+newFileName+"reviewImageList: "+reviewImageList;
					System.out.println(message);
				}else {
					message="Please select a valid mediaFile..";
				}
			}
			
			System.out.println("newFileNames: "+reviewImageList);
			result.put("message", message);
			result.put("newFileNames", reviewImageList);
			result.put("fileNames", fileNames);
			
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

	@GetMapping("/review/files")
	public ResponseEntity<List<FileInfo>> getListFiles() {
		List<FileInfo> fileInfos = storageService.loadAll().map(path -> {
			String filename = path.getFileName().toString();
			String url = MvcUriComponentsBuilder
					.fromMethodName(FilesControllerReview.class, "getFile",
							path.getFileName().toString())
					.build().toString();

			return new FileInfo(filename, url);
		}).collect(Collectors.toList());

		return ResponseEntity.status(HttpStatus.OK).body(fileInfos);
	}
	/*
	 * @GetMapping("/view") public String view(Model model) {
	 * 
	 * List<FileEntity> files = fileRepository.findAll();
	 * model.addAttribute("all",files); return "view"; }
	 */

	@GetMapping("/review/files/{filename:.+}")
	public ResponseEntity<Resource> getFile(@PathVariable String filename) {
		Resource file = storageService.load(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}
	
	@PostMapping("/review/delete")
	public ResponseEntity<Map<String,Object>> deleteFiles(@RequestParam("reviewImageList")List<ReviewImage> reviewImageList) {
		Map<String,Object> resultMap = new HashMap();
		List<Boolean> result = new ArrayList();
		boolean deleteResult= false;
		if(reviewImageList!=null) {
			for (ReviewImage reviewImage : reviewImageList) {
				deleteResult= storageService.delete(reviewImage.getReview_img_name());
			}
			result.add(deleteResult);
		}
		resultMap.put("result",result);
		return ResponseEntity.status(HttpStatus.OK).body(resultMap);
	}
	
/*	
	@PostMapping("/review/delete")
	public ResponseEntity<Map<String,Object>> deleteFiles(@RequestParam("reviewImageList")List<String> fileNames) {
		Map<String,Object> resultMap = new HashMap();
		List<Boolean> result = new ArrayList();
		boolean deleteResult= false;
		if(fileNames!=null) {
			for (String fileName : fileNames) {
				deleteResult= storageService.delete(fileName);
			}
			result.add(deleteResult);
		}
		resultMap.put("result",result);
		return ResponseEntity.status(HttpStatus.OK).body(resultMap);
	}
*/	
}
	
