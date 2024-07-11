package com.nongnghiepxanh.api.news;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nongnghiepxanh.dto.NewDTO;
import com.nongnghiepxanh.service.INewService;
import com.nongnghiepxanh.util.FileUploadUtil;

@RestController(value = "newAPIofAdmin")
public class NewAPI {
	@Autowired
	private INewService newService;

	@PostMapping("/api/create-new")
	public NewDTO createNew(@RequestPart("newDTO") NewDTO dto, @RequestPart("thumbnail") MultipartFile fileImg) {
		System.out.println(fileImg.getOriginalFilename());
		try {
			// Gọi hàm saveFile để lưu file
			String filePath = FileUploadUtil.saveFile(fileImg);
			// Lưu đường dẫn file vào cơ sở dữ liệu
			dto.setThumbnail(filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return newService.save(dto);
	}

	@PutMapping("/api/update-new")
	public NewDTO updateNew(@RequestPart("newDTO") NewDTO dto, @RequestPart("thumbnail") MultipartFile fileImg) {
		System.out.println(fileImg.getOriginalFilename());
		try {
			String filePath = FileUploadUtil.saveFile(fileImg);
			dto.setThumbnail(filePath);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return newService.save(dto);
	}

	@DeleteMapping("/api/delete-new")
	public void deleteNew(@RequestBody long[] ids) {
		newService.deleteNew(ids);
	}
}
