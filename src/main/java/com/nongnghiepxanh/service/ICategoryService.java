package com.nongnghiepxanh.service;

import java.util.List;
import java.util.Map;

import com.nongnghiepxanh.dto.CategoryDTO;
import com.nongnghiepxanh.entity.CategoryEntity;

public interface ICategoryService {
	Map<String,String> findAll();
	List<CategoryDTO> topCategory(String type);
	List<CategoryDTO> findAllCategory();
	List<CategoryDTO> findAllCategoryWorking();
	CategoryDTO findOneByCategoryCode(String code);
	CategoryDTO findOneByID(Long id);
	CategoryDTO save(CategoryDTO dto);
}
