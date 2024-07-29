package com.leubao.api.category;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.leubao.dto.CategoryDTO;
import com.leubao.service.ICategoryService;

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
//	 @DeleteMapping("/api/delete-category")
//	    public void deleteCategory(@RequestBody long[] ids) {
//	        try {
//	            categoryService.deleteCategory(ids);
//	        } catch (IllegalStateException e) {
//	        }
//	    }
	
}
