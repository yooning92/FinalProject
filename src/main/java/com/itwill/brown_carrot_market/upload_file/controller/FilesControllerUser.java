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

import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.upload_file.message.ResponseMessage;
import com.itwill.brown_carrot_market.upload_file.model.FileInfo;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageService;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceUser;

@Controller
public class FilesControllerUser {

	@Autowired
	@Qualifier(value = "FilesStorageServiceImplUser")
	FilesStorageServiceUser storageService;

	@GetMapping("/test/multipart_form")
	public String mutipart_form() {
		return "multipart_form";
	}

	@PostMapping("/user/upload")
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

					message = "Uploaded the files successfully: " + fileNames+" newFileName"+newFileName;
				}else {
					message="Please select a valid mediaFile..";
				}
			}
			
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

	@GetMapping("/user/files")
	public ResponseEntity<List<FileInfo>> getListFiles() {
		List<FileInfo> fileInfos = storageService.loadAll().map(path -> {
			String filename = path.getFileName().toString();
			String url = MvcUriComponentsBuilder
					.fromMethodName(FilesControllerUser.class, "getFile",
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

	@GetMapping("/user/files/{filename:.+}")
	public ResponseEntity<Resource> getFile(@PathVariable String filename) {
		Resource file = storageService.load(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION,
						"attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}
	
	@PostMapping("/user/delete")
	public ResponseEntity<Map<String,Object>> deleteFiles(@RequestParam("user_profile")String fileName) {
		Map<String,Object> result = new HashMap();
		
		boolean deleteResult= storageService.delete(fileName);
		
		result.put("result",deleteResult);
		
		return ResponseEntity.status(HttpStatus.OK).body(result);
	}
}
	
