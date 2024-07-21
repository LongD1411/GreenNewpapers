package com.nongnghiepxanh.api.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.nongnghiepxanh.dto.CategoryDTO;
import com.nongnghiepxanh.service.ICategoryService;

@RestController(value = "categoryAPIofAdmin")
public class CategoryAPI {
	@Autowired
	private ICategoryService categoryService;
	@PostMapping("/api/create-category")
	public CategoryDTO createCategory(@RequestBody CategoryDTO dto ) {
		return categoryService.save(dto);
				
	}
	@PutMapping("/api/update-category")
	public CategoryDTO updateCategory(@RequestBody CategoryDTO dto ) {
		return categoryService.save(dto);
				
	}
}
